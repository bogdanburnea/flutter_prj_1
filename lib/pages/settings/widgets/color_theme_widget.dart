import 'package:flutter/material.dart';
import 'package:flutter_prj_1/state/managers/settings_state_manager.dart';
import 'package:flutter_prj_1/state/services/service_locator.dart';
import 'package:flutter_prj_1/utils/utils.dart';

class ColorThemeWidget extends StatelessWidget {
  const ColorThemeWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final settingsStateManager = getIt<SettingsStateManager>();

    return ValueListenableBuilder<String>(
      valueListenable: settingsStateManager.colorThemeStateNotifier,
      builder: (context, colorTheme, child) {
        print('[ColorThemeWidget] build, colorTheme: $colorTheme');
        return Column(
          children: <Widget>[
            Container(
              padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: const <Widget>[
                  Text(textAlign: TextAlign.start, 'Color Theme')
                ],
              ),
            ),
            RadioListTile<String>(
                title: const Text('Red'),
                value: 'red',
                groupValue: colorTheme,
                activeColor: Utils.getSelectedColor(colorTheme),
                controlAffinity: ListTileControlAffinity.trailing,
                onChanged: (value) {
                  settingsStateManager.setColorTheme(value!);
                }),
            RadioListTile<String>(
                title: const Text('Green'),
                value: 'green',
                groupValue: colorTheme,
                activeColor: Utils.getSelectedColor(colorTheme),
                controlAffinity: ListTileControlAffinity.trailing,
                onChanged: (value) {
                  settingsStateManager.setColorTheme(value!);
                }),
            RadioListTile<String>(
                title: const Text('Blue'),
                value: 'blue',
                groupValue: colorTheme,
                activeColor: Utils.getSelectedColor(colorTheme),
                controlAffinity: ListTileControlAffinity.trailing,
                onChanged: (value) {
                  settingsStateManager.setColorTheme(value!);
                }),
          ],
        );
      },
    );
  }
}
