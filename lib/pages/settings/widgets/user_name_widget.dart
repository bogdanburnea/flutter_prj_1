import 'package:flutter/material.dart';
import 'package:flutter_prj_1/pages/settings/settings_state_manager.dart';
import 'package:flutter_prj_1/services/service_locator.dart';

// extracting widgets out of your UI:
// small widgets are reusable and reduce code duplication

// Make your widgets const whenever possible.
// Flutter doesn’t need to rebuild constant widgets, so this is a performance optimization.
// Note the const keyword in the StartButton constructor, for example:
// class StartButton extends StatelessWidget {
//   const
//   StartButton({Key? key}) : super(key: key);
//   @override
//   Widget build(BuildContext context) {...}
// }

class UserNameWidget extends StatelessWidget {
  const UserNameWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Providing the UI layer with a reference to the state management layer, returns the singleton
    final settingsStateManager = getIt<SettingsStateManager>();

    // UI events can call state manager methods to make the page logic and change the state accordingly
    // ex. press a button
    // onPressed: () {
    //   final stateManager = getIt<TimerPageManager>(); // get the refference to page state manager - singleton
    //   stateManager.pause(); // perform page logic
    // },

    // Rebuilding the UI after state changes
    // listen to notifiers with ValueListenableBuilder widgets
    return ValueListenableBuilder<String>(
      // ValueListenableBuilder listens to the notifier in the state management class
      // when you set the valueListenable parameter.

      valueListenable: settingsStateManager.userStateNotifier,
      builder: (context, userName, child) {
        print('[UserNameTextWidget] build, userName: $userName');
        return Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
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
