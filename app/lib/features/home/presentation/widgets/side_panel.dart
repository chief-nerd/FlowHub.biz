import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/bloc/todo_bloc.dart';
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
                  _getFilterName(state.activeFilter),
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
                          'Overdue',
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
              _getFilterName(filter),
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

  String _getFilterName(TodoViewFilter filter) {
    switch (filter) {
      case TodoViewFilter.inbox: return 'Inbox';
      case TodoViewFilter.today: return 'Today';
      case TodoViewFilter.thisWorkWeek: return 'This Work Week';
      case TodoViewFilter.thisWeekAfterwork: return 'This Week Afterwork';
      case TodoViewFilter.thisMonth: return 'This Month';
      case TodoViewFilter.delegated: return 'Delegated';
    }
  }
}
