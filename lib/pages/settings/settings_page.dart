import 'package:flutter/material.dart';
import 'package:flutter_prj_1/pages/settings/widgets/color_theme_widget.dart';
import 'package:flutter_prj_1/pages/settings/widgets/dark_theme_widget.dart';

// pure ui widget, so no ValueListenableBuilder wrapper

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    print('[SettingsPage] build');
    return Scaffold(
      body: Center(
        child: Column(
          children: <Widget>[
            Container(
              height: 55,
              padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
              child: const DarkThemeWidget(),
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
              child: const Divider(color: Colors.grey),
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
              child: const ColorThemeWidget(),
            ),
          ],
        ),
      ),
    );
  }
}
