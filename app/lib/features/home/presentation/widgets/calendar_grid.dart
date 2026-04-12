import 'package:flutter/material.dart';

class CalendarGrid extends StatefulWidget {
  const CalendarGrid({super.key});

  @override
  State<CalendarGrid> createState() => _CalendarGridState();
}

class _CalendarGridState extends State<CalendarGrid> {
  final ScrollController _scrollController = ScrollController();
  // 2 pixels per minute -> 1 hour = 120 pixels.
  final double _pixelsPerMinute = 2.0; 

  @override
  void initState() {
    super.initState();
    // Scroll to current time initially
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final now = DateTime.now();
      final minutesSinceMidnight = now.hour * 60 + now.minute;
      final offset = (minutesSinceMidnight * _pixelsPerMinute) - 200; // offset a bit
      if (_scrollController.hasClients) {
        _scrollController.jumpTo(offset.clamp(0.0, _scrollController.position.maxScrollExtent));
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final double totalHeight = 24 * 60 * _pixelsPerMinute;

    return SingleChildScrollView(
      controller: _scrollController,
      child: SizedBox(
        height: totalHeight,
        child: Stack(
          children: [
            Positioned.fill(
              left: 60.0, // Space for time labels
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
              width: 60.0,
              child: _buildTimeLabels(context),
            ),
            // Current Time Indicator
            _buildCurrentTimeIndicator(),
          ],
        ),
      ),
    );
  }

  Widget _buildTimeLabels(BuildContext context) {
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      itemCount: 24,
      itemBuilder: (context, index) {
        final isAM = index < 12;
        final hour = index == 0 ? 12 : (index > 12 ? index - 12 : index);
        final amPm = isAM ? 'AM' : 'PM';
        return SizedBox(
          height: 60 * _pixelsPerMinute,
          child: Align(
            alignment: Alignment.topCenter,
            child: Transform.translate(
              offset: const Offset(0, -8),
              child: Text(
                '$hour:00 $amPm',
                style: TextStyle(
                  fontSize: 12,
                  color: Theme.of(context).colorScheme.onSurfaceVariant,
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildCurrentTimeIndicator() {
    final now = DateTime.now();
    final minutes = now.hour * 60 + now.minute;
    final offset = minutes * _pixelsPerMinute;

    return Positioned(
      top: offset,
      left: 50.0,
      right: 0,
      child: Row(
        children: [
          Container(
            width: 10,
            height: 10,
            decoration: const BoxDecoration(
              color: Colors.red,
              shape: BoxShape.circle,
            ),
          ),
          Expanded(
            child: Container(
              height: 2,
              color: Colors.red,
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
      ..color = dividerColor.withOpacity(0.3)
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
