import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:mocktail/mocktail.dart';
import 'package:flowhub/features/home/domain/bloc/todo_bloc.dart';
import 'package:flowhub/features/home/presentation/widgets/side_panel.dart';
import 'package:flowhub/core/db/app_database.dart';
import 'package:flowhub/core/models/enums.dart';

class MockTodoBloc extends MockBloc<TodoEvent, TodoState> implements TodoBloc {}

void main() {
  late TodoBloc todoBloc;

  setUp(() {
    todoBloc = MockTodoBloc();
  });

  Widget createWidgetUnderTest() {
    return MaterialApp(
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('en', ''),
      ],
      home: BlocProvider.value(
        value: todoBloc,
        child: const Scaffold(
          body: SidePanel(),
        ),
      ),
    );
  }

  testWidgets('SidePanel shows filters and todos', (WidgetTester tester) async {
    final todos = [
      TodoWithTags(
        const Todo(
          externalId: '1',
          title: 'Inbox Task',
          status: TodoStatus.draft,
          importance: TodoImportance.medium,
          sourceType: TodoSourceType.native,
          ownerExternalId: 'u1',
          estimatedDuration: 0,
        ),
        const [],
      ),
    ];

    when(() => todoBloc.state).thenReturn(TodoLoaded(
      allTodos: todos,
      viewTodos: todos,
      overdueTodos: const [],
      allTags: const [],
      activeFilter: TodoViewFilter.inbox,
    ));

    await tester.pumpWidget(createWidgetUnderTest());
    await tester.pumpAndSettle();

    // Check filters
    expect(find.text('Inbox'), findsAtLeastNWidgets(1));

    // Check loaded todos in view
    expect(find.text('Inbox Task'), findsOneWidget);
  });
}
