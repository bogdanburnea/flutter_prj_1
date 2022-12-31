import 'package:flutter_prj_1/state/user_state_notifier.dart';

class UserProfileStateManager {

  final userStateNotifier = UserStateNotifier();

  String getUserName() {
    return userStateNotifier.value;
  }

  void setUserName(String userName) {
    userStateNotifier.setUserName(userName);
  }
}
