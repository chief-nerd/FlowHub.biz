import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../../../core/utils/date_utils.dart';
import '../../../../shared/constants/layout_constants.dart';
import '../../../../core/models/enums.dart';

class CalendarGrid extends StatefulWidget {
  final bool use24HourFormat;
  final CalendarViewMode viewMode;
  final DateTime referenceDate;

  static const double timeLabelWidth = 70.0;
  static const double gridScrollOffset = 200.0;

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

  @override
  void didUpdateWidget(CalendarGrid oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.viewMode != widget.viewMode || oldWidget.referenceDate != widget.referenceDate) {
      // Potentially re-scroll or adjust
    }
  }

  void _scrollToCurrentTime() {
    final now = DateTime.now();
    final minutesSinceMidnight = now.hour * 60 + now.minute;
    final offset = (minutesSinceMidnight * _pixelsPerMinute) - CalendarGrid.gridScrollOffset;
    if (_scrollController.hasClients) {
      _scrollController.jumpTo(offset.clamp(0.0, _scrollController.position.maxScrollExtent));
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.viewMode == CalendarViewMode.month) {
      return _buildMonthView();
    }

    final visibleDates = FlowDateUtils.getVisibleDates(widget.viewMode, widget.referenceDate);
    final double totalHeight = 24 * 60 * _pixelsPerMinute;

    return Column(
      children: [
        // Headers
        Row(
          children: [
            const SizedBox(width: CalendarGrid.timeLabelWidth),
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
                    left: CalendarGrid.timeLabelWidth,
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
                    width: CalendarGrid.timeLabelWidth,
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
    final theme = Theme.of(context);
    return Container(
      height: LayoutConstants.calendarHeaderHeight,
      padding: const EdgeInsets.symmetric(vertical: 12.0),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(color: theme.dividerColor),
          left: BorderSide(color: theme.dividerColor),
        ),
      ),
      child: Column(
        children: [
          Text(
            DateFormat('E').format(date).toUpperCase(),
            style: TextStyle(
              fontSize: 11,
              fontWeight: FontWeight.bold,
              color: isToday ? theme.colorScheme.primary : theme.colorScheme.onSurfaceVariant,
            ),
          ),
          const SizedBox(height: 4),
          CircleAvatar(
            radius: 16,
            backgroundColor: isToday ? theme.colorScheme.primary : Colors.transparent,
            child: Text(
              date.day.toString(),
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: isToday ? theme.colorScheme.onPrimary : theme.colorScheme.onSurface,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTimeLabels(BuildContext context) {
    final format = widget.use24HourFormat ? 'HH:00' : 'h a';
    final theme = Theme.of(context);
    
    return Column(
      children: List.generate(24, (index) {
        final time = DateTime(2000, 1, 1, index); // Arbitrary day for formatting
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
                  color: theme.colorScheme.onSurfaceVariant,
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
    
    return Positioned(
      top: offset,
      left: CalendarGrid.timeLabelWidth,
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
    final calendarDays = FlowDateUtils.getMonthCalendarDays(widget.referenceDate);
    final theme = Theme.of(context);

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
                    color: theme.colorScheme.onSurfaceVariant,
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
                  border: Border.all(color: theme.dividerColor.withOpacity(0.1)),
                  color: isToday ? theme.colorScheme.primaryContainer.withOpacity(0.3) : null,
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
                            ? (isToday ? theme.colorScheme.primary : theme.colorScheme.onSurface)
                            : theme.colorScheme.onSurface.withOpacity(0.3),
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
