import 'package:flutter_prj_1/state/user_state_notifier.dart';

// logic for the page, completely decoupled from UI
// link to one or more notifiers
class SettingsStateManager {

  // state manager presents setters for the state values
  // setters are called from UI
  // and perform business logic

  // state notifiers, can be more notifiers and combine different logic in setters
  final userStateNotifier = UserStateNotifier();

  void setUserName(String userName) {
    userStateNotifier.setUserName(userName);
  }

}
