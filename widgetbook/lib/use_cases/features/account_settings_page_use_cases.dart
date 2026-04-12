import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart';
import 'package:flowhub/features/settings/presentation/pages/account_settings_page.dart';
import 'package:flowhub/features/settings/domain/bloc/settings_bloc.dart';

@WidgetbookUseCase(name: 'Default', type: AccountSettingsPage)
Widget buildAccountSettingsPageUseCase(BuildContext context) {
  return const AccountSettingsPage();
}
