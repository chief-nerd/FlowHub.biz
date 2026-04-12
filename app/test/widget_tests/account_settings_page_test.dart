import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flowhub/features/settings/presentation/pages/account_settings_page.dart';

void main() {
  testWidgets('AccountSettingsPage renders all plugin options', (WidgetTester tester) async {
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
        home: AccountSettingsPage(),
      ),
    );

    await tester.pumpAndSettle();

    expect(find.text('Account Settings'), findsOneWidget);
    expect(find.text('Plugins'), findsOneWidget);
    expect(find.text('GitHub'), findsOneWidget);
    expect(find.text('Microsoft To Do'), findsOneWidget);
    expect(find.text('Flagged Emails'), findsOneWidget);
    expect(find.text('Frappe / ERPNext'), findsOneWidget);
  });
}
