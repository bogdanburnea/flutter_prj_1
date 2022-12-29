import 'package:flutter/material.dart';

// The value variable belongs to ValueNotifier and anytime value changes,
// any object that is listening to this ValueNotifier will get notified about the new value.

// break the ValueNotifier out into a separate class, not in the state manager class
// the job of the notifiers is to handle their own state
// The more you can isolate statemanagement into small, discrete blocks, the easier your job will be
class UserStateNotifier extends ValueNotifier<String> {

  static const String initialUserName = "initialUserName";

  // set intial value to intialUserName
  UserStateNotifier() : super(initialUserName);

  void setUserName( String userName ){
    value = userName;
    // here i can further call storage service ...
  }

}
