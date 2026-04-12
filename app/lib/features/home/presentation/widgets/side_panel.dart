import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../domain/bloc/todo_bloc.dart';
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
                      ...state.overdueTodos.map((todo) => TodoListItem(todo: todo, allTodos: state.allTodos)),
                      const Divider(),
                    ],
                    ...state.viewTodos.map((todo) => TodoListItem(todo: todo, allTodos: state.allTodos)),
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
