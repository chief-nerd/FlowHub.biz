import '../../features/home/presentation/widgets/calendar_grid.dart';

class FlowDateUtils {
  static List<DateTime> getVisibleDates(CalendarViewMode viewMode, DateTime referenceDate) {
    switch (viewMode) {
      case CalendarViewMode.day:
        return [referenceDate];
      case CalendarViewMode.threeDay:
        return List.generate(3, (i) => referenceDate.add(Duration(days: i)));
      case CalendarViewMode.workWeek:
        final monday = referenceDate.subtract(Duration(days: referenceDate.weekday - 1));
        return List.generate(5, (i) => monday.add(Duration(days: i)));
      case CalendarViewMode.week:
        final monday = referenceDate.subtract(Duration(days: referenceDate.weekday - 1));
        return List.generate(7, (i) => monday.add(Duration(days: i)));
      case CalendarViewMode.month:
        return [];
    }
  }

  static List<DateTime> getMonthCalendarDays(DateTime referenceDate) {
    final firstDayOfMonth = DateTime(referenceDate.year, referenceDate.month, 1);
    final lastDayOfMonth = DateTime(referenceDate.year, referenceDate.month + 1, 0);
    final daysInMonth = lastDayOfMonth.day;
    final firstWeekday = firstDayOfMonth.weekday; // 1 = Mon, 7 = Sun

    final daysBefore = firstWeekday - 1;
    final totalDaysToShow = (daysInMonth + daysBefore + 6) ~/ 7 * 7;

    return List.generate(totalDaysToShow, (i) {
      return firstDayOfMonth.add(Duration(days: i - daysBefore));
    });
  }
}
