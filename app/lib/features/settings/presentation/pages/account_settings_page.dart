import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../domain/bloc/settings_bloc.dart';

class AccountSettingsPage extends StatelessWidget {
  const AccountSettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SettingsBloc()..add(LoadSettings()),
      child: Scaffold(
        appBar: AppBar(
          title: Text(AppLocalizations.of(context)!.accountSettings),
        ),
        body: BlocBuilder<SettingsBloc, SettingsState>(
          builder: (context, state) {
            if (state is SettingsLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is SettingsLoaded) {
              return ListView(
                children: [
                  _buildSectionHeader(context, AppLocalizations.of(context)!.plugins),
                  ...state.plugins.map((plugin) => _buildPluginTile(context, plugin)),
                ],
              );
            } else if (state is SettingsError) {
              return Center(child: Text(state.message));
            }
            return const SizedBox.shrink();
          },
        ),
      ),
    );
  }

  Widget _buildSectionHeader(BuildContext context, String title) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 24, 16, 8),
      child: Text(
        title,
        style: Theme.of(context).textTheme.titleMedium?.copyWith(
              color: Theme.of(context).colorScheme.primary,
              fontWeight: FontWeight.bold,
            ),
      ),
    );
  }

  Widget _buildPluginTile(BuildContext context, PluginStatus plugin) {
    final l10n = AppLocalizations.of(context)!;
    final String name;
    final IconData icon;

    switch (plugin.type) {
      case PluginType.github:
        name = l10n.githubPlugin;
        icon = Icons.code;
        break;
      case PluginType.msTodo:
        name = l10n.msTodoPlugin;
        icon = Icons.check_circle_outline;
        break;
      case PluginType.flaggedEmails:
        name = l10n.flaggedEmailsPlugin;
        icon = Icons.email_outlined;
        break;
      case PluginType.frappe:
        name = l10n.frappePlugin;
        icon = Icons.business;
        break;
    }

    return ListTile(
      leading: Icon(icon, size: 28),
      title: Text(name),
      subtitle: Text(
        plugin.isConnected 
          ? '${l10n.connected}: ${plugin.accountName}' 
          : l10n.pluginDescription(name)
      ),
      trailing: plugin.isConnected
          ? TextButton(
              onPressed: () => context.read<SettingsBloc>().add(DisconnectPlugin(plugin.type)),
              child: Text(l10n.disconnect, style: const TextStyle(color: Colors.red)),
            )
          : ElevatedButton(
              onPressed: () => _showConnectDialog(context, plugin.type),
              child: Text(l10n.connect),
            ),
    );
  }

  void _showConnectDialog(BuildContext context, PluginType type) {
    final l10n = AppLocalizations.of(context)!;
    showDialog(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: Text('${l10n.connect} ${type.name.toUpperCase()}'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              decoration: InputDecoration(
                labelText: 'API Key / Token',
                hintText: 'Enter your ${type.name} token',
              ),
              obscureText: true,
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(dialogContext),
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () {
              context.read<SettingsBloc>().add(ConnectPlugin(type));
              Navigator.pop(dialogContext);
            },
            child: Text(l10n.connect),
          ),
        ],
      ),
    );
  }
}
