import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../shared/layouts/split_pane_layout.dart';
import '../widgets/side_panel.dart';
import '../../domain/bloc/todo_bloc.dart';
import '../../../sync/data/repositories/todo_repository.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TodoBloc(
        todoRepository: context.read<TodoRepository>(),
      )..add(LoadTodos()),
      child: SplitPaneLayout(
        sidePanel: Container(
          color: Theme.of(context).colorScheme.surfaceContainerHighest,
          child: const SidePanel(),
        ),
        mainContent: Container(
          color: Theme.of(context).colorScheme.surface,
          child: const Center(
            child: Text('Main Calendar Grid'),
          ),
        ),
      ),
    );
  }
}
