enum TodoStatus {
  draft,
  inProgress,
  waiting,
  completed,
}

enum TodoSourceType {
  native,
  github,
  msTodo,
}

enum TodoImportance {
  critical,
  high,
  medium,
  low,
}

enum WorkSessionStatus {
  scheduled,
  logged,
  ghost,
}

enum CalendarViewMode {
  day,
  threeDay,
  workWeek,
  week,
  month,
}

enum TodoViewFilter {
  inbox,
  today,
  thisWorkWeek,
  thisWeekAfterwork,
  thisMonth,
  delegated,
}
