import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:listinha/src/shared/services/realm/models/configuration_model.dart';
import 'package:listinha/src/shared/store/app_store.dart';
import 'package:realm/realm.dart';
import 'package:rx_notifier/rx_notifier.dart';

abstract class ConfigurationService {
  void initAll();
  void deleteAll();
}

class ConfigurationServiceImpl implements ConfigurationService, Disposable {
  final Realm realm;
  final AppStore appStore;
  late final RxDisposer disposer;
  ConfigurationServiceImpl(
    this.realm,
    this.appStore,
  );

  @override
  void initAll() {
    final model = _getConfiguration();
    appStore
      ..themeMode = _getThemeModeByName(model.themeModeName)
      ..syncDate = model.syncDate;

    disposer = rxObserver(() {
      final themeMode = appStore.themeMode;
      final syncDate = appStore.syncDate;

      saveConfiguration(themeMode.name, syncDate);
    });
  }

  @override
  void deleteAll() {
    realm.deleteAll();
  }

  ConfigurationModel _getConfiguration() {
    return realm.all<ConfigurationModel>().first;
  }

  void saveConfiguration(String themeModeName, DateTime? syncDate) {
    final model = _getConfiguration();
    realm.write(() {
      model
        ..themeModeName = themeModeName
        ..syncDate = syncDate;
    });
  }

  ThemeMode _getThemeModeByName(String name) {
    return ThemeMode.values.firstWhere((element) => element.name == name);
  }

  @override
  void dispose() {
    disposer();
  }
}
