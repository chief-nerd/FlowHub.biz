import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flowhub/main.dart';

void main() {
  testWidgets('FlowHub basic test', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());
    expect(find.text('FlowHub is running'), findsOneWidget);
  });
}
