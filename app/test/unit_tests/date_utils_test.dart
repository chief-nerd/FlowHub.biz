import 'package:flutter_test/flutter_test.dart';
import 'package:flowhub/core/utils/date_utils.dart';
import 'package:flowhub/features/home/presentation/widgets/calendar_grid.dart';

void main() {
  group('FlowDateUtils', () {
    final referenceDate = DateTime(2024, 1, 1); // Monday

    test('getVisibleDates - Day mode', () {
      final dates = FlowDateUtils.getVisibleDates(CalendarViewMode.day, referenceDate);
      expect(dates.length, 1);
      expect(dates.first, referenceDate);
    });

    test('getVisibleDates - 3 Day mode', () {
      final dates = FlowDateUtils.getVisibleDates(CalendarViewMode.threeDay, referenceDate);
      expect(dates.length, 3);
      expect(dates[0], referenceDate);
      expect(dates[2], referenceDate.add(const Duration(days: 2)));
    });

    test('getVisibleDates - Work Week mode', () {
      final dates = FlowDateUtils.getVisibleDates(CalendarViewMode.workWeek, referenceDate);
      expect(dates.length, 5);
      expect(dates.first.weekday, DateTime.monday);
      expect(dates.last.weekday, DateTime.friday);
    });

    test('getVisibleDates - Week mode', () {
      final dates = FlowDateUtils.getVisibleDates(CalendarViewMode.week, referenceDate);
      expect(dates.length, 7);
      expect(dates.first.weekday, DateTime.monday);
      expect(dates.last.weekday, DateTime.sunday);
    });

    test('getMonthCalendarDays', () {
      // Jan 2024 starts on Monday
      final days = FlowDateUtils.getMonthCalendarDays(referenceDate);
      expect(days.length % 7, 0); // Always full weeks
      expect(days.first, referenceDate); // Since it was a Monday
    });
  });
}
