import 'package:flutter/material.dart';
import '../../../../core/db/app_database.dart';
import '../../../../core/models/enums.dart';
import 'todo_list_item.dart';

class TodoDetailSheet extends StatelessWidget {
  final TodoWithTags todoWithTags;
  final List<TodoWithTags> allTodos;

  const TodoDetailSheet({
    super.key,
    required this.todoWithTags,
    required this.allTodos,
  });

  Color _importanceColor(TodoImportance importance) {
    switch (importance) {
      case TodoImportance.critical:
        return Colors.red.shade700;
      case TodoImportance.high:
        return Colors.orange.shade800;
      case TodoImportance.medium:
        return Colors.blue.shade600;
      case TodoImportance.low:
        return Colors.grey.shade600;
    }
  }

  String _importanceLabel(TodoImportance importance) {
    switch (importance) {
      case TodoImportance.critical:
        return 'Critical';
      case TodoImportance.high:
        return 'High';
      case TodoImportance.medium:
        return 'Medium';
      case TodoImportance.low:
        return 'Low';
    }
  }

  Color _parseColor(String? hexColor) {
    if (hexColor == null || hexColor.isEmpty) return Colors.grey;
    try {
      final buffer = StringBuffer();
      if (hexColor.length == 6 || hexColor.length == 7) buffer.write('ff');
      buffer.write(hexColor.replaceFirst('#', ''));
      return Color(int.parse(buffer.toString(), radix: 16));
    } catch (_) {
      return Colors.grey;
    }
  }

  @override
  Widget build(BuildContext context) {
    final todo = todoWithTags.todo;
    final tags = todoWithTags.tags;
    final children = allTodos
        .where((t) => t.todo.parentExternalId == todo.externalId)
        .toList();

    return DraggableScrollableSheet(
      initialChildSize: 0.6,
      minChildSize: 0.4,
      maxChildSize: 0.95,
      expand: false,
      builder: (context, scrollController) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Drag handle
            Center(
              child: Container(
                margin: const EdgeInsets.symmetric(vertical: 12),
                width: 40,
                height: 4,
                decoration: BoxDecoration(
                  color: Colors.grey.shade400,
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
            ),
            // Title + importance strip
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 8, 8),
              child: IntrinsicHeight(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Container(
                      width: 4,
                      margin: const EdgeInsets.only(right: 12),
                      decoration: BoxDecoration(
                        color: _importanceColor(todo.importance),
                        borderRadius: BorderRadius.circular(2),
                      ),
                    ),
                    Expanded(
                      child: Text(
                        todo.title,
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    IconButton(
                      icon: const Icon(Icons.close),
                      onPressed: () => Navigator.pop(context),
                    ),
                  ],
                ),
              ),
            ),
            const Divider(height: 1),
            // Scrollable body
            Expanded(
              child: ListView(
                controller: scrollController,
                padding: const EdgeInsets.all(16),
                children: [
                  // Meta chips
                  Wrap(
                    spacing: 8,
                    runSpacing: 4,
                    children: [
                      Chip(
                        avatar: Icon(
                          Icons.flag,
                          size: 16,
                          color: _importanceColor(todo.importance),
                        ),
                        label: Text(
                          _importanceLabel(todo.importance),
                          style: const TextStyle(fontSize: 12),
                        ),
                        visualDensity: VisualDensity.compact,
                        padding: EdgeInsets.zero,
                      ),
                      Chip(
                        avatar: const Icon(Icons.circle_outlined, size: 16),
                        label: Text(
                          todo.status.name,
                          style: const TextStyle(fontSize: 12),
                        ),
                        visualDensity: VisualDensity.compact,
                        padding: EdgeInsets.zero,
                      ),
                      if (todo.dueDate != null)
                        Chip(
                          avatar: const Icon(Icons.calendar_today, size: 16),
                          label: Text(
                            '${todo.dueDate!.year}-'
                            '${todo.dueDate!.month.toString().padLeft(2, '0')}-'
                            '${todo.dueDate!.day.toString().padLeft(2, '0')}',
                            style: const TextStyle(fontSize: 12),
                          ),
                          visualDensity: VisualDensity.compact,
                          padding: EdgeInsets.zero,
                        ),
                    ],
                  ),
                  // Tags
                  if (tags.isNotEmpty) ...[
                    const SizedBox(height: 12),
                    Wrap(
                      spacing: 6,
                      runSpacing: 4,
                      children: tags
                          .map(
                            (tag) => Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 8,
                                vertical: 3,
                              ),
                              decoration: BoxDecoration(
                                color: _parseColor(tag.color).withOpacity(0.15),
                                borderRadius: BorderRadius.circular(12),
                                border: Border.all(
                                  color: _parseColor(tag.color).withOpacity(0.4),
                                ),
                              ),
                              child: Text(
                                tag.category != null
                                    ? '${tag.category}/${tag.name}'
                                    : tag.name,
                                style: TextStyle(
                                  fontSize: 12,
                                  color: _parseColor(tag.color),
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          )
                          .toList(),
                    ),
                  ],
                  // Description
                  if (todo.description != null && todo.description!.isNotEmpty) ...[
                    const SizedBox(height: 16),
                    Text(
                      'Description',
                      style: Theme.of(context).textTheme.labelLarge,
                    ),
                    const SizedBox(height: 4),
                    Text(
                      todo.description!,
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ],
                  // Subtasks
                  if (children.isNotEmpty) ...[
                    const SizedBox(height: 16),
                    Text(
                      'Subtasks (${children.length})',
                      style: Theme.of(context).textTheme.labelLarge,
                    ),
                    const SizedBox(height: 4),
                    ...children.map(
                      (child) => TodoListItem(
                        todoWithTags: child,
                        allTodos: allTodos,
                        onTapped: () => showModalBottomSheet(
                          context: context,
                          isScrollControlled: true,
                          useSafeArea: true,
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.vertical(
                              top: Radius.circular(16),
                            ),
                          ),
                          builder: (_) => TodoDetailSheet(
                            todoWithTags: child,
                            allTodos: allTodos,
                          ),
                        ),
                      ),
                    ),
                  ],
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
