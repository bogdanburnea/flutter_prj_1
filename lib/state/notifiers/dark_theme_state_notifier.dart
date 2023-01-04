import 'package:flutter/material.dart';
import 'package:flutter_prj_1/state/services/service_locator.dart';
import 'package:flutter_prj_1/state/services/storage_service/shared_preferences/shared_preferences_storage_service.dart';
import 'package:flutter_prj_1/utils/constants.dart';

class DarkThemeStateNotifier extends ValueNotifier<bool> {
  // set intial value
  // TODO: look for device default theme and init with it
  DarkThemeStateNotifier() : super(Constants.initialDarkTheme);

  // get the reference to SharedPreferencesStorageService, singleton
  final sharedPreferencesStorageService =
      getIt<SharedPreferencesStorageService>();

  void setDarkTheme(bool darkTheme) {
    value = darkTheme;

    // here i can further call storage service ...
    sharedPreferencesStorageService.setDarkTheme(darkTheme);
  }
}
