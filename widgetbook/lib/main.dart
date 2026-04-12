import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:mocktail/mocktail.dart';

// Import from the flowhub package
import 'package:flowhub/shared/layouts/split_pane_layout.dart';
import 'package:flowhub/features/home/presentation/widgets/todo_list_item.dart';
import 'package:flowhub/features/home/presentation/widgets/side_panel.dart';
import 'package:flowhub/features/home/presentation/widgets/calendar_grid.dart';
import 'package:flowhub/features/home/domain/bloc/todo_bloc.dart';
import 'package:flowhub/features/sync/data/models/todo.dart';

class MockTodoBloc extends Mock implements TodoBloc {}

void main() {
  runApp(const WidgetbookApp());
}

class WidgetbookApp extends StatelessWidget {
  const WidgetbookApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Widgetbook.material(
      directories: [
        WidgetbookCategory(
          name: 'Layouts',
          children: [
            WidgetbookComponent(
              name: 'SplitPaneLayout',
              useCases: [
                WidgetbookUseCase(
                  name: 'Default',
                  builder: (context) => SplitPaneLayout(
                    sidePanel: Container(
                      color: Colors.blue.withOpacity(0.1),
                      child: const Center(child: Text('Side Panel')),
                    ),
                    mainContent: const Center(child: Text('Main Content')),
                  ),
                ),
              ],
            ),
          ],
        ),
        WidgetbookCategory(
          name: 'Components',
          children: [
            WidgetbookComponent(
              name: 'TodoListItem',
              useCases: [
                WidgetbookUseCase(
                  name: 'Simple Task',
                  builder: (context) => TodoListItem(
                    todo: Todo()..title = 'Complete Widgetbook setup',
                    allTodos: const [],
                  ),
                ),
                WidgetbookUseCase(
                  name: 'Nested Tasks',
                  builder: (context) => TodoListItem(
                    todo: Todo()
                      ..title = 'Parent Task'
                      ..externalId = 'p1',
                    allTodos: [
                      Todo()
                        ..title = 'Parent Task'
                        ..externalId = 'p1',
                      Todo()
                        ..title = 'Child Task 1'
                        ..externalId = 'c1'
                        ..parentExternalId = 'p1',
                      Todo()
                        ..title = 'Child Task 2'
                        ..externalId = 'c2'
                        ..parentExternalId = 'p1',
                    ],
                  ),
                ),
              ],
            ),
            WidgetbookComponent(
              name: 'CalendarGrid',
              useCases: [
                WidgetbookUseCase(
                  name: 'Default',
                  builder: (context) => CalendarGrid(
                    use24HourFormat: context.knobs.boolean(
                      label: '24 Hour Format',
                      initialValue: false,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
        WidgetbookCategory(
          name: 'Features',
          children: [
            WidgetbookComponent(
              name: 'SidePanel',
              useCases: [
                WidgetbookUseCase(
                  name: 'Default',
                  builder: (context) {
                    final mockBloc = MockTodoBloc();
                    final todos = [
                      Todo()..title = 'Regular Task'..status = TodoStatus.draft,
                      Todo()..title = 'Overdue Task'..status = TodoStatus.inProgress,
                    ];

                    when(() => mockBloc.state).thenReturn(TodoLoaded(
                      allTodos: todos,
                      viewTodos: [todos[0]],
                      overdueTodos: [todos[1]],
                      activeFilter: TodoViewFilter.inbox,
                    ));
                    
                    // ignore: close_sinks
                    when(() => mockBloc.stream).thenAnswer((_) => const Stream.empty());

                    return BlocProvider<TodoBloc>.value(
                      value: mockBloc,
                      child: const SidePanel(),
                    );
                  },
                ),
              ],
            ),
          ],
        ),
      ],
      addons: [
        MaterialThemeAddon(
          themes: [
            WidgetbookTheme(
              name: 'Light',
              data: ThemeData.light(),
            ),
            WidgetbookTheme(
              name: 'Dark',
              data: ThemeData.dark(),
            ),
          ],
        ),
        DeviceFrameAddon(
          devices: [
            Devices.ios.iPhone13,
            Devices.android.samsungGalaxyS20,
          ],
        ),
        LocalizationAddon(
          locales: [
            const Locale('en', ''),
          ],
          localizationsDelegates: [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
        ),
      ],
    );
  }
}
