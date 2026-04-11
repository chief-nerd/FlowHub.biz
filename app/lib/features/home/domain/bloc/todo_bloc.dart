import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import '../../../../sync/data/models/todo.dart';
import '../../../../sync/data/repositories/todo_repository.dart';

// View Types
enum TodoViewFilter {
  inbox,
  today,
  thisWorkWeek,
  thisWeekAfterwork,
  thisMonth,
  delegated,
}

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

// States
abstract class TodoState extends Equatable {
  const TodoState();
  @override
  List<Object?> get props => [];
}

class TodoInitial extends TodoState {}

class TodoLoading extends TodoState {}

class TodoLoaded extends TodoState {
  final List<Todo> allTodos;
  final List<Todo> viewTodos;
  final List<Todo> overdueTodos;
  final TodoViewFilter activeFilter;

  const TodoLoaded({
    required this.allTodos,
    required this.viewTodos,
    required this.overdueTodos,
    this.activeFilter = TodoViewFilter.inbox,
  });

  @override
  List<Object?> get props => [allTodos, viewTodos, overdueTodos, activeFilter];
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

  TodoBloc({required this.todoRepository}) : super(TodoInitial()) {
    on<LoadTodos>(_onLoadTodos);
    on<ChangeViewFilter>(_onChangeViewFilter);
  }

  Future<void> _onLoadTodos(LoadTodos event, Emitter<TodoState> emit) async {
    emit(TodoLoading());
    try {
      await emit.forEach<List<Todo>>(
        todoRepository.watchTodos(),
        onData: (todos) {
          final filter = state is TodoLoaded 
              ? (state as TodoLoaded).activeFilter 
              : TodoViewFilter.inbox;
          
          final filtered = _applyFilter(todos, filter);
          return TodoLoaded(
            allTodos: todos,
            viewTodos: filtered['view']!,
            overdueTodos: filtered['overdue']!,
            activeFilter: filter,
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
      final filtered = _applyFilter(currentState.allTodos, event.filter);
      emit(TodoLoaded(
        allTodos: currentState.allTodos,
        viewTodos: filtered['view']!,
        overdueTodos: filtered['overdue']!,
        activeFilter: event.filter,
      ));
    }
  }

  Map<String, List<Todo>> _applyFilter(List<Todo> todos, TodoViewFilter filter) {
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);

    // Identify all overdue tasks
    final overdueTodos = todos.where((t) {
      if (t.status == TodoStatus.completed || t.dueDate == null || t.parentExternalId != null) return false;
      return t.dueDate!.isBefore(today);
    }).toList();

    List<Todo> viewTodos = [];

    switch (filter) {
      case TodoViewFilter.inbox:
        viewTodos = todos.where((t) => t.status != TodoStatus.completed && t.dueDate == null && t.parentExternalId == null).toList();
        break;

      case TodoViewFilter.today:
        viewTodos = todos.where((t) {
          if (t.status == TodoStatus.completed || t.dueDate == null || t.parentExternalId != null) return false;
          return t.dueDate!.year == now.year &&
                 t.dueDate!.month == now.month &&
                 t.dueDate!.day == now.day;
        }).toList();
        break;

      case TodoViewFilter.thisWorkWeek:
        viewTodos = todos.where((t) {
          if (t.status == TodoStatus.completed || t.dueDate == null || t.parentExternalId != null) return false;
          if (t.dueDate!.isBefore(today)) return false;
          final diff = t.dueDate!.difference(today).inDays;
          // Filter out weekends (Saturday = 6, Sunday = 7)
          return diff >= 0 && diff <= 7 && t.dueDate!.weekday <= 5;
        }).toList();
        break;

      case TodoViewFilter.thisWeekAfterwork:
        viewTodos = todos.where((t) {
          if (t.status == TodoStatus.completed || t.dueDate == null || t.parentExternalId != null) return false;
          if (t.dueDate!.isBefore(today)) return false;
          final diff = t.dueDate!.difference(today).inDays;
          // Filter specifically for weekends as "Afterwork" for now
          return diff >= 0 && diff <= 7 && t.dueDate!.weekday > 5;
        }).toList();
        break;

      case TodoViewFilter.thisMonth:
        viewTodos = todos.where((t) {
          if (t.status == TodoStatus.completed || t.dueDate == null || t.parentExternalId != null) return false;
          if (t.dueDate!.isBefore(today)) return false;
          return t.dueDate!.year == now.year && t.dueDate!.month == now.month;
        }).toList();
        break;

      case TodoViewFilter.delegated:
        viewTodos = todos.where((t) => t.assigneeExternalId != null && t.assigneeExternalId != t.ownerExternalId && t.parentExternalId == null).toList();
        break;
    }

    final Set<Id> viewTodoIds = viewTodos.map((t) => t.id).toSet();
    final List<Todo> uniqueOverdue = overdueTodos.where((t) => !viewTodoIds.contains(t.id)).toList();

    return {
      'view': viewTodos,
      'overdue': uniqueOverdue,
    };
  }
}


