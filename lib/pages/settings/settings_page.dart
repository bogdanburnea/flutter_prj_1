import 'package:flutter/material.dart';
import 'package:flutter_prj_1/pages/settings/widgets/dark_theme_widget.dart';
import 'package:flutter_prj_1/pages/settings/widgets/user_name_widget.dart';

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
          child: ListView.separated(
              itemCount: 2,
              separatorBuilder: (BuildContext context, int index) =>
                  const Divider(),
              padding: const EdgeInsets.all(10),
              itemBuilder: (BuildContext context, int index) {
                switch (index) {
                  case 0:
                    {
                      return SizedBox(
                        height: 50,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const <Widget>[
                            DarkThemeWidget(),
                          ],
                        ),
                      );
                    }

                  case 1:
                    {
                      return SizedBox(
                        height: 50,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const <Widget>[
                            UserNameWidget(),
                          ],
                        ),
                      );
                    }

                  default:
                    {
                      return const SizedBox(
                        height: 50,
                        child: Center(child: Text(' ')),
                      );
                    }
                }
              })),
    );
  }
}
