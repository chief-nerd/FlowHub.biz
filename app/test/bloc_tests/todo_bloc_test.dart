import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:flowhub/features/home/domain/bloc/todo_bloc.dart';
import 'package:flowhub/core/models/enums.dart';
import 'package:flowhub/features/sync/data/repositories/todo_repository.dart';
import 'package:flowhub/features/sync/data/repositories/tag_repository.dart';

class MockTodoRepository extends Mock implements TodoRepository {}
class MockTagRepository extends Mock implements TagRepository {}

void main() {
  group('TodoBloc', () {
    late TodoBloc todoBloc;
    late TodoRepository todoRepository;
    late TagRepository tagRepository;

    setUp(() {
      todoRepository = MockTodoRepository();
      tagRepository = MockTagRepository();
      
      when(() => todoRepository.watchTodos()).thenAnswer((_) => Stream.value([]));
      when(() => tagRepository.watchTags()).thenAnswer((_) => Stream.value([]));
      
      todoBloc = TodoBloc(
        todoRepository: todoRepository,
        tagRepository: tagRepository,
      );
    });

    tearDown(() {
      todoBloc.close();
    });

    test('initial state is TodoInitial', () {
      expect(todoBloc.state, isA<TodoInitial>());
    });

    blocTest<TodoBloc, TodoState>(
      'loads todos and tags when LoadTodos is added',
      build: () => todoBloc,
      act: (bloc) => bloc.add(LoadTodos()),
      expect: () => [
        isA<TodoLoading>(),
        isA<TodoLoaded>(),
      ],
    );

    blocTest<TodoBloc, TodoState>(
      'filters by tag when ChangeTagFilter is added',
      build: () => todoBloc,
      seed: () => const TodoLoaded(
        allTodos: [],
        viewTodos: [],
        overdueTodos: [],
        allTags: [],
        activeFilter: TodoViewFilter.inbox,
      ),
      act: (bloc) => bloc.add(const ChangeTagFilter('work')),
      expect: () => [
        isA<TodoLoaded>().having((s) => s.activeTagFilter, 'tag filter', 'work'),
      ],
    );
  });
}
