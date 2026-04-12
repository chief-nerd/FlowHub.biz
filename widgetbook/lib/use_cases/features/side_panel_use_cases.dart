import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart';
import 'package:mocktail/mocktail.dart';
import 'package:flowhub/features/home/presentation/widgets/side_panel.dart';
import 'package:flowhub/features/home/domain/bloc/todo_bloc.dart';
import 'package:flowhub/features/sync/data/models/todo.dart';

class MockTodoBloc extends Mock implements TodoBloc {}

@WidgetbookUseCase(name: 'Default', type: SidePanel)
Widget buildSidePanelUseCase(BuildContext context) {
  final mockBloc = MockTodoBloc();
  final todos = [
    Todo()..title = 'Regular Task'..status = TodoStatus.draft,
    Todo()..title = 'Overdue Task'..status = TodoStatus.inProgress,
  ];

  when(() => mockBloc.state).thenReturn(TodoLoaded(
    allTodos: todos,
    viewTodos: [todos[0]],
    overdueTodos: [todos[1]],
    activeFilter: TodoViewFilter.inbox,
  ));
  
  // ignore: close_sinks
  when(() => mockBloc.stream).thenAnswer((_) => const Stream.empty());

  return BlocProvider<TodoBloc>.value(
    value: mockBloc,
    child: const SidePanel(),
  );
}
