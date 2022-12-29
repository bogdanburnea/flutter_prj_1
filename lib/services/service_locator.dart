import 'package:flutter_prj_1/pages/settings/settings_state_manager.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

// singletons
void setupGetIt() {
  // state management layer
  getIt.registerLazySingleton<SettingsStateManager>(() => SettingsStateManager());

  // service layer
  //getIt.registerLazySingleton<StorageService>(() => SharedPreferencesStorage());
}