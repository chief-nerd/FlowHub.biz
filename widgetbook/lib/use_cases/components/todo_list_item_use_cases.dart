import 'package:flutter/material.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart';
import 'package:flowhub/features/home/presentation/widgets/todo_list_item.dart';
import 'package:flowhub/features/sync/data/models/todo.dart';

@WidgetbookUseCase(name: 'Simple Task', type: TodoListItem)
Widget buildTodoListItemUseCase(BuildContext context) {
  return TodoListItem(
    todo: Todo()..title = 'Complete Widgetbook setup',
    allTodos: const [],
  );
}

@WidgetbookUseCase(name: 'Nested Tasks', type: TodoListItem)
Widget buildNestedTodoListItemUseCase(BuildContext context) {
  final parent = Todo()
    ..title = 'Parent Task'
    ..externalId = 'p1';
  final child1 = Todo()
    ..title = 'Child Task 1'
    ..externalId = 'c1'
    ..parentExternalId = 'p1';
  final child2 = Todo()
    ..title = 'Child Task 2'
    ..externalId = 'c2'
    ..parentExternalId = 'p1';

  return TodoListItem(
    todo: parent,
    allTodos: [parent, child1, child2],
  );
}
