import 'package:flutter/material.dart';
import 'package:flutter_prj_1/pages/settings/settings_state_manager.dart';
import 'package:flutter_prj_1/services/service_locator.dart';

class UserNameTextWidget extends StatelessWidget {
  const UserNameTextWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final settingsStateManager = getIt<SettingsStateManager>();
    return ValueListenableBuilder<String>(
      valueListenable: settingsStateManager.userStateNotifier,
      builder: (context, userName, child) {
        print('building settings state: $userName');
        return Text(
          userName,
          style: Theme.of(context).textTheme.headline2,
        );
      },
    );
  }
}
