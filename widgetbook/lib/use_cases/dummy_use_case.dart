import 'package:flutter/material.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart';

@WidgetbookUseCase(name: 'Dummy', type: Text)
Widget buildDummyUseCase(BuildContext context) {
  return const Text('Dummy Use Case');
}
