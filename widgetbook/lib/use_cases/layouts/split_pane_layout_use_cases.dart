import 'package:flutter/material.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart';
import 'package:flowhub/shared/layouts/split_pane_layout.dart';

@WidgetbookUseCase(name: 'Default', type: SplitPaneLayout)
Widget buildSplitPaneLayoutUseCase(BuildContext context) {
  return SplitPaneLayout(
    sidePanel: Container(
      color: Colors.blue.withOpacity(0.1),
      child: const Center(child: Text('Side Panel')),
    ),
    mainContent: const Center(child: Text('Main Content')),
  );
}
