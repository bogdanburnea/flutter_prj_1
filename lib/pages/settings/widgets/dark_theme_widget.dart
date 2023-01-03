import 'package:flutter/material.dart';
import 'package:flutter_prj_1/state/managers/settings_state_manager.dart';
import 'package:flutter_prj_1/state/services/service_locator.dart';
import 'package:flutter_prj_1/utils/utils.dart';

class DarkThemeWidget extends StatelessWidget {
  const DarkThemeWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final settingsStateManager = getIt<SettingsStateManager>();

    return ValueListenableBuilder<String>(
      valueListenable: settingsStateManager.colorThemeStateNotifier,
      builder: (context, colorTheme, child) {
        print('[DarkThemeWidget] build, colorTheme: $colorTheme');

        return ValueListenableBuilder<bool>(
          valueListenable: settingsStateManager.darkThemeStateNotifier,
          builder: (context, darkTheme, child) {
            print('[DarkThemeWidget] build, darkTheme: $darkTheme');
            return Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const <Widget>[
                      Text('Dark Theme'),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Switch(
                          value: darkTheme,
                          activeTrackColor: Utils.getSelectedColor(colorTheme),
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
      },
    );
  }
}
