import 'package:flutter/material.dart';
import 'package:flutter_prj_1/state/services/service_locator.dart';
import 'package:flutter_prj_1/state/services/storage_service/shared_preferences/shared_preferences_storage_service.dart';
import 'package:flutter_prj_1/utils/constants.dart';

// The value variable belongs to ValueNotifier and anytime value changes,
// any object that is listening to this ValueNotifier will get notified about the new value.

// break the ValueNotifier out into a separate class, not in the state manager class
// the job of the notifiers is to handle their own state
// The more you can isolate statemanagement into small, discrete blocks, the easier your job will be
class UserStateNotifier extends ValueNotifier<String> {
  // set intial value to intialUserName
  UserStateNotifier() : super(Constants.initialUserName);

  // get the reference to SharedPreferencesStorageService, singleton
  final sharedPreferencesStorageService =
      getIt<SharedPreferencesStorageService>();

  void setUserName(String userName) {
    value = userName;

    // here i can further call storage service ...
    sharedPreferencesStorageService.setUserName(userName);
  }
}
