import 'package:flutter/material.dart';
import 'package:flutter_prj_1/pages/user_profile/user_profile_state_manager.dart';
import 'package:flutter_prj_1/services/service_locator.dart';

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
                mainAxisAlignment: MainAxisAlignment.start,
                children: const <Widget>[
                  Text('User Name'),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
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
