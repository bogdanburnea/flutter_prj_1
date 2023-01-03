import 'package:flutter/material.dart';
import 'package:flutter_prj_1/services/service_locator.dart';
import 'package:flutter_prj_1/services/storage_service/shared_preferences/shared_preferences_storage_service.dart';

class CategoryStateNotifier extends ValueNotifier<List<String>> {
  static const List<String> initialCategoryList = ["Home", "Car", "Personal"];

  // set intial value
  CategoryStateNotifier() : super(initialCategoryList);

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
