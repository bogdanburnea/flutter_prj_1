import 'package:flutter/material.dart';
import 'package:flutter_prj_1/services/service_locator.dart';
import 'package:flutter_prj_1/services/storage_service/shared_preferences/shared_preferences_storage_service.dart';

class ColorThemeStateNotifier extends ValueNotifier<String> {
  static const String initialColorTheme = "blue";

  // set intial value to initialColorTheme
  ColorThemeStateNotifier() : super(initialColorTheme);

  // get the reference to SharedPreferencesStorageService, singleton
  final sharedPreferencesStorageService = getIt<SharedPreferencesStorageService>();

  void setColorTheme(String colorTheme) {
    value = colorTheme;

    // here i can further call storage service ...
    sharedPreferencesStorageService.setColorTheme(colorTheme);
  }
}
