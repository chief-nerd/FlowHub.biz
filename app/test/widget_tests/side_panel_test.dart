import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:flowhub/features/home/domain/bloc/todo_bloc.dart';
import 'package:flowhub/features/home/presentation/widgets/side_panel.dart';
import 'package:flowhub/features/sync/data/models/todo.dart';

class MockTodoBloc extends MockBloc<TodoEvent, TodoState> implements TodoBloc {}

void main() {
  late TodoBloc todoBloc;

  setUp(() {
    todoBloc = MockTodoBloc();
  });

  Widget createWidgetUnderTest() {
    return MaterialApp(
      home: BlocProvider.value(
        value: todoBloc,
        child: const Scaffold(
          body: SidePanel(),
        ),
      ),
    );
  }

  testWidgets('SidePanel shows filters and todos', (WidgetTester tester) async {
    final todos = [
      Todo()..title = 'Inbox Task'..status = TodoStatus.draft,
      Todo()..title = 'Today Task'..status = TodoStatus.inProgress,
    ];

    when(() => todoBloc.state).thenReturn(TodoLoaded(
      allTodos: todos,
      viewTodos: [todos[0]],
      overdueTodos: const [],
      activeFilter: TodoViewFilter.inbox,
    ));

    await tester.pumpWidget(createWidgetUnderTest());

    // Check filters
    expect(find.text('Inbox'), findsAtLeastNWidgets(1));
    expect(find.text('Today'), findsOneWidget);

    // Check loaded todos in view
    expect(find.text('Inbox Task'), findsOneWidget);
    expect(find.text('Today Task'), findsNothing);
  });

  testWidgets('SidePanel shows overdue section when present', (WidgetTester tester) async {
    final overdueTodo = Todo()..title = 'Late Task'..status = TodoStatus.draft;

    when(() => todoBloc.state).thenReturn(TodoLoaded(
      allTodos: [overdueTodo],
      viewTodos: const [],
      overdueTodos: [overdueTodo],
      activeFilter: TodoViewFilter.inbox,
    ));

    await tester.pumpWidget(createWidgetUnderTest());

    expect(find.text('Overdue'), findsOneWidget);
    expect(find.text('Late Task'), findsOneWidget);
  });

  testWidgets('Tapping filter triggers ChangeViewFilter event', (WidgetTester tester) async {
    when(() => todoBloc.state).thenReturn(const TodoLoaded(
      allTodos: [],
      viewTodos: [],
      overdueTodos: [],
      activeFilter: TodoViewFilter.inbox,
    ));

    await tester.pumpWidget(createWidgetUnderTest());

    await tester.tap(find.text('Today'));
    
    verify(() => todoBloc.add(const ChangeViewFilter(TodoViewFilter.today))).called(1);
  });
}
