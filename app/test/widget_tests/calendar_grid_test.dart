import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flowhub/features/home/presentation/widgets/calendar_grid.dart';

void main() {
  testWidgets('CalendarGrid renders and displays time labels', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: CalendarGrid(),
        ),
      ),
    );

    // Initial pump and settle
    await tester.pumpAndSettle();

    // Verify time labels are present in the tree
    expect(find.text('12:00 AM'), findsOneWidget);
    expect(find.text('12:00 PM'), findsOneWidget);
  });
}
