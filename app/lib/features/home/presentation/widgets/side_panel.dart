import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../domain/bloc/todo_bloc.dart';
import '../../../../core/models/enums.dart';
import '../../../../core/db/app_database.dart';
import '../../../settings/presentation/pages/account_settings_page.dart';
import 'todo_list_item.dart';
import 'create_todo_sheet.dart';
import 'create_tag_sheet.dart';

class SidePanel extends StatelessWidget {
  const SidePanel({super.key});

  void _openCreateSheet(BuildContext context, List<Tag> allTags) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      useSafeArea: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (_) => BlocProvider.value(
        value: context.read<TodoBloc>(),
        child: CreateTodoSheet(allTags: allTags),
      ),
    );
  }

  void _openEditSheet(BuildContext context, TodoWithTags todo, List<Tag> allTags) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      useSafeArea: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (_) => BlocProvider.value(
        value: context.read<TodoBloc>(),
        child: CreateTodoSheet(editTodo: todo, allTags: allTags),
      ),
    );
  }

  void _openEditTagSheet(BuildContext context, Tag tag) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      useSafeArea: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (_) => BlocProvider.value(
        value: context.read<TodoBloc>(),
        child: CreateTagSheet(editTag: tag),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TodoBloc, TodoState>(
      builder: (context, state) {
        if (state is TodoLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is TodoLoaded) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(child: _buildFilterSection(context, state.activeFilter)),
                  IconButton(
                    icon: const Icon(Icons.add),
                    tooltip: 'New todo',
                    onPressed: () => _openCreateSheet(context, state.allTags),
                  ),
                ],
              ),
              const Divider(height: 1),
              if (state.activeTagFilter != null)
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 4.0),
                  child: Chip(
                    label: Text(() {
                      final t = state.allTags.where((t) => t.externalId == state.activeTagFilter).firstOrNull;
                      final name = t == null ? state.activeTagFilter! : (t.category != null ? '${t.category}/${t.name}' : t.name);
                      return 'Tag: $name';
                    }()),
                    onDeleted: () => context.read<TodoBloc>().add(const ChangeTagFilter(null)),
                  ),
                ),
              Expanded(
                child: ListView(
                  children: [
                    if (state.overdueTodos.isNotEmpty) ...[
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 4.0),
                        child: Text(
                          AppLocalizations.of(context)!.overdue,
                          style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).colorScheme.error,
                          ),
                        ),
                      ),
                      ...state.overdueTodos.map((todo) => TodoListItem(
                        todoWithTags: todo,
                        allTodos: state.allTodos,
                        onTapped: () => _openEditSheet(context, todo, state.allTags),
                      )),
                      const Divider(),
                    ],
                    ...state.viewTodos.map((todo) => TodoListItem(
                      todoWithTags: todo,
                      allTodos: state.allTodos,
                      onTapped: () => _openEditSheet(context, todo, state.allTags),
                    )),
                  ],
                ),
              ),
              const Divider(height: 1),
              _buildTagSection(context, state),
              const Divider(height: 1),
              ListTile(
                leading: const Icon(Icons.settings_outlined),
                title: Text(AppLocalizations.of(context)!.settings),
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => const AccountSettingsPage()),
                  );
                },
              ),
            ],
          );
        } else if (state is TodoError) {
          return Center(child: Text('Error: ${state.message}'));
        }
        
        return const Center(child: Text('Initialize Todos'));
      },
    );
  }


  Widget _buildFilterSection(BuildContext context, TodoViewFilter activeFilter) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 4.0),
      child: DropdownButton<TodoViewFilter>(
        value: activeFilter,
        isExpanded: true,
        underline: const SizedBox.shrink(),
        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              fontWeight: FontWeight.bold,
              fontSize: 14,
            ),
        items: TodoViewFilter.values
            .map((filter) => DropdownMenuItem(
                  value: filter,
                  child: Text(_getFilterName(context, filter)),
                ))
            .toList(),
        onChanged: (filter) {
          if (filter != null) {
            context.read<TodoBloc>().add(ChangeViewFilter(filter));
          }
        },
      ),
    );
  }

  Widget _buildTagSection(BuildContext context, TodoLoaded state) {
    final l10n = AppLocalizations.of(context)!;

    // Sort tags: category (nulls last) then name
    final sorted = [...state.allTags]..sort((a, b) {
        final ca = a.category ?? '\uffff';
        final cb = b.category ?? '\uffff';
        final cmp = ca.compareTo(cb);
        return cmp != 0 ? cmp : a.name.compareTo(b.name);
      });

    return ExpansionTile(
      title: Text(l10n.tags, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(
            icon: const Icon(Icons.add, size: 18),
            tooltip: 'New tag',
            padding: EdgeInsets.zero,
            constraints: const BoxConstraints(minWidth: 32, minHeight: 32),
            onPressed: () => showModalBottomSheet(
              context: context,
              isScrollControlled: true,
              useSafeArea: true,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
              ),
              builder: (_) => BlocProvider.value(
                value: context.read<TodoBloc>(),
                child: const CreateTagSheet(),
              ),
            ),
          ),
          const Icon(Icons.expand_more),
        ],
      ),
      dense: true,
      children: sorted.isEmpty
          ? [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: Text('No tags yet', style: Theme.of(context).textTheme.bodySmall),
              )
            ]
          : sorted.map((tag) {
              final color = _tagColor(tag.color);
              final label = tag.category != null ? '${tag.category}/${tag.name}' : tag.name;
              final isActive = state.activeTagFilter == tag.externalId;
              return InkWell(
                onTap: () => context.read<TodoBloc>().add(
                    ChangeTagFilter(isActive ? null : tag.externalId)),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 3),
                  child: Row(
                    children: [
                      Expanded(
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                          decoration: BoxDecoration(
                            color: isActive ? color.withOpacity(0.2) : color.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(
                              color: color.withOpacity(isActive ? 0.7 : 0.35),
                            ),
                          ),
                          child: Text(
                            label,
                            style: TextStyle(
                              fontSize: 12,
                              color: color,
                              fontWeight: isActive ? FontWeight.bold : FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                      IconButton(
                        icon: const Icon(Icons.edit_outlined, size: 14),
                        padding: EdgeInsets.zero,
                        constraints: const BoxConstraints(minWidth: 28, minHeight: 28),
                        onPressed: () => _openEditTagSheet(context, tag),
                      ),
                    ],
                  ),
                ),
              );
            }).toList(),
    );
  }

  Color _tagColor(String? hex) {
    if (hex == null || hex.isEmpty) return Colors.blueGrey;
    try {
      final buffer = StringBuffer();
      if (hex.length == 6 || hex.length == 7) buffer.write('ff');
      buffer.write(hex.replaceFirst('#', ''));
      return Color(int.parse(buffer.toString(), radix: 16));
    } catch (_) {
      return Colors.blueGrey;
    }
  }

  String _getFilterName(BuildContext context, TodoViewFilter filter) {
    final l10n = AppLocalizations.of(context)!;
    switch (filter) {
      case TodoViewFilter.inbox: return l10n.inbox;
      case TodoViewFilter.today: return l10n.today;
      case TodoViewFilter.thisWorkWeek: return l10n.thisWorkWeek;
      case TodoViewFilter.thisWeekAfterwork: return l10n.thisWeekAfterwork;
      case TodoViewFilter.thisMonth: return l10n.thisMonth;
      case TodoViewFilter.delegated: return l10n.delegated;
    }
  }
}
