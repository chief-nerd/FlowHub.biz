import 'package:drift/drift.dart' show Value;
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

class CreateTodo extends TodoEvent {
  final String title;
  final String? description;
  final TodoImportance importance;
  final DateTime? dueDate;
  final String? parentExternalId;
  final List<String> tagIds;

  const CreateTodo({
    required this.title,
    this.description,
    this.importance = TodoImportance.medium,
    this.dueDate,
    this.parentExternalId,
    this.tagIds = const [],
  });

  @override
  List<Object?> get props => [title, description, importance, dueDate, parentExternalId, tagIds];
}

class UpdateTodo extends TodoEvent {
  final String externalId;
  final String title;
  final String? description;
  final TodoImportance importance;
  final DateTime? dueDate;
  final List<String> tagIds;

  const UpdateTodo({
    required this.externalId,
    required this.title,
    this.description,
    this.importance = TodoImportance.medium,
    this.dueDate,
    this.tagIds = const [],
  });

  @override
  List<Object?> get props => [externalId, title, description, importance, dueDate, tagIds];
}

class CreateTag extends TodoEvent {
  final String name;
  final String? category;
  final String? color;

  const CreateTag({
    required this.name,
    this.category,
    this.color,
  });

  @override
  List<Object?> get props => [name, category, color];
}

class UpdateTag extends TodoEvent {
  final String externalId;
  final String name;
  final String? category;
  final String? color;

  const UpdateTag({
    required this.externalId,
    required this.name,
    this.category,
    this.color,
  });

  @override
  List<Object?> get props => [externalId, name, category, color];
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
    on<CreateTodo>(_onCreateTodo);
    on<UpdateTodo>(_onUpdateTodo);
    on<CreateTag>(_onCreateTag);
    on<UpdateTag>(_onUpdateTag);
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

  Future<void> _onCreateTodo(CreateTodo event, Emitter<TodoState> emit) async {
    final db = todoRepository.db;
    await db.ensureLocalUser();
    final id = '${AppDatabase.localUserId}-${DateTime.now().microsecondsSinceEpoch}';
    final now = DateTime.now();
    final todo = Todo(
      externalId: id,
      parentExternalId: event.parentExternalId,
      goalExternalId: null,
      ownerExternalId: AppDatabase.localUserId,
      assigneeExternalId: null,
      sourceType: TodoSourceType.native,
      externalSourceId: null,
      title: event.title,
      description: event.description,
      startDate: null,
      dueDate: event.dueDate,
      status: TodoStatus.inProgress,
      importance: event.importance,
      estimatedDuration: 0,
      createdAt: now,
      updatedAt: now,
    );
    await todoRepository.saveTodo(todo, tagIds: event.tagIds);
  }

  Future<void> _onUpdateTodo(UpdateTodo event, Emitter<TodoState> emit) async {
    final existing = await todoRepository.getTodoById(event.externalId);
    if (existing == null) return;
    final updated = existing.todo.copyWith(
      title: event.title,
      description: Value(event.description),
      importance: event.importance,
      dueDate: Value(event.dueDate),
      updatedAt: Value(DateTime.now()),
    );
    await todoRepository.saveTodo(updated, tagIds: event.tagIds);
  }

  Future<void> _onCreateTag(CreateTag event, Emitter<TodoState> emit) async {
    final id = 'local-tag-${DateTime.now().microsecondsSinceEpoch}';
    final tag = Tag(
      externalId: id,
      name: event.name,
      category: event.category,
      color: event.color,
      parentExternalId: null,
    );
    await tagRepository.saveTag(tag);
  }

  Future<void> _onUpdateTag(UpdateTag event, Emitter<TodoState> emit) async {
    final tag = Tag(
      externalId: event.externalId,
      name: event.name,
      category: event.category,
      color: event.color,
      parentExternalId: null,
    );
    await tagRepository.saveTag(tag);
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
        return t.tags.any((tag) => tag.externalId == tagFilter);
      }).toList();
    }

    final overdueTodos = todos.where((t) {
      if (t.todo.status == TodoStatus.completed || t.todo.dueDate == null || t.todo.parentExternalId != null) return false;
      bool isOverdue = t.todo.dueDate!.isBefore(today);
      if (!isOverdue) return false;
      
      if (tagFilter != null && tagFilter.isNotEmpty) {
        return t.tags.any((tag) => tag.externalId == tagFilter);
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
