import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

enum PluginType {
  github,
  msTodo,
  flaggedEmails,
  frappe,
}

typedef LocalizedStringCallback = String Function(AppLocalizations l10n);

class PluginDefinition {
  final PluginType type;
  final IconData icon;
  final LocalizedStringCallback getName;
  final LocalizedStringCallback getDescription;

  const PluginDefinition({
    required this.type,
    required this.icon,
    required this.getName,
    required this.getDescription,
  });
}

class PluginRegistry {
  static final List<PluginDefinition> definitions = [
    PluginDefinition(
      type: PluginType.github,
      icon: Icons.code,
      getName: (l10n) => l10n.githubPlugin,
      getDescription: (l10n) => l10n.pluginDescription(l10n.githubPlugin),
    ),
    PluginDefinition(
      type: PluginType.msTodo,
      icon: Icons.check_circle_outline,
      getName: (l10n) => l10n.msTodoPlugin,
      getDescription: (l10n) => l10n.pluginDescription(l10n.msTodoPlugin),
    ),
    PluginDefinition(
      type: PluginType.flaggedEmails,
      icon: Icons.email_outlined,
      getName: (l10n) => l10n.flaggedEmailsPlugin,
      getDescription: (l10n) => l10n.pluginDescription(l10n.flaggedEmailsPlugin),
    ),
    PluginDefinition(
      type: PluginType.frappe,
      icon: Icons.business,
      getName: (l10n) => l10n.frappePlugin,
      getDescription: (l10n) => l10n.pluginDescription(l10n.frappePlugin),
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
