import 'package:flutter/material.dart';
import 'package:flutter_prj_1/state/managers/user_profile_state_manager.dart';
import 'package:flutter_prj_1/state/services/service_locator.dart';

class UserNameWidget extends StatelessWidget {
  const UserNameWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final userProfileStateManager = getIt<UserProfileStateManager>();

    return ValueListenableBuilder<String>(
      valueListenable: userProfileStateManager.userStateNotifier,
      builder: (context, userName, child) {
        print('[UserNameTextWidget] build, userName: $userName');

        return Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const <Widget>[
                  Text('User Name'),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(userName),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
