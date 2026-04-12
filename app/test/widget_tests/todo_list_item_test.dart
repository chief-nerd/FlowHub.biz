import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flowhub/features/home/presentation/widgets/todo_list_item.dart';
import 'package:flowhub/core/db/app_database.dart';
import 'package:flowhub/core/models/enums.dart';

void main() {
  testWidgets('TodoListItem shows title and status correctly', (WidgetTester tester) async {
    final todo = const Todo(
      externalId: '1',
      title: 'Test Task',
      status: TodoStatus.draft,
      importance: TodoImportance.medium,
      sourceType: TodoSourceType.native,
      ownerExternalId: 'u1',
      estimatedDuration: 0,
    );
    final todoWithTags = TodoWithTags(todo, const []);

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: TodoListItem(todoWithTags: todoWithTags, allTodos: const []),
        ),
      ),
    );

    expect(find.text('Test Task'), findsOneWidget);
    expect(find.byIcon(Icons.check), findsNothing);
  });

  testWidgets('TodoListItem shows check icon for completed tasks', (WidgetTester tester) async {
    final todo = const Todo(
      externalId: '2',
      title: 'Completed Task',
      status: TodoStatus.completed,
      importance: TodoImportance.medium,
      sourceType: TodoSourceType.native,
      ownerExternalId: 'u1',
      estimatedDuration: 0,
    );
    final todoWithTags = TodoWithTags(todo, const []);

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: TodoListItem(todoWithTags: todoWithTags, allTodos: const []),
        ),
      ),
    );

    expect(find.text('Completed Task'), findsOneWidget);
    expect(find.byIcon(Icons.check), findsOneWidget);
  });

  testWidgets('TodoListItem can expand to show sub-tasks', (WidgetTester tester) async {
    final parent = const Todo(
      externalId: 'parent-1',
      title: 'Parent Task',
      status: TodoStatus.draft,
      importance: TodoImportance.medium,
      sourceType: TodoSourceType.native,
      ownerExternalId: 'u1',
      estimatedDuration: 0,
    );
    final child = const Todo(
      externalId: 'child-1',
      parentExternalId: 'parent-1',
      title: 'Child Task',
      status: TodoStatus.draft,
      importance: TodoImportance.medium,
      sourceType: TodoSourceType.native,
      ownerExternalId: 'u1',
      estimatedDuration: 0,
    );

    final parentWithTags = TodoWithTags(parent, const []);
    final childWithTags = TodoWithTags(child, const []);
    final allTodos = [parentWithTags, childWithTags];

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: TodoListItem(todoWithTags: parentWithTags, allTodos: allTodos),
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
