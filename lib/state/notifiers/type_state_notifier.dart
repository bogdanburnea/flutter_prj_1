import 'package:flutter/material.dart';
import 'package:flutter_prj_1/state/services/service_locator.dart';
import 'package:flutter_prj_1/state/services/storage_service/shared_preferences/shared_preferences_storage_service.dart';
import 'package:sorted_list/sorted_list.dart';

class TypeStateNotifier extends ValueNotifier<List<String>> {
  static final List<String> initialTypeList = [
    "Assurance",
    "Rent",
    "Tax",
    "Anniversary",
    "Mortgage",
    "Maintenance",
    "Credit",
    "Utilities",
    "Phone",
    "Gas",
    "Electricity",
    "TV",
    "Internet",
    "Health"
  ];

  // set intial value
  TypeStateNotifier() : super(initialTypeList);

  // get the reference to SharedPreferencesStorageService, singleton
  final sharedPreferencesStorageService =
      getIt<SharedPreferencesStorageService>();

  List<String> getTypeList() {
    return value;
  }

  void setTypeList(List<String> typeList) {
    value = typeList;
    sharedPreferencesStorageService.setTypeList(typeList);
  }

  void deleteTypeFromTypeList(String type) {
    List<String>? typeList = value;
    List<String> newTypeList = [];

    typeList.forEach((element) {
      if (element != type) {
        newTypeList.add(element);
      }
    });
    setTypeList(newTypeList);
  }

  void addTypeToTypeList(String type) {
    List<String>? typeList = value;
    typeList.add(type);
    setTypeList(typeList);
  }
}