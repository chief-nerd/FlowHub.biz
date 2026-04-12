import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import '../../../../shared/layouts/split_pane_layout.dart';
import '../widgets/side_panel.dart';
import '../widgets/calendar_grid.dart';
import '../../domain/bloc/todo_bloc.dart';
import '../../../sync/data/repositories/todo_repository.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  CalendarViewMode _viewMode = CalendarViewMode.day;
  DateTime _referenceDate = DateTime.now();

  void _changeDate(int days) {
    setState(() {
      _referenceDate = _referenceDate.add(Duration(days: days));
    });
  }

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
        mainContent: Column(
          children: [
            _buildToolbar(),
            Expanded(
              child: Container(
                color: Theme.of(context).colorScheme.surface,
                child: CalendarGrid(
                  viewMode: _viewMode,
                  referenceDate: _referenceDate,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildToolbar() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        border: Border(bottom: BorderSide(color: Theme.of(context).dividerColor)),
      ),
      child: Wrap(
        spacing: 8.0,
        runSpacing: 8.0,
        crossAxisAlignment: WrapCrossAlignment.center,
        alignment: WrapAlignment.spaceBetween,
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                DateFormat('MMMM yyyy').format(_referenceDate),
                style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(width: 8),
              IconButton(
                icon: const Icon(Icons.chevron_left),
                onPressed: () => _changeDate(-1),
              ),
              TextButton(
                onPressed: () => setState(() => _referenceDate = DateTime.now()),
                child: const Text('Today'),
              ),
              IconButton(
                icon: const Icon(Icons.chevron_right),
                onPressed: () => _changeDate(1),
              ),
            ],
          ),
          SegmentedButton<CalendarViewMode>(
            showSelectedIcon: false,
            segments: const [
              ButtonSegment(value: CalendarViewMode.day, label: Text('D')),
              ButtonSegment(value: CalendarViewMode.threeDay, label: Text('3D')),
              ButtonSegment(value: CalendarViewMode.workWeek, label: Text('Wk')),
              ButtonSegment(value: CalendarViewMode.week, label: Text('W')),
              ButtonSegment(value: CalendarViewMode.month, label: Text('M')),
            ],
            selected: {_viewMode},
            onSelectionChanged: (Set<CalendarViewMode> newSelection) {
              setState(() {
                _viewMode = newSelection.first;
              });
            },
          ),
        ],
      ),
    );
  }
}
