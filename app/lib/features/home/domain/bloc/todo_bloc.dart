import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:rxdart/rxdart.dart';
import '../../../../core/db/app_database.dart';
import '../../../../core/models/enums.dart';
import '../../../sync/data/repositories/todo_repository.dart';
import '../../../sync/data/repositories/tag_repository.dart';

// Events
abstract class TodoEvent extends Equatable {
  const TodoEvent();
  @override
  List<Object?> get props => [];
}

class LoadTodos extends TodoEvent {}

class ChangeViewFilter extends TodoEvent {
  final TodoViewFilter filter;
  const ChangeViewFilter(this.filter);
  @override
  List<Object?> get props => [filter];
}

class ChangeTagFilter extends TodoEvent {
  final String? tagFilter;
  const ChangeTagFilter(this.tagFilter);
  @override
  List<Object?> get props => [tagFilter];
}

// States
abstract class TodoState extends Equatable {
  const TodoState();
  @override
  List<Object?> get props => [];
}

class TodoInitial extends TodoState {}

class TodoLoading extends TodoState {}

class TodoLoaded extends TodoState {
  final List<TodoWithTags> allTodos;
  final List<TodoWithTags> viewTodos;
  final List<TodoWithTags> overdueTodos;
  final List<Tag> allTags;
  final TodoViewFilter activeFilter;
  final String? activeTagFilter;

  const TodoLoaded({
    required this.allTodos,
    required this.viewTodos,
    required this.overdueTodos,
    required this.allTags,
    this.activeFilter = TodoViewFilter.inbox,
    this.activeTagFilter,
  });

  @override
  List<Object?> get props => [allTodos, viewTodos, overdueTodos, allTags, activeFilter, activeTagFilter];
}

class TodoError extends TodoState {
  final String message;
  const TodoError(this.message);
  @override
  List<Object?> get props => [message];
}

// Bloc
class TodoBloc extends Bloc<TodoEvent, TodoState> {
  final TodoRepository todoRepository;
  final TagRepository tagRepository;

  TodoBloc({
    required this.todoRepository,
    required this.tagRepository,
  }) : super(TodoInitial()) {
    on<LoadTodos>(_onLoadTodos);
    on<ChangeViewFilter>(_onChangeViewFilter);
    on<ChangeTagFilter>(_onChangeTagFilter);
  }

  Future<void> _onLoadTodos(LoadTodos event, Emitter<TodoState> emit) async {
    emit(TodoLoading());
    try {
      final combinedStream = Rx.combineLatest2<List<TodoWithTags>, List<Tag>, Map<String, dynamic>>(
        todoRepository.watchTodos(),
        tagRepository.watchTags(),
        (todos, tags) => {'todos': todos, 'tags': tags},
      );

      await emit.forEach<Map<String, dynamic>>(
        combinedStream,
        onData: (data) {
          final todos = data['todos'] as List<TodoWithTags>;
          final tags = data['tags'] as List<Tag>;
          
          final filter = state is TodoLoaded 
              ? (state as TodoLoaded).activeFilter 
              : TodoViewFilter.inbox;
          
          final tagFilter = state is TodoLoaded
              ? (state as TodoLoaded).activeTagFilter
              : null;
          
          final filtered = _applyFilter(todos, filter, tagFilter);
          return TodoLoaded(
            allTodos: todos,
            viewTodos: filtered['view']!,
            overdueTodos: filtered['overdue']!,
            allTags: tags,
            activeFilter: filter,
            activeTagFilter: tagFilter,
          );
        },
        onError: (error, stackTrace) => TodoError(error.toString()),
      );
    } catch (e) {
      emit(TodoError(e.toString()));
    }
  }

  void _onChangeViewFilter(ChangeViewFilter event, Emitter<TodoState> emit) {
    if (state is TodoLoaded) {
      final currentState = state as TodoLoaded;
      final filtered = _applyFilter(currentState.allTodos, event.filter, currentState.activeTagFilter);
      emit(TodoLoaded(
        allTodos: currentState.allTodos,
        viewTodos: filtered['view']!,
        overdueTodos: filtered['overdue']!,
        allTags: currentState.allTags,
        activeFilter: event.filter,
        activeTagFilter: currentState.activeTagFilter,
      ));
    }
  }

  void _onChangeTagFilter(ChangeTagFilter event, Emitter<TodoState> emit) {
    if (state is TodoLoaded) {
      final currentState = state as TodoLoaded;
      final filtered = _applyFilter(currentState.allTodos, currentState.activeFilter, event.tagFilter);
      emit(TodoLoaded(
        allTodos: currentState.allTodos,
        viewTodos: filtered['view']!,
        overdueTodos: filtered['overdue']!,
        allTags: currentState.allTags,
        activeFilter: currentState.activeFilter,
        activeTagFilter: event.tagFilter,
      ));
    }
  }

  Map<String, List<TodoWithTags>> _applyFilter(List<TodoWithTags> todos, TodoViewFilter filter, String? tagFilter) {
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);

    List<TodoWithTags> baseViewTodos = [];

    switch (filter) {
      case TodoViewFilter.inbox:
        baseViewTodos = todos.where((t) => t.todo.status != TodoStatus.completed && t.todo.dueDate == null && t.todo.parentExternalId == null).toList();
        break;

      case TodoViewFilter.today:
        baseViewTodos = todos.where((t) {
          if (t.todo.status == TodoStatus.completed || t.todo.dueDate == null || t.todo.parentExternalId != null) return false;
          return t.todo.dueDate!.year == now.year &&
                 t.todo.dueDate!.month == now.month &&
                 t.todo.dueDate!.day == now.day;
        }).toList();
        break;

      case TodoViewFilter.thisWorkWeek:
        baseViewTodos = todos.where((t) {
          if (t.todo.status == TodoStatus.completed || t.todo.dueDate == null || t.todo.parentExternalId != null) return false;
          if (t.todo.dueDate!.isBefore(today)) return false;
          final diff = t.todo.dueDate!.difference(today).inDays;
          return diff >= 0 && diff <= 7 && t.todo.dueDate!.weekday <= 5;
        }).toList();
        break;

      case TodoViewFilter.thisWeekAfterwork:
        baseViewTodos = todos.where((t) {
          if (t.todo.status == TodoStatus.completed || t.todo.dueDate == null || t.todo.parentExternalId != null) return false;
          if (t.todo.dueDate!.isBefore(today)) return false;
          final diff = t.todo.dueDate!.difference(today).inDays;
          return diff >= 0 && diff <= 7 && t.todo.dueDate!.weekday > 5;
        }).toList();
        break;

      case TodoViewFilter.thisMonth:
        baseViewTodos = todos.where((t) {
          if (t.todo.status == TodoStatus.completed || t.todo.dueDate == null || t.todo.parentExternalId != null) return false;
          if (t.todo.dueDate!.isBefore(today)) return false;
          return t.todo.dueDate!.year == now.year && t.todo.dueDate!.month == now.month;
        }).toList();
        break;

      case TodoViewFilter.delegated:
        baseViewTodos = todos.where((t) => t.todo.assigneeExternalId != null && t.todo.assigneeExternalId != t.todo.ownerExternalId && t.todo.parentExternalId == null).toList();
        break;
    }

    List<TodoWithTags> viewTodos = baseViewTodos;
    if (tagFilter != null && tagFilter.isNotEmpty) {
      viewTodos = baseViewTodos.where((t) {
        return t.tags.any((tag) => tag.name == tagFilter || tag.category == tagFilter);
      }).toList();
    }

    final overdueTodos = todos.where((t) {
      if (t.todo.status == TodoStatus.completed || t.todo.dueDate == null || t.todo.parentExternalId != null) return false;
      bool isOverdue = t.todo.dueDate!.isBefore(today);
      if (!isOverdue) return false;
      
      if (tagFilter != null && tagFilter.isNotEmpty) {
        return t.tags.any((tag) => tag.name == tagFilter || tag.category == tagFilter);
      }
      return true;
    }).toList();

    final Set<String> viewTodoIds = viewTodos.map((t) => t.todo.externalId).toSet();
    final List<TodoWithTags> uniqueOverdue = overdueTodos.where((t) => !viewTodoIds.contains(t.todo.externalId)).toList();

    return {
      'view': viewTodos,
      'overdue': uniqueOverdue,
    };
  }
}
