import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flowhub/shared/layouts/split_pane_layout.dart';

void main() {
  Widget createWidgetUnderTest() {
    return const MaterialApp(
      home: SplitPaneLayout(
        sidePanel: Text('Side Panel Content'),
        mainContent: Text('Main Content'),
      ),
    );
  }

  testWidgets('SplitPaneLayout shows side panel by default and can toggle it', (WidgetTester tester) async {
    await tester.pumpWidget(createWidgetUnderTest());

    // Initially visible
    expect(find.text('Side Panel Content'), findsOneWidget);
    expect(find.text('Main Content'), findsOneWidget);
    expect(find.byIcon(Icons.arrow_left), findsOneWidget);

    // Get initial width of side panel container
    final sidePanelFinder = find.ancestor(
      of: find.text('Side Panel Content'),
      matching: find.byType(AnimatedContainer),
    ).first;
    
    AnimatedContainer container = tester.widget(sidePanelFinder);
    expect(container.constraints?.maxWidth, 280.0);

    // Tap toggle
    await tester.tap(find.byType(GestureDetector));
    await tester.pumpAndSettle();

    // Icon should change
    expect(find.byIcon(Icons.arrow_right), findsOneWidget);
    
    // Side panel should have 0 width now
    container = tester.widget(sidePanelFinder);
    expect(container.constraints?.maxWidth, 0.0);
    
    // Tap again to show
    await tester.tap(find.byType(GestureDetector));
    await tester.pumpAndSettle();
    
    expect(find.byIcon(Icons.arrow_left), findsOneWidget);
    container = tester.widget(sidePanelFinder);
    expect(container.constraints?.maxWidth, 280.0);
  });
}
