import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import '../../../../core/models/enums.dart';

// Events
abstract class CalendarEvent extends Equatable {
  const CalendarEvent();

  @override
  List<Object?> get props => [];
}

class CalendarViewModeChanged extends CalendarEvent {
  final CalendarViewMode viewMode;
  const CalendarViewModeChanged(this.viewMode);

  @override
  List<Object?> get props => [viewMode];
}

class CalendarReferenceDateChanged extends CalendarEvent {
  final DateTime referenceDate;
  const CalendarReferenceDateChanged(this.referenceDate);

  @override
  List<Object?> get props => [referenceDate];
}

class CalendarReferenceDateNavigated extends CalendarEvent {
  final int days;
  const CalendarReferenceDateNavigated(this.days);

  @override
  List<Object?> get props => [days];
}

class CalendarTodayJumped extends CalendarEvent {
  const CalendarTodayJumped();
}

// State
class CalendarState extends Equatable {
  final CalendarViewMode viewMode;
  final DateTime referenceDate;

  const CalendarState({
    required this.viewMode,
    required this.referenceDate,
  });

  factory CalendarState.initial() => CalendarState(
    viewMode: CalendarViewMode.day,
    referenceDate: DateTime.now(),
  );

  CalendarState copyWith({
    CalendarViewMode? viewMode,
    DateTime? referenceDate,
  }) {
    return CalendarState(
      viewMode: viewMode ?? this.viewMode,
      referenceDate: referenceDate ?? this.referenceDate,
    );
  }

  @override
  List<Object?> get props => [viewMode, referenceDate];
}

// Bloc
class CalendarBloc extends Bloc<CalendarEvent, CalendarState> {
  CalendarBloc() : super(CalendarState.initial()) {
    on<CalendarViewModeChanged>((event, emit) {
      emit(state.copyWith(viewMode: event.viewMode));
    });

    on<CalendarReferenceDateChanged>((event, emit) {
      emit(state.copyWith(referenceDate: event.referenceDate));
    });

    on<CalendarReferenceDateNavigated>((event, emit) {
      final d = event.days; // direction: -1 or +1
      final ref = state.referenceDate;
      late DateTime next;
      switch (state.viewMode) {
        case CalendarViewMode.day:
          next = ref.add(Duration(days: d));
        case CalendarViewMode.threeDay:
          next = ref.add(Duration(days: 3 * d));
        case CalendarViewMode.workWeek:
        case CalendarViewMode.week:
          next = ref.add(Duration(days: 7 * d));
        case CalendarViewMode.month:
          next = DateTime(ref.year, ref.month + d, 1);
      }
      emit(state.copyWith(referenceDate: next));
    });

    on<CalendarTodayJumped>((event, emit) {
      emit(state.copyWith(referenceDate: DateTime.now()));
    });
  }
}
