import 'package:flutter/material.dart';
import '../../../../core/db/app_database.dart';
import '../../../../core/models/enums.dart';

class TodoListItem extends StatefulWidget {
  final TodoWithTags todoWithTags;
  final List<TodoWithTags> allTodos;
  final int depth;
  final VoidCallback? onTapped;

  const TodoListItem({
    super.key,
    required this.todoWithTags,
    required this.allTodos,
    this.depth = 0,
    this.onTapped,
  });

  @override
  State<TodoListItem> createState() => _TodoListItemState();
}

class _TodoListItemState extends State<TodoListItem> {
  bool _isExpanded = false;

  void _toggleExpand() {
    setState(() {
      _isExpanded = !_isExpanded;
    });
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

  Color _getImportanceColor(TodoImportance importance) {
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

  @override
  Widget build(BuildContext context) {
    final todo = widget.todoWithTags.todo;
    final tags = widget.todoWithTags.tags;

    // Memory-based tree construction
    final subTodos = widget.allTodos.where((t) => t.todo.parentExternalId == todo.externalId).toList();
        
    final hasChildren = subTodos.isNotEmpty;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        InkWell(
          onTap: widget.onTapped ?? _toggleExpand,
          child: IntrinsicHeight(
            child: Row(
              children: [
                // Importance indicator strip
                Container(
                  width: 4,
                  color: _getImportanceColor(todo.importance),
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(
                      left: 12.0 + (widget.depth * 20.0),
                      top: 8.0,
                      bottom: 8.0,
                      right: 16.0,
                    ),
                    child: Row(
                      children: [
                        GestureDetector(
                          behavior: HitTestBehavior.opaque,
                          onTap: hasChildren ? _toggleExpand : null,
                          child: SizedBox(
                            width: 24,
                            child: hasChildren
                                ? Icon(
                                    _isExpanded
                                        ? Icons.keyboard_arrow_down
                                        : Icons.keyboard_arrow_right,
                                    size: 20,
                                  )
                                : null,
                          ),
                        ),
                        Icon(
                          Icons.circle_outlined,
                          size: 16,
                          color: _getImportanceColor(todo.importance),
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          child: Wrap(
                            crossAxisAlignment: WrapCrossAlignment.center,
                            children: [
                              Text(
                                todo.title,
                                style: TextStyle(
                                  fontWeight: widget.depth == 0 ? FontWeight.w600 : FontWeight.normal,
                                ),
                              ),
                              const SizedBox(width: 8),
                              // Tags display
                              ...tags.map((tag) => Padding(
                                padding: const EdgeInsets.only(right: 4.0),
                                child: Container(
                                  padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                                  decoration: BoxDecoration(
                                    color: _parseColor(tag.color).withOpacity(0.2),
                                    borderRadius: BorderRadius.circular(4),
                                    border: Border.all(color: _parseColor(tag.color).withOpacity(0.5), width: 0.5),
                                  ),
                                  child: Text(
                                    tag.category != null ? '${tag.category}/${tag.name}' : tag.name,
                                    style: TextStyle(
                                      fontSize: 10,
                                      color: _parseColor(tag.color),
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              )),
                            ],
                          ),
                        ),
                        if (todo.status == TodoStatus.completed)
                          const Icon(Icons.check, size: 16, color: Colors.green),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        if (_isExpanded && hasChildren)
          ...subTodos.map(
            (child) => TodoListItem(
              todoWithTags: child,
              allTodos: widget.allTodos,
              depth: widget.depth + 1,
            ),
          ),
      ],
    );
  }
}
