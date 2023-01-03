import 'package:flutter/material.dart';
import 'package:flutter_prj_1/services/service_locator.dart';
import 'package:flutter_prj_1/services/storage_service/shared_preferences/shared_preferences_storage_service.dart';

class TypeStateNotifier extends ValueNotifier<List<String>> {
  static const List<String> initialTypeList = [
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
    sharedPreferencesStorageService.setTypeList(typeList);
  }
}
