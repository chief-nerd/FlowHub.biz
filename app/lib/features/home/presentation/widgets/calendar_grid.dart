import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

enum CalendarViewMode {
  day,
  threeDay,
  workWeek,
  week,
  month,
}

class CalendarGrid extends StatefulWidget {
  final bool use24HourFormat;
  final CalendarViewMode viewMode;
  final DateTime referenceDate;

  const CalendarGrid({
    super.key,
    this.use24HourFormat = false,
    this.viewMode = CalendarViewMode.day,
    required this.referenceDate,
  });

  @override
  State<CalendarGrid> createState() => _CalendarGridState();
}

class _CalendarGridState extends State<CalendarGrid> {
  final ScrollController _scrollController = ScrollController();
  
  double get _pixelsPerMinute {
    final height = MediaQuery.of(context).size.height;
    return (height / (12 * 60)).clamp(1.5, 3.0);
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _scrollToCurrentTime();
    });
  }

  void _scrollToCurrentTime() {
    final now = DateTime.now();
    final minutesSinceMidnight = now.hour * 60 + now.minute;
    final offset = (minutesSinceMidnight * _pixelsPerMinute) - 200;
    if (_scrollController.hasClients) {
      _scrollController.jumpTo(offset.clamp(0.0, _scrollController.position.maxScrollExtent));
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  List<DateTime> _getVisibleDates() {
    switch (widget.viewMode) {
      case CalendarViewMode.day:
        return [widget.referenceDate];
      case CalendarViewMode.threeDay:
        return List.generate(3, (i) => widget.referenceDate.add(Duration(days: i)));
      case CalendarViewMode.workWeek:
        final monday = widget.referenceDate.subtract(Duration(days: widget.referenceDate.weekday - 1));
        return List.generate(5, (i) => monday.add(Duration(days: i)));
      case CalendarViewMode.week:
        final monday = widget.referenceDate.subtract(Duration(days: widget.referenceDate.weekday - 1));
        return List.generate(7, (i) => monday.add(Duration(days: i)));
      case CalendarViewMode.month:
        return []; // Month view will be handled separately
    }
  }

  @override
  Widget build(BuildContext context) {
    if (widget.viewMode == CalendarViewMode.month) {
      return _buildMonthView();
    }

    final visibleDates = _getVisibleDates();
    final double totalHeight = 24 * 60 * _pixelsPerMinute;

    return Column(
      children: [
        // Headers
        Row(
          children: [
            const SizedBox(width: 70), // Alignment with time labels
            ...visibleDates.map((date) => Expanded(
              child: _buildDateHeader(date),
            )),
          ],
        ),
        Expanded(
          child: SingleChildScrollView(
            controller: _scrollController,
            child: SizedBox(
              height: totalHeight,
              child: Stack(
                children: [
                  Positioned.fill(
                    left: 70.0,
                    child: CustomPaint(
                      painter: _GridPainter(
                        dividerColor: Theme.of(context).dividerColor,
                        pixelsPerMinute: _pixelsPerMinute,
                        columns: visibleDates.length,
                      ),
                    ),
                  ),
                  Positioned(
                    left: 0,
                    top: 0,
                    bottom: 0,
                    width: 70.0,
                    child: _buildTimeLabels(context),
                  ),
                  _buildCurrentTimeIndicator(visibleDates),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildDateHeader(DateTime date) {
    final isToday = DateUtils.isSameDay(date, DateTime.now());
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12.0),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(color: Theme.of(context).dividerColor),
          left: BorderSide(color: Theme.of(context).dividerColor),
        ),
      ),
      child: Column(
        children: [
          Text(
            DateFormat('E').format(date).toUpperCase(),
            style: TextStyle(
              fontSize: 11,
              fontWeight: FontWeight.bold,
              color: isToday ? Theme.of(context).colorScheme.primary : Theme.of(context).colorScheme.onSurfaceVariant,
            ),
          ),
          const SizedBox(height: 4),
          CircleAvatar(
            radius: 16,
            backgroundColor: isToday ? Theme.of(context).colorScheme.primary : Colors.transparent,
            child: Text(
              date.day.toString(),
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: isToday ? Theme.of(context).colorScheme.onPrimary : Theme.of(context).colorScheme.onSurface,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTimeLabels(BuildContext context) {
    return Column(
      children: List.generate(24, (index) {
        final time = DateTime(2024, 1, 1, index);
        final format = widget.use24HourFormat ? 'HH:00' : 'h a';
        final label = DateFormat(format).format(time);

        return SizedBox(
          height: 60 * _pixelsPerMinute,
          child: Align(
            alignment: Alignment.topCenter,
            child: Transform.translate(
              offset: const Offset(0, -8),
              child: Text(
                label,
                style: TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.w500,
                  color: Theme.of(context).colorScheme.onSurfaceVariant,
                ),
              ),
            ),
          ),
        );
      }),
    );
  }

  Widget _buildCurrentTimeIndicator(List<DateTime> visibleDates) {
    final now = DateTime.now();
    int todayIndex = -1;
    for (int i = 0; i < visibleDates.length; i++) {
      if (DateUtils.isSameDay(visibleDates[i], now)) {
        todayIndex = i;
        break;
      }
    }

    if (todayIndex == -1) return const SizedBox.shrink();

    final minutes = now.hour * 60 + now.minute;
    final offset = minutes * _pixelsPerMinute;
    
    final columnWidth = (MediaQuery.of(context).size.width - 70 - 280) / visibleDates.length; // 280 is side panel width (approx)
    // Actually using LayoutBuilder constraints would be better for width but let's use Stack fill + Positioned

    return Positioned(
      top: offset,
      left: 70.0,
      right: 0,
      child: LayoutBuilder(
        builder: (context, constraints) {
          final columnWidth = constraints.maxWidth / visibleDates.length;
          return Stack(
            clipBehavior: Clip.none,
            children: [
              Positioned(
                left: (todayIndex * columnWidth) - 4,
                top: -3,
                child: Container(
                  width: 8,
                  height: 8,
                  decoration: const BoxDecoration(
                    color: Colors.red,
                    shape: BoxShape.circle,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: todayIndex * columnWidth),
                width: columnWidth,
                height: 2,
                color: Colors.red,
              ),
            ],
          );
        }
      ),
    );
  }

  Widget _buildMonthView() {
    final firstDayOfMonth = DateTime(widget.referenceDate.year, widget.referenceDate.month, 1);
    final lastDayOfMonth = DateTime(widget.referenceDate.year, widget.referenceDate.month + 1, 0);
    final daysInMonth = lastDayOfMonth.day;
    final firstWeekday = firstDayOfMonth.weekday; // 1 = Mon, 7 = Sun

    // Adjust for Monday start: subtract (firstWeekday - 1)
    final daysBefore = firstWeekday - 1;
    final totalDaysToShow = (daysInMonth + daysBefore + 6) ~/ 7 * 7;

    final calendarDays = List.generate(totalDaysToShow, (i) {
      return firstDayOfMonth.add(Duration(days: i - daysBefore));
    });

    return Column(
      children: [
        // Weekday headers
        Row(
          children: ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'].map((d) => Expanded(
            child: Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Text(
                  d,
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).colorScheme.onSurfaceVariant,
                  ),
                ),
              ),
            ),
          )).toList(),
        ),
        Expanded(
          child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 7,
              childAspectRatio: 1.0,
            ),
            itemCount: calendarDays.length,
            itemBuilder: (context, index) {
              final date = calendarDays[index];
              final isCurrentMonth = date.month == widget.referenceDate.month;
              final isToday = DateUtils.isSameDay(date, DateTime.now());

              return Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Theme.of(context).dividerColor.withOpacity(0.1)),
                  color: isToday ? Theme.of(context).colorScheme.primaryContainer.withOpacity(0.3) : null,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Text(
                        date.day.toString(),
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: isToday ? FontWeight.bold : FontWeight.normal,
                          color: isCurrentMonth 
                            ? (isToday ? Theme.of(context).colorScheme.primary : Theme.of(context).colorScheme.onSurface)
                            : Theme.of(context).colorScheme.onSurface.withOpacity(0.3),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}

class _GridPainter extends CustomPainter {
  final Color dividerColor;
  final double pixelsPerMinute;
  final int columns;

  _GridPainter({
    required this.dividerColor,
    required this.pixelsPerMinute,
    required this.columns,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = dividerColor
      ..strokeWidth = 1.0;

    final minorPaint = Paint()
      ..color = dividerColor.withOpacity(0.1)
      ..strokeWidth = 0.5;

    final pixelsPerHour = 60 * pixelsPerMinute;
    final pixelsPer15Min = 15 * pixelsPerMinute;

    // Horizontal lines
    for (int i = 0; i <= 24; i++) {
      final y = i * pixelsPerHour;
      canvas.drawLine(Offset(0, y), Offset(size.width, y), paint);

      if (i < 24) {
        for (int j = 1; j < 4; j++) {
          final minorY = y + (j * pixelsPer15Min);
          canvas.drawLine(Offset(0, minorY), Offset(size.width, minorY), minorPaint);
        }
      }
    }

    // Vertical lines
    final columnWidth = size.width / columns;
    for (int i = 0; i <= columns; i++) {
      final x = i * columnWidth;
      canvas.drawLine(Offset(x, 0), Offset(x, size.height), paint);
    }
  }

  @override
  bool shouldRepaint(covariant _GridPainter oldDelegate) {
    return oldDelegate.dividerColor != dividerColor ||
           oldDelegate.pixelsPerMinute != pixelsPerMinute ||
           oldDelegate.columns != columns;
  }
}
