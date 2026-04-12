import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:flowhub/features/home/presentation/pages/home_page.dart';
import 'package:flowhub/features/home/presentation/widgets/calendar_grid.dart';
import 'package:flowhub/features/home/domain/bloc/todo_bloc.dart';
import 'package:flowhub/features/sync/data/repositories/todo_repository.dart';
import 'package:flowhub/features/sync/data/models/todo.dart';

class MockTodoRepository extends Mock implements TodoRepository {}

void main() {
  late TodoRepository todoRepository;

  setUp(() {
    todoRepository = MockTodoRepository();
    when(() => todoRepository.watchTodos()).thenAnswer((_) => Stream.value([]));
  });

  Widget createWidgetUnderTest() {
    return MaterialApp(
      home: RepositoryProvider.value(
        value: todoRepository,
        child: const HomePage(),
      ),
    );
  }

  testWidgets('HomePage renders SidePanel and MainContent', (WidgetTester tester) async {
    await tester.pumpWidget(createWidgetUnderTest());
    await tester.pump(); // Allow BLoC to initialize

    expect(find.text('Inbox'), findsAtLeastNWidgets(1));
    expect(find.byType(CalendarGrid), findsOneWidget);
  });
}
