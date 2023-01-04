import 'package:flutter/material.dart';
import 'package:flutter_prj_1/state/services/service_locator.dart';
import 'package:flutter_prj_1/state/services/storage_service/shared_preferences/shared_preferences_storage_service.dart';
import 'package:flutter_prj_1/utils/utils.dart';

class ColorThemeStateNotifier extends ValueNotifier<String> {
  // set intial value to initialColorTheme
  ColorThemeStateNotifier() : super(Utils.initialColorTheme);

  // get the reference to SharedPreferencesStorageService, singleton
  final sharedPreferencesStorageService =
      getIt<SharedPreferencesStorageService>();

  void setColorTheme(String colorTheme) {
    value = colorTheme;

    // here i can further call storage service ...
    sharedPreferencesStorageService.setColorTheme(colorTheme);
  }
}
