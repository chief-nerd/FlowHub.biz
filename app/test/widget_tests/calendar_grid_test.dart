import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flowhub/features/home/presentation/widgets/calendar_grid.dart';

void main() {
  testWidgets('CalendarGrid renders and displays time labels', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        localizationsDelegates: [
          AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: [
          Locale('en', ''),
        ],
        home: Scaffold(
          body: CalendarGrid(),
        ),
      ),
    );

    // Initial pump and settle
    await tester.pumpAndSettle();

    // Verify time labels are present in the tree
    // 12:00 AM / PM is for 12h format
    expect(find.text('12:00 AM'), findsOneWidget);
    expect(find.text('12:00 PM'), findsOneWidget);
  });

  testWidgets('CalendarGrid displays 24h format when requested', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        localizationsDelegates: [
          AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: [
          Locale('en', ''),
        ],
        home: Scaffold(
          body: CalendarGrid(use24HourFormat: true),
        ),
      ),
    );

    await tester.pumpAndSettle();

    expect(find.text('00:00'), findsOneWidget);
    expect(find.text('13:00'), findsOneWidget);
  });
}
