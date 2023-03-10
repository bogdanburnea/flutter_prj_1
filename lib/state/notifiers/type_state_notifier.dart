import 'package:flutter/material.dart';
import 'package:flutter_prj_1/state/services/service_locator.dart';
import 'package:flutter_prj_1/state/services/storage_service/shared_preferences/shared_preferences_storage_service.dart';
import 'package:flutter_prj_1/utils/constants.dart';

class TypeStateNotifier extends ValueNotifier<List<String>> {
  // set intial value
  TypeStateNotifier() : super(Constants.initialTypeList);

  // get the reference to SharedPreferencesStorageService, singleton
  final sharedPreferencesStorageService =
      getIt<SharedPreferencesStorageService>();

  List<String> getTypeList() {
    return value;
  }

  void setTypeList(List<String> typeList) {
    // Set.from.list ensures that list elements are unique
    List<String> newTypeList = List.from(Set.from(typeList));

    newTypeList.sort((a, b) {
      return a.toLowerCase().compareTo(b.toLowerCase());
    });

    value = newTypeList;
    sharedPreferencesStorageService.setTypeList(newTypeList);
  }

  void deleteType(String type) {
    List<String>? typeList = value;
    List<String> newTypeList = [];

    typeList.forEach((element) {
      if (element != type) {
        newTypeList.add(element);
      }
    });
    setTypeList(newTypeList);
  }

  void addType(String type) {
    setTypeList(List.from(value)..add(type));
  }
}
