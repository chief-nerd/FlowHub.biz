import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import '../../../../core/plugins/plugin_registry.dart';

class PluginStatus extends Equatable {
  final PluginType type;
  final bool isConnected;
  final String? accountName;

  const PluginStatus({
    required this.type,
    required this.isConnected,
    this.accountName,
  });

  @override
  List<Object?> get props => [type, isConnected, accountName];
}

// Events
abstract class SettingsEvent extends Equatable {
  const SettingsEvent();
  @override
  List<Object?> get props => [];
}

class LoadSettings extends SettingsEvent {}

class ConnectPlugin extends SettingsEvent {
  final PluginType type;
  final Map<String, String> credentials;

  const ConnectPlugin(this.type, this.credentials);

  @override
  List<Object?> get props => [type, credentials];
}

class DisconnectPlugin extends SettingsEvent {
  final PluginType type;
  const DisconnectPlugin(this.type);
  @override
  List<Object?> get props => [type];
}

// States
abstract class SettingsState extends Equatable {
  const SettingsState();
  @override
  List<Object?> get props => [];
}

class SettingsInitial extends SettingsState {}

class SettingsLoading extends SettingsState {}

class SettingsLoaded extends SettingsState {
  final List<PluginStatus> plugins;

  const SettingsLoaded({required this.plugins});

  @override
  List<Object?> get props => [plugins];
}

class SettingsError extends SettingsState {
  final String message;
  const SettingsError(this.message);
  @override
  List<Object?> get props => [message];
}

// Bloc
class SettingsBloc extends Bloc<SettingsEvent, SettingsState> {
  SettingsBloc() : super(SettingsInitial()) {
    on<LoadSettings>((event, emit) async {
      emit(SettingsLoading());
      // Simulate API call
      await Future.delayed(const Duration(milliseconds: 500));
      
      // Build list dynamically from Registry
      final initialPlugins = PluginRegistry.definitions.map((def) => 
        PluginStatus(type: def.type, isConnected: false)
      ).toList();

      emit(SettingsLoaded(plugins: initialPlugins));
    });

    on<ConnectPlugin>((event, emit) async {
      if (state is SettingsLoaded) {
        final currentPlugins = (state as SettingsLoaded).plugins;
        final accountName = _accountNameFrom(event.type, event.credentials);
        final updatedPlugins = currentPlugins.map((p) {
          if (p.type == event.type) {
            return PluginStatus(
                type: p.type, isConnected: true, accountName: accountName);
          }
          return p;
        }).toList();
        emit(SettingsLoaded(plugins: updatedPlugins));
      }
    });

    on<DisconnectPlugin>((event, emit) async {
      if (state is SettingsLoaded) {
        final currentPlugins = (state as SettingsLoaded).plugins;
        final updatedPlugins = currentPlugins.map((p) {
          if (p.type == event.type) {
            return PluginStatus(type: p.type, isConnected: false);
          }
          return p;
        }).toList();
        emit(SettingsLoaded(plugins: updatedPlugins));
      }
    });
  }

  String _accountNameFrom(PluginType type, Map<String, String> credentials) {
    switch (type) {
      case PluginType.github:
        return 'GitHub';
      case PluginType.msTodo:
        return credentials['tenantId'] ?? 'Microsoft Account';
      case PluginType.flaggedEmails:
        return credentials['email'] ?? 'IMAP Account';
      case PluginType.frappe:
        return credentials['url'] ?? 'Frappe Instance';
    }
  }
}
