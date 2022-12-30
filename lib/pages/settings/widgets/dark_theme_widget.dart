import 'package:flutter/material.dart';
import 'package:flutter_prj_1/pages/settings/settings_state_manager.dart';
import 'package:flutter_prj_1/services/service_locator.dart';

class DarkThemeWidget extends StatelessWidget {
  const DarkThemeWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final settingsStateManager = getIt<SettingsStateManager>();

    return ValueListenableBuilder<bool>(
      valueListenable: settingsStateManager.darkThemeStateNotifier,
      builder: (context, darkTheme, child) {
        print('[DarkThemeWidget] build, darkTheme: $darkTheme');
        return Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: const <Widget>[
                  Text('Dark Theme'),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Switch(
                      value: darkTheme,
                      onChanged: (value) {
                        settingsStateManager.setDarkTheme(value);
                      }),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
