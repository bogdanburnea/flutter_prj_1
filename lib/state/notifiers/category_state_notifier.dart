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
    // Set.from.list ensures that list elements are unique
    List<String> newCategoryList = List.from(Set.from(categoryList));

    newCategoryList.sort((a, b) {
      return a.toLowerCase().compareTo(b.toLowerCase());
    });

    value = newCategoryList;
    sharedPreferencesStorageService.setCategoryList(categoryList);
  }

  void deleteCategory(String category) {
    List<String>? categoryList = value;
    List<String> newCategoryList = [];

    categoryList.forEach((element) {
      if (element != category) {
        newCategoryList.add(element);
      }
    });
    setCategoryList(newCategoryList);
  }

  void addCategory(String category) {
    setCategoryList(List.from(value)..add(category));
  }
}
