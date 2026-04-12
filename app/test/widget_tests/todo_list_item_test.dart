import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flowhub/features/home/presentation/widgets/todo_list_item.dart';
import 'package:flowhub/features/sync/data/models/todo.dart';

void main() {
  testWidgets('TodoListItem shows title and status correctly', (WidgetTester tester) async {
    final todo = Todo()
      ..title = 'Test Task'
      ..status = TodoStatus.draft;

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: TodoListItem(todo: todo, allTodos: const []),
        ),
      ),
    );

    expect(find.text('Test Task'), findsOneWidget);
    expect(find.byIcon(Icons.check), findsNothing);
  });

  testWidgets('TodoListItem shows check icon for completed tasks', (WidgetTester tester) async {
    final todo = Todo()
      ..title = 'Completed Task'
      ..status = TodoStatus.completed;

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: TodoListItem(todo: todo, allTodos: const []),
        ),
      ),
    );

    expect(find.text('Completed Task'), findsOneWidget);
    expect(find.byIcon(Icons.check), findsOneWidget);
  });

  testWidgets('TodoListItem can expand to show sub-tasks', (WidgetTester tester) async {
    final parent = Todo()
      ..title = 'Parent Task'
      ..externalId = 'parent-1'
      ..status = TodoStatus.draft;

    final child = Todo()
      ..title = 'Child Task'
      ..externalId = 'child-1'
      ..parentExternalId = 'parent-1'
      ..status = TodoStatus.draft;

    final allTodos = [parent, child];

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: TodoListItem(todo: parent, allTodos: allTodos),
        ),
      ),
    );

    // Child should not be visible initially
    expect(find.text('Child Task'), findsNothing);
    expect(find.byIcon(Icons.keyboard_arrow_right), findsOneWidget);

    // Tap to expand
    await tester.tap(find.text('Parent Task'));
    await tester.pump();

    // Child should now be visible
    expect(find.text('Child Task'), findsOneWidget);
    expect(find.byIcon(Icons.keyboard_arrow_down), findsOneWidget);
    
    // Tap to collapse
    await tester.tap(find.text('Parent Task'));
    await tester.pump();
    
    expect(find.text('Child Task'), findsNothing);
  });
}
