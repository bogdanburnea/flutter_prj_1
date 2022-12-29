import 'package:flutter/material.dart';
import 'package:flutter_prj_1/pages/settings/widgets/user_name_text_widget.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    print('building SettingsPage');
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            UserNameTextWidget(),
          ],
        ),
      ),
    );
  }
}

