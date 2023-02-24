import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:listinha/src/shared/store/app_store.dart';
import 'package:listinha/src/shared/ui_utils.dart';
import 'package:rx_notifier/rx_notifier.dart';

class ConfigurationPage extends StatefulWidget {
  const ConfigurationPage({super.key});

  @override
  State<ConfigurationPage> createState() => _ConfigurationPageState();
}

class _ConfigurationPageState extends State<ConfigurationPage> {
  final appStore = Modular.get<AppStore>();

  void _changeThemeMode(ThemeMode? mode) {
    if (mode != null) {
      appStore.themeMode = mode;
    }
  }

  @override
  Widget build(BuildContext context) {
    context.select(() => appStore.themeMode);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Configuração'),
      ),
      body: Padding(
        padding: const EdgeInsets.only(
          top: 20,
          right: 16,
          left: 16,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Tema',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            16.ph,
            RadioListTile<ThemeMode>(
              value: ThemeMode.system,
              groupValue: appStore.themeMode,
              onChanged: _changeThemeMode,
              title: const Text('Sistema'),
            ),
            RadioListTile<ThemeMode>(
              value: ThemeMode.light,
              groupValue: appStore.themeMode,
              onChanged: _changeThemeMode,
              title: const Text('Claro'),
            ),
            RadioListTile<ThemeMode>(
              value: ThemeMode.dark,
              groupValue: appStore.themeMode,
              onChanged: _changeThemeMode,
              title: const Text('Escuro'),
            ),
            16.ph,
            Text(
              'Controle de dados',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            16.ph,
            OutlinedButton(
              onPressed: () {},
              child: const Text('Apagar cache e reiniciar app'),
            ),
          ],
        ),
      ),
    );
  }
}
