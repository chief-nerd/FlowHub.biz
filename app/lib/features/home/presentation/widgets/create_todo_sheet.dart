import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import '../../../../core/db/app_database.dart';
import '../../../../core/models/enums.dart';
import '../../domain/bloc/todo_bloc.dart';

class CreateTodoSheet extends StatefulWidget {
  final String? parentExternalId;
  final TodoWithTags? editTodo;
  final List<Tag> allTags;

  const CreateTodoSheet({
    super.key,
    this.parentExternalId,
    this.editTodo,
    this.allTags = const [],
  });

  @override
  State<CreateTodoSheet> createState() => _CreateTodoSheetState();
}

class _CreateTodoSheetState extends State<CreateTodoSheet> {
  final _formKey = GlobalKey<FormState>();
  late final TextEditingController _titleController;
  late final TextEditingController _descController;

  late TodoImportance _importance;
  DateTime? _dueDate;
  late Set<String> _selectedTagIds;

  bool get _isEdit => widget.editTodo != null;

  @override
  void initState() {
    super.initState();
    final todo = widget.editTodo?.todo;
    _titleController = TextEditingController(text: todo?.title ?? '');
    _descController = TextEditingController(text: todo?.description ?? '');
    _importance = todo?.importance ?? TodoImportance.medium;
    _dueDate = todo?.dueDate;
    _selectedTagIds = widget.editTodo?.tags.map((t) => t.externalId).toSet() ?? {};
  }

  @override
  void dispose() {
    _titleController.dispose();
    _descController.dispose();
    super.dispose();
  }

  Future<void> _pickDate() async {
    final picked = await showDatePicker(
      context: context,
      initialDate: _dueDate ?? DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime(2100),
    );
    if (picked != null) setState(() => _dueDate = picked);
  }

  void _submit() {
    if (!_formKey.currentState!.validate()) return;
    final tagIds = _selectedTagIds.toList();
    if (_isEdit) {
      context.read<TodoBloc>().add(UpdateTodo(
        externalId: widget.editTodo!.todo.externalId,
        title: _titleController.text.trim(),
        description: _descController.text.trim().isEmpty ? null : _descController.text.trim(),
        importance: _importance,
        dueDate: _dueDate,
        tagIds: tagIds,
      ));
    } else {
      context.read<TodoBloc>().add(CreateTodo(
        title: _titleController.text.trim(),
        description: _descController.text.trim().isEmpty ? null : _descController.text.trim(),
        importance: _importance,
        dueDate: _dueDate,
        parentExternalId: widget.parentExternalId,
        tagIds: tagIds,
      ));
    }
    Navigator.pop(context);
  }

  Color _parseColor(String? hex) {
    if (hex == null || hex.isEmpty) return Colors.grey;
    try {
      final buffer = StringBuffer();
      if (hex.length == 6 || hex.length == 7) buffer.write('ff');
      buffer.write(hex.replaceFirst('#', ''));
      return Color(int.parse(buffer.toString(), radix: 16));
    } catch (_) {
      return Colors.grey;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16, 12, 16, 16),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Drag handle
                Center(
                  child: Container(
                    width: 40,
                    height: 4,
                    margin: const EdgeInsets.only(bottom: 12),
                    decoration: BoxDecoration(
                      color: Colors.grey.shade400,
                      borderRadius: BorderRadius.circular(2),
                    ),
                  ),
                ),
                Text(
                  _isEdit ? 'Edit Todo' : (widget.parentExternalId != null ? 'New Subtask' : 'New Todo'),
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 12),
                // Title
                TextFormField(
                  controller: _titleController,
                  autofocus: !_isEdit,
                  decoration: const InputDecoration(
                    labelText: 'Title',
                    border: OutlineInputBorder(),
                    isDense: true,
                  ),
                  textInputAction: TextInputAction.next,
                  validator: (v) => (v == null || v.trim().isEmpty) ? 'Title is required' : null,
                ),
                const SizedBox(height: 10),
                // Description
                TextFormField(
                  controller: _descController,
                  decoration: const InputDecoration(
                    labelText: 'Description (optional)',
                    border: OutlineInputBorder(),
                    isDense: true,
                  ),
                  minLines: 2,
                  maxLines: 4,
                  textInputAction: TextInputAction.newline,
                ),
                const SizedBox(height: 10),
                // Importance + Due date row
                Row(
                  children: [
                    Expanded(
                      child: DropdownButtonFormField<TodoImportance>(
                        value: _importance,
                        decoration: const InputDecoration(
                          labelText: 'Importance',
                          border: OutlineInputBorder(),
                          isDense: true,
                        ),
                        items: TodoImportance.values
                            .map((i) => DropdownMenuItem(
                                  value: i,
                                  child: Text(_importanceLabel(i)),
                                ))
                            .toList(),
                        onChanged: (v) => setState(() => _importance = v ?? _importance),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: InkWell(
                        onTap: _pickDate,
                        borderRadius: BorderRadius.circular(4),
                        child: InputDecorator(
                          decoration: const InputDecoration(
                            labelText: 'Due date',
                            border: OutlineInputBorder(),
                            isDense: true,
                            suffixIcon: Icon(Icons.calendar_today, size: 16),
                          ),
                          child: Text(
                            _dueDate != null
                                ? DateFormat('MMM d, yyyy').format(_dueDate!)
                                : 'None',
                            style: TextStyle(
                              color: _dueDate != null ? null : Colors.grey.shade500,
                              fontSize: 14,
                            ),
                          ),
                        ),
                      ),
                    ),
                    if (_dueDate != null) ...[
                      const SizedBox(width: 4),
                      IconButton(
                        icon: const Icon(Icons.clear, size: 18),
                        tooltip: 'Clear date',
                        onPressed: () => setState(() => _dueDate = null),
                        padding: EdgeInsets.zero,
                        constraints: const BoxConstraints(minWidth: 32, minHeight: 32),
                      ),
                    ],
                  ],
                ),
                // Tags
                if (widget.allTags.isNotEmpty) ...[
                  const SizedBox(height: 12),
                  Text('Tags', style: Theme.of(context).textTheme.labelMedium),
                  const SizedBox(height: 6),
                  Wrap(
                    spacing: 6,
                    runSpacing: 4,
                    children: widget.allTags.map((tag) {
                      final selected = _selectedTagIds.contains(tag.externalId);
                      final color = _parseColor(tag.color);
                      final label = tag.category != null ? '${tag.category}/${tag.name}' : tag.name;
                      return FilterChip(
                        label: Text(label, style: const TextStyle(fontSize: 12)),
                        selected: selected,
                        onSelected: (v) => setState(() {
                          if (v) {
                            _selectedTagIds.add(tag.externalId);
                          } else {
                            _selectedTagIds.remove(tag.externalId);
                          }
                        }),
                        selectedColor: color.withOpacity(0.25),
                        checkmarkColor: color,
                        side: BorderSide(color: color.withOpacity(selected ? 0.7 : 0.3)),
                        labelStyle: TextStyle(
                          color: selected ? color : null,
                          fontWeight: selected ? FontWeight.bold : FontWeight.normal,
                        ),
                        visualDensity: VisualDensity.compact,
                        padding: EdgeInsets.zero,
                      );
                    }).toList(),
                  ),
                ],
                const SizedBox(height: 16),
                // Actions
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                      onPressed: () => Navigator.pop(context),
                      child: const Text('Cancel'),
                    ),
                    const SizedBox(width: 8),
                    FilledButton.icon(
                      icon: Icon(_isEdit ? Icons.save : Icons.add, size: 18),
                      label: Text(_isEdit ? 'Save' : 'Create'),
                      onPressed: _submit,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  String _importanceLabel(TodoImportance i) {
    switch (i) {
      case TodoImportance.critical: return 'Critical';
      case TodoImportance.high:     return 'High';
      case TodoImportance.medium:   return 'Medium';
      case TodoImportance.low:      return 'Low';
    }
  }
}

