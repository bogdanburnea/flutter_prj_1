import 'package:flutter/material.dart';

// The value variable belongs to ValueNotifier and anytime value changes,
// any object that is listening to this ValueNotifier will get notified about the new value.
class UserStateNotifier extends ValueNotifier<String> {

  static const String initialUserName = "initialUserName";

  // set intial value to intialUserName
  UserStateNotifier() : super(initialUserName);

  void setUserName( String userName ){
    value = userName;
    // here i can further call storage service ...
  }

}
