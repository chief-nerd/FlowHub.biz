import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flowhub/features/settings/domain/bloc/settings_bloc.dart';
import 'package:flowhub/core/plugins/plugin_registry.dart';

void main() {
  group('SettingsBloc', () {
    late SettingsBloc settingsBloc;

    setUp(() {
      settingsBloc = SettingsBloc();
    });

    tearDown(() {
      settingsBloc.close();
    });

    test('initial state is SettingsInitial', () {
      expect(settingsBloc.state, isA<SettingsInitial>());
    });

    blocTest<SettingsBloc, SettingsState>(
      'loads plugins from registry when LoadSettings is added',
      build: () => settingsBloc,
      act: (bloc) => bloc.add(LoadSettings()),
      wait: const Duration(milliseconds: 600),
      expect: () => [
        isA<SettingsLoading>(),
        isA<SettingsLoaded>().having((s) => s.plugins.length, 'plugins count', PluginRegistry.definitions.length),
      ],
    );

    blocTest<SettingsBloc, SettingsState>(
      'updates plugin status when ConnectPlugin is added',
      build: () => settingsBloc,
      seed: () => const SettingsLoaded(plugins: [
        PluginStatus(type: PluginType.github, isConnected: false),
      ]),
      act: (bloc) => bloc.add(const ConnectPlugin(PluginType.github)),
      expect: () => [
        isA<SettingsLoaded>().having((s) => s.plugins.first.isConnected, 'is connected', true),
      ],
    );
  });
}
