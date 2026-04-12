import 'package:flutter/material.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart';
import 'package:flowhub/features/home/presentation/widgets/calendar_grid.dart';

@WidgetbookUseCase(name: 'Default', type: CalendarGrid)
Widget buildCalendarGridUseCase(BuildContext context) {
  return const Scaffold(
    body: CalendarGrid(),
  );
}
