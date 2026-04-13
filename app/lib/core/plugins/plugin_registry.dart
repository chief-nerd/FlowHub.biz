import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'auth/github_connect_form.dart';
import 'auth/ms_todo_connect_form.dart';
import 'auth/flagged_emails_connect_form.dart';
import 'auth/frappe_connect_form.dart';

export 'auth/github_connect_form.dart';
export 'auth/ms_todo_connect_form.dart';
export 'auth/flagged_emails_connect_form.dart';
export 'auth/frappe_connect_form.dart';

enum PluginType {
  github,
  msTodo,
  flaggedEmails,
  frappe,
}

typedef LocalizedStringCallback = String Function(AppLocalizations l10n);

/// Called by the plugin's connect form when the user submits valid credentials.
typedef OnPluginConnect = void Function(Map<String, String> credentials);

class PluginDefinition {
  final PluginType type;
  final IconData icon;
  final LocalizedStringCallback getName;
  final LocalizedStringCallback getDescription;

  /// Builds the plugin-specific auth form.
  /// [onConnect] must be called with the collected credentials when the user
  /// confirms. The dialog is closed by the caller after [onConnect] fires.
  final Widget Function(BuildContext context, OnPluginConnect onConnect)
      buildConnectContent;

  const PluginDefinition({
    required this.type,
    required this.icon,
    required this.getName,
    required this.getDescription,
    required this.buildConnectContent,
  });
}

class PluginRegistry {
  static final List<PluginDefinition> definitions = [
    PluginDefinition(
      type: PluginType.github,
      icon: Icons.code,
      getName: (l10n) => l10n.githubPlugin,
      getDescription: (l10n) => l10n.pluginDescription(l10n.githubPlugin),
      buildConnectContent: (ctx, onConnect) =>
          GitHubConnectForm(onConnect: onConnect),
    ),
    PluginDefinition(
      type: PluginType.msTodo,
      icon: Icons.check_circle_outline,
      getName: (l10n) => l10n.msTodoPlugin,
      getDescription: (l10n) => l10n.pluginDescription(l10n.msTodoPlugin),
      buildConnectContent: (ctx, onConnect) =>
          MsTodoConnectForm(onConnect: onConnect),
    ),
    PluginDefinition(
      type: PluginType.flaggedEmails,
      icon: Icons.email_outlined,
      getName: (l10n) => l10n.flaggedEmailsPlugin,
      getDescription: (l10n) => l10n.pluginDescription(l10n.flaggedEmailsPlugin),
      buildConnectContent: (ctx, onConnect) =>
          FlaggedEmailsConnectForm(onConnect: onConnect),
    ),
    PluginDefinition(
      type: PluginType.frappe,
      icon: Icons.business,
      getName: (l10n) => l10n.frappePlugin,
      getDescription: (l10n) => l10n.pluginDescription(l10n.frappePlugin),
      buildConnectContent: (ctx, onConnect) =>
          FrappeConnectForm(onConnect: onConnect),
    ),
  ];

  static PluginDefinition? getByType(PluginType type) {
    try {
      return definitions.firstWhere((d) => d.type == type);
    } catch (_) {
      return null;
    }
  }
}
