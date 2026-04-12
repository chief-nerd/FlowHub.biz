import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../domain/bloc/todo_bloc.dart';
import '../../../../core/models/enums.dart';
import '../../../settings/presentation/pages/account_settings_page.dart';
import 'todo_list_item.dart';

class SidePanel extends StatelessWidget {
  const SidePanel({super.key});

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
              _buildFilterSection(context, state.activeFilter),
              const Divider(height: 1),
              _buildTagSection(context, state),
              const Divider(height: 1),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  _getFilterName(context, state.activeFilter),
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              if (state.activeTagFilter != null)
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Chip(
                    label: Text('Tag: ${state.activeTagFilter}'),
                    onDeleted: () => context.read<TodoBloc>().add(const ChangeTagFilter(null)),
                  ),
                ),
              Expanded(
                child: ListView(
                  children: [
                    if (state.overdueTodos.isNotEmpty) ...[
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                        child: Text(
                          AppLocalizations.of(context)!.overdue,
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).colorScheme.error,
                          ),
                        ),
                      ),
                      ...state.overdueTodos.map((todo) => TodoListItem(todoWithTags: todo, allTodos: state.allTodos)),
                      const Divider(),
                    ],
                    ...state.viewTodos.map((todo) => TodoListItem(todoWithTags: todo, allTodos: state.allTodos)),
                  ],
                ),
              ),
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
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        children: TodoViewFilter.values.map((filter) {
          final isSelected = activeFilter == filter;
          return ListTile(
            dense: true,
            selected: isSelected,
            selectedTileColor: Theme.of(context).colorScheme.primary.withOpacity(0.1),
            title: Text(
              _getFilterName(context, filter),
              style: TextStyle(
                fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                color: isSelected ? Theme.of(context).colorScheme.primary : null,
              ),
            ),
            onTap: () {
              context.read<TodoBloc>().add(ChangeViewFilter(filter));
            },
          );
        }).toList(),
      ),
    );
  }

  Widget _buildTagSection(BuildContext context, TodoLoaded state) {
    final l10n = AppLocalizations.of(context)!;
    
    // Extract unique categories and names
    final categories = state.allTags.map((t) => t.category).whereType<String>().toSet().toList();
    final names = state.allTags.map((t) => t.name).toSet().toList();

    return ExpansionTile(
      title: Text(l10n.tags, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
      dense: true,
      children: [
        if (categories.isNotEmpty) ...[
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 4.0),
            child: Align(alignment: Alignment.centerLeft, child: Text('Categories', style: Theme.of(context).textTheme.labelSmall)),
          ),
          ...categories.map((cat) => ListTile(
            dense: true,
            title: Text(cat),
            selected: state.activeTagFilter == cat,
            onTap: () => context.read<TodoBloc>().add(ChangeTagFilter(cat)),
          )),
        ],
        if (names.isNotEmpty) ...[
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 4.0),
            child: Align(alignment: Alignment.centerLeft, child: Text('Names', style: Theme.of(context).textTheme.labelSmall)),
          ),
          ...names.map((name) => ListTile(
            dense: true,
            title: Text(name),
            selected: state.activeTagFilter == name,
            onTap: () => context.read<TodoBloc>().add(ChangeTagFilter(name)),
          )),
        ],
      ],
    );
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
