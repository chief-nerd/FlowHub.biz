import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flowhub/features/home/domain/bloc/calendar_bloc.dart';
import 'package:flowhub/features/home/presentation/widgets/calendar_grid.dart';

void main() {
  group('CalendarBloc', () {
    late CalendarBloc calendarBloc;

    setUp(() {
      calendarBloc = CalendarBloc();
    });

    tearDown(() {
      calendarBloc.close();
    });

    test('initial state is correct', () {
      expect(calendarBloc.state.viewMode, CalendarViewMode.day);
    });

    blocTest<CalendarBloc, CalendarState>(
      'emits new view mode when CalendarViewModeChanged is added',
      build: () => calendarBloc,
      act: (bloc) => bloc.add(const CalendarViewModeChanged(CalendarViewMode.week)),
      expect: () => [
        isA<CalendarState>().having((s) => s.viewMode, 'viewMode', CalendarViewMode.week),
      ],
    );

    blocTest<CalendarBloc, CalendarState>(
      'updates reference date when CalendarReferenceDateNavigated is added',
      build: () => calendarBloc,
      act: (bloc) => bloc.add(const CalendarReferenceDateNavigated(1)),
      verify: (bloc) {
        expect(bloc.state.referenceDate.isAfter(DateTime.now().subtract(const Duration(seconds: 1))), isTrue);
      },
    );
  });
}
