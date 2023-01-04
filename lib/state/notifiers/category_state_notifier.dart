import 'package:flutter/material.dart';
import 'package:flutter_prj_1/state/services/service_locator.dart';
import 'package:flutter_prj_1/state/services/storage_service/shared_preferences/shared_preferences_storage_service.dart';
import 'package:flutter_prj_1/utils/start_constants.dart';

class CategoryStateNotifier extends ValueNotifier<List<String>> {
  // set intial value
  CategoryStateNotifier() : super(StartConstants.initialCategoryList);

  // get the reference to SharedPreferencesStorageService, singleton
  final sharedPreferencesStorageService =
      getIt<SharedPreferencesStorageService>();

  List<String> getCategoryList() {
    return value;
  }

  void setCategoryList(List<String> categoryList) {
    sharedPreferencesStorageService.setCategoryList(categoryList);
  }
}
