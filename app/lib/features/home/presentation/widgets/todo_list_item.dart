import 'package:flutter/material.dart';
import '../../../sync/data/models/todo.dart';

class TodoListItem extends StatefulWidget {
  final Todo todo;
  final List<Todo> allTodos;
  final int depth;

  const TodoListItem({
    super.key,
    required this.todo,
    required this.allTodos,
    this.depth = 0,
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

  @override
  Widget build(BuildContext context) {
    // Memory-based tree construction instead of lazy IsarLinks
    final subTodos = widget.todo.externalId != null 
        ? widget.allTodos.where((t) => t.parentExternalId == widget.todo.externalId).toList()
        : <Todo>[];
        
    final hasChildren = subTodos.isNotEmpty;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        InkWell(
          onTap: _toggleExpand, // Allow expanding if any, or just select
          child: Padding(
            padding: EdgeInsets.only(
              left: 16.0 + (widget.depth * 20.0),
              top: 8.0,
              bottom: 8.0,
              right: 16.0,
            ),
            child: Row(
              children: [
                SizedBox(
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
                Icon(
                  Icons.circle_outlined,
                  size: 16,
                  color: Theme.of(context).colorScheme.primary,
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    widget.todo.title,
                    style: TextStyle(
                      fontWeight: widget.depth == 0 ? FontWeight.w600 : FontWeight.normal,
                    ),
                  ),
                ),
                if (widget.todo.status == TodoStatus.completed)
                  const Icon(Icons.check, size: 16, color: Colors.green),
              ],
            ),
          ),
        ),
        if (_isExpanded && hasChildren)
          ...subTodos.map(
            (child) => TodoListItem(
              todo: child,
              allTodos: widget.allTodos,
              depth: widget.depth + 1,
            ),
          ),
      ],
    );
  }
}
