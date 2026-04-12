import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../../../shared/layouts/split_pane_layout.dart';
import '../widgets/side_panel.dart';
import '../widgets/calendar_grid.dart';
import '../../domain/bloc/todo_bloc.dart';
import '../../domain/bloc/calendar_bloc.dart';
import '../../../sync/data/repositories/todo_repository.dart';
import '../../../sync/data/repositories/tag_repository.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => TodoBloc(
            todoRepository: context.read<TodoRepository>(),
            tagRepository: context.read<TagRepository>(),
          )..add(LoadTodos()),
        ),
        BlocProvider(
          create: (context) => CalendarBloc(),
        ),
      ],
      child: SplitPaneLayout(
        sidePanel: Container(
          color: Theme.of(context).colorScheme.surfaceContainerHighest,
          child: const SidePanel(),
        ),
        mainContent: BlocBuilder<CalendarBloc, CalendarState>(
          builder: (context, state) {
            return Column(
              children: [
                _buildToolbar(context, state),
                Expanded(
                  child: Container(
                    color: Theme.of(context).colorScheme.surface,
                    child: CalendarGrid(
                      viewMode: state.viewMode,
                      referenceDate: state.referenceDate,
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  Widget _buildToolbar(BuildContext context, CalendarState state) {
    final l10n = AppLocalizations.of(context)!;
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
                DateFormat('MMMM yyyy').format(state.referenceDate),
                style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(width: 8),
              IconButton(
                icon: const Icon(Icons.chevron_left),
                onPressed: () => context.read<CalendarBloc>().add(const CalendarReferenceDateNavigated(-1)),
              ),
              TextButton(
                onPressed: () => context.read<CalendarBloc>().add(const CalendarTodayJumped()),
                child: Text(l10n.today),
              ),
              IconButton(
                icon: const Icon(Icons.chevron_right),
                onPressed: () => context.read<CalendarBloc>().add(const CalendarReferenceDateNavigated(1)),
              ),
            ],
          ),
          SegmentedButton<CalendarViewMode>(
            showSelectedIcon: false,
            segments: [
              ButtonSegment(value: CalendarViewMode.day, label: Text(l10n.viewDayShort)),
              ButtonSegment(value: CalendarViewMode.threeDay, label: Text(l10n.view3DayShort)),
              ButtonSegment(value: CalendarViewMode.workWeek, label: Text(l10n.viewWorkWeekShort)),
              ButtonSegment(value: CalendarViewMode.week, label: Text(l10n.viewWeekShort)),
              ButtonSegment(value: CalendarViewMode.month, label: Text(l10n.viewMonthShort)),
            ],
            selected: {state.viewMode},
            onSelectionChanged: (Set<CalendarViewMode> newSelection) {
              context.read<CalendarBloc>().add(CalendarViewModeChanged(newSelection.first));
            },
          ),
        ],
      ),
    );
  }
}
