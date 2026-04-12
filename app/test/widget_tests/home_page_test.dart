import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:mocktail/mocktail.dart';
import 'package:flowhub/features/home/presentation/pages/home_page.dart';
import 'package:flowhub/features/home/presentation/widgets/calendar_grid.dart';
import 'package:flowhub/features/sync/data/repositories/todo_repository.dart';
import 'package:flowhub/features/sync/data/repositories/tag_repository.dart';

class MockTodoRepository extends Mock implements TodoRepository {}
class MockTagRepository extends Mock implements TagRepository {}

void main() {
  late TodoRepository todoRepository;
  late TagRepository tagRepository;

  setUp(() {
    todoRepository = MockTodoRepository();
    tagRepository = MockTagRepository();
    when(() => todoRepository.watchTodos()).thenAnswer((_) => Stream.value([]));
    when(() => tagRepository.watchTags()).thenAnswer((_) => Stream.value([]));
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
      home: MultiRepositoryProvider(
        providers: [
          RepositoryProvider.value(value: todoRepository),
          RepositoryProvider.value(value: tagRepository),
        ],
        child: const HomePage(),
      ),
    );
  }

  testWidgets('HomePage renders SidePanel and MainContent', (WidgetTester tester) async {
    await tester.pumpWidget(createWidgetUnderTest());
    await tester.pumpAndSettle();

    expect(find.text('Inbox'), findsAtLeastNWidgets(1));
    expect(find.byType(CalendarGrid), findsOneWidget);
  });
}
