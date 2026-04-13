import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/db/app_database.dart';
import '../../domain/bloc/todo_bloc.dart';

class CreateTagSheet extends StatefulWidget {
  final Tag? editTag;

  const CreateTagSheet({super.key, this.editTag});

  @override
  State<CreateTagSheet> createState() => _CreateTagSheetState();
}

class _CreateTagSheetState extends State<CreateTagSheet> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _categoryController = TextEditingController();
  Color? _selectedColor;

  static const List<Color> _palette = [
    Color(0xFFEF5350), // red
    Color(0xFFFF7043), // deep orange
    Color(0xFFFFA726), // orange
    Color(0xFFFFEE58), // yellow
    Color(0xFF66BB6A), // green
    Color(0xFF26C6DA), // cyan
    Color(0xFF42A5F5), // blue
    Color(0xFF7E57C2), // purple
    Color(0xFFEC407A), // pink
    Color(0xFF78909C), // blue-grey
  ];

  bool get _isEdit => widget.editTag != null;

  @override
  void initState() {
    super.initState();
    if (widget.editTag != null) {
      _nameController.text = widget.editTag!.name;
      _categoryController.text = widget.editTag!.category ?? '';
      if (widget.editTag!.color != null) {
        _selectedColor = _hexToColor(widget.editTag!.color!);
      }
    }
    _nameController.addListener(() => setState(() {}));
    _categoryController.addListener(() => setState(() {}));
  }

  @override
  void dispose() {
    _nameController.dispose();
    _categoryController.dispose();
    super.dispose();
  }

  String _colorToHex(Color c) =>
      '#${c.red.toRadixString(16).padLeft(2, '0')}'
      '${c.green.toRadixString(16).padLeft(2, '0')}'
      '${c.blue.toRadixString(16).padLeft(2, '0')}';

  Color _hexToColor(String hex) {
    try {
      final buffer = StringBuffer();
      if (hex.length == 6 || hex.length == 7) buffer.write('ff');
      buffer.write(hex.replaceFirst('#', ''));
      return Color(int.parse(buffer.toString(), radix: 16));
    } catch (_) {
      return Colors.grey;
    }
  }

  void _submit() {
    if (!_formKey.currentState!.validate()) return;
    final name = _nameController.text.trim();
    final category = _categoryController.text.trim().isEmpty ? null : _categoryController.text.trim();
    final color = _selectedColor != null ? _colorToHex(_selectedColor!) : null;
    if (_isEdit) {
      context.read<TodoBloc>().add(UpdateTag(
        externalId: widget.editTag!.externalId,
        name: name,
        category: category,
        color: color,
      ));
    } else {
      context.read<TodoBloc>().add(CreateTag(
        name: name,
        category: category,
        color: color,
      ));
    }
    Navigator.pop(context);
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
                  _isEdit ? 'Edit Tag' : 'New Tag',
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium
                      ?.copyWith(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 12),
                // Name + Category row
                Row(
                  children: [
                    Expanded(
                      flex: 3,
                      child: TextFormField(
                        controller: _nameController,
                        autofocus: true,
                        decoration: const InputDecoration(
                          labelText: 'Name',
                          border: OutlineInputBorder(),
                          isDense: true,
                        ),
                        textInputAction: TextInputAction.next,
                        validator: (v) =>
                            (v == null || v.trim().isEmpty) ? 'Required' : null,
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      flex: 2,
                      child: TextFormField(
                        controller: _categoryController,
                        decoration: const InputDecoration(
                          labelText: 'Category (optional)',
                          border: OutlineInputBorder(),
                          isDense: true,
                        ),
                        textInputAction: TextInputAction.done,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                // Color picker
                Text('Color', style: Theme.of(context).textTheme.labelMedium),
                const SizedBox(height: 6),
                Wrap(
                  spacing: 8,
                  children: [
                    // No color option
                    GestureDetector(
                      onTap: () => setState(() => _selectedColor = null),
                      child: Container(
                        width: 28,
                        height: 28,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: _selectedColor == null
                                ? Theme.of(context).colorScheme.primary
                                : Colors.grey.shade400,
                            width: _selectedColor == null ? 2.5 : 1,
                          ),
                        ),
                        child: const Icon(Icons.block, size: 16, color: Colors.grey),
                      ),
                    ),
                    ..._palette.map((c) => GestureDetector(
                          onTap: () => setState(() => _selectedColor = c),
                          child: Container(
                            width: 28,
                            height: 28,
                            decoration: BoxDecoration(
                              color: c,
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: _selectedColor == c
                                    ? Theme.of(context).colorScheme.primary
                                    : Colors.transparent,
                                width: 2.5,
                              ),
                            ),
                            child: _selectedColor == c
                                ? const Icon(Icons.check, size: 16, color: Colors.white)
                                : null,
                          ),
                        )),
                  ],
                ),
                const SizedBox(height: 16),
                // Preview
                if (_nameController.text.trim().isNotEmpty)
                  Padding(
                    padding: const EdgeInsets.only(bottom: 12),
                    child: Row(
                      children: [
                        Text('Preview: ',
                            style: Theme.of(context).textTheme.labelMedium),
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 8, vertical: 3),
                          decoration: BoxDecoration(
                            color: (_selectedColor ?? Colors.grey)
                                .withOpacity(0.15),
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(
                              color: (_selectedColor ?? Colors.grey)
                                  .withOpacity(0.4),
                            ),
                          ),
                          child: Text(
                            _categoryController.text.trim().isNotEmpty
                                ? '${_categoryController.text.trim()}/${_nameController.text.trim()}'
                                : _nameController.text.trim(),
                            style: TextStyle(
                              fontSize: 12,
                              color: _selectedColor ?? Colors.grey.shade700,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
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
                      icon: Icon(_isEdit ? Icons.save : Icons.label_outline, size: 18),
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
}
