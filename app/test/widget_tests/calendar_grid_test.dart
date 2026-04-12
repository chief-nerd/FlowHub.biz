import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flowhub/features/home/presentation/widgets/calendar_grid.dart';

void main() {
  final referenceDate = DateTime(2024, 1, 1);

  testWidgets('CalendarGrid renders and displays time labels', (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        localizationsDelegates: const [
          AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: const [
          Locale('en', ''),
        ],
        home: Scaffold(
          body: CalendarGrid(referenceDate: referenceDate),
        ),
      ),
    );

    await tester.pumpAndSettle();

    // 12 AM / PM labels
    expect(find.text('12 AM'), findsOneWidget);
    expect(find.text('12 PM'), findsOneWidget);
  });

  testWidgets('CalendarGrid displays 24h format when requested', (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        localizationsDelegates: const [
          AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: const [
          Locale('en', ''),
        ],
        home: Scaffold(
          body: CalendarGrid(
            referenceDate: referenceDate,
            use24HourFormat: true,
          ),
        ),
      ),
    );

    await tester.pumpAndSettle();

    expect(find.text('00:00'), findsOneWidget);
    expect(find.text('13:00'), findsOneWidget);
  });

  testWidgets('CalendarGrid shows multiple columns for week view', (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        localizationsDelegates: const [
          AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: const [
          Locale('en', ''),
        ],
        home: Scaffold(
          body: CalendarGrid(
            referenceDate: referenceDate,
            viewMode: CalendarViewMode.week,
          ),
        ),
      ),
    );

    await tester.pumpAndSettle();

    // In week view, we should see day headers.
    // Mon, Jan 1st 2024 was a Monday.
    expect(find.text('MON'), findsOneWidget);
    expect(find.text('SUN'), findsOneWidget);
  });
}
