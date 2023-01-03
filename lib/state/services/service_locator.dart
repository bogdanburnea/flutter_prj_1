import 'package:flutter_prj_1/state/managers/category_state_manager.dart';
import 'package:flutter_prj_1/state/managers/settings_state_manager.dart';
import 'package:flutter_prj_1/state/managers/type_state_manager.dart';
import 'package:flutter_prj_1/state/managers/user_profile_state_manager.dart';
import 'package:flutter_prj_1/state/services/storage_service/shared_preferences/shared_preferences_storage.dart';
import 'package:flutter_prj_1/state/services/storage_service/shared_preferences/shared_preferences_storage_service.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

// singletons
// Providing the UI layer with a reference to the state management layer
void setupGetIt() {

  // state management layer
  getIt.registerLazySingleton<SettingsStateManager>(() => SettingsStateManager());

  // state management layer
  getIt.registerLazySingleton<UserProfileStateManager>(() => UserProfileStateManager());

  // state management layer
  getIt.registerLazySingleton<CategoryStateManager>(() => CategoryStateManager());

  // state management layer
  getIt.registerLazySingleton<TypeStateManager>(() => TypeStateManager());

  // shared preferences storage
  getIt.registerLazySingleton<SharedPreferencesStorageService>(() => SharedPreferencesStorage());

  // here can go other init, for service layer
  // getIt.registerLazySingleton<StorageService>(() => SharedPreferencesStorage());

}