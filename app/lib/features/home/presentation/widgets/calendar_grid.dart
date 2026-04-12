import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CalendarGrid extends StatefulWidget {
  final bool use24HourFormat;

  const CalendarGrid({
    super.key,
    this.use24HourFormat = false,
  });

  @override
  State<CalendarGrid> createState() => _CalendarGridState();
}

class _CalendarGridState extends State<CalendarGrid> {
  final ScrollController _scrollController = ScrollController();
  
  // Base pixels per minute, can be adjusted for responsiveness
  double get _pixelsPerMinute {
    final height = MediaQuery.of(context).size.height;
    // Ensure at least a minimum height for the grid to be readable
    // On large screens, we might want to expand it, on small ones keep it scrollable
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

  @override
  Widget build(BuildContext context) {
    final double totalHeight = 24 * 60 * _pixelsPerMinute;

    return LayoutBuilder(
      builder: (context, constraints) {
        return SingleChildScrollView(
          controller: _scrollController,
          child: SizedBox(
            height: totalHeight,
            child: Stack(
              children: [
                Positioned.fill(
                  left: 70.0, // Space for time labels
                  child: CustomPaint(
                    painter: _GridPainter(
                      dividerColor: Theme.of(context).dividerColor,
                      pixelsPerMinute: _pixelsPerMinute,
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
                _buildCurrentTimeIndicator(),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildTimeLabels(BuildContext context) {
    return Column(
      children: List.generate(24, (index) {
        final time = DateTime(2024, 1, 1, index);
        final format = widget.use24HourFormat ? 'HH:00' : 'h:mm a';
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
                  fontSize: 11,
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

  Widget _buildCurrentTimeIndicator() {
    final now = DateTime.now();
    final minutes = now.hour * 60 + now.minute;
    final offset = minutes * _pixelsPerMinute;

    return Positioned(
      top: offset,
      left: 60.0,
      right: 0,
      child: Row(
        children: [
          Container(
            width: 8,
            height: 8,
            decoration: const BoxDecoration(
              color: Colors.red,
              shape: BoxShape.circle,
            ),
          ),
          Expanded(
            child: Container(
              height: 2,
              color: Colors.red.withOpacity(0.5),
            ),
          ),
        ],
      ),
    );
  }
}

class _GridPainter extends CustomPainter {
  final Color dividerColor;
  final double pixelsPerMinute;

  _GridPainter({
    required this.dividerColor,
    required this.pixelsPerMinute,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = dividerColor
      ..strokeWidth = 1.0;

    final minorPaint = Paint()
      ..color = dividerColor.withOpacity(0.2)
      ..strokeWidth = 0.5;

    final pixelsPerHour = 60 * pixelsPerMinute;
    final pixelsPer15Min = 15 * pixelsPerMinute;

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
  }

  @override
  bool shouldRepaint(covariant _GridPainter oldDelegate) {
    return oldDelegate.dividerColor != dividerColor ||
           oldDelegate.pixelsPerMinute != pixelsPerMinute;
  }
}
