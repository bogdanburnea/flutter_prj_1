import 'package:flutter_prj_1/pages/settings/settings_state_manager.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

// singletons
// Providing the UI layer with a reference to the state management layer
void setupGetIt() {
  // state management layer
  getIt.registerLazySingleton<SettingsStateManager>(() => SettingsStateManager());

  // service layer
  //getIt.registerLazySingleton<StorageService>(() => SharedPreferencesStorage());
}