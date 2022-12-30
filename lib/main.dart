import 'package:flutter/material.dart';
import 'package:flutter_prj_1/pages/home/home_page.dart';
import 'package:flutter_prj_1/pages/settings/settings_state_manager.dart';
import 'package:flutter_prj_1/services/service_locator.dart';
import 'package:username_gen/username_gen.dart';

void main() {
  // connect to app logic layer, by singletons
  // Providing the UI layer with a reference to the state management layer
  setupGetIt();

  final settingsStateManager = getIt<SettingsStateManager>();

  print(
      '[main] settingsStateManager.getUserName: ${settingsStateManager.getUserName()}');
  print(
      '[main] settingsStateManager.getDarkTheme: ${settingsStateManager.getDarkTheme()}');

  if (settingsStateManager.getUserName() == "initialUserName") {
    // generate a random userName
    String randomUsername = UsernameGen.generateWith();

    // set the user state
    settingsStateManager.setUserName(randomUsername);
  }

  // here can go other init, for example contacting web server

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  // get the singleton reference to SettingsStateManager
  final settingsStateManager = getIt<SettingsStateManager>();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<bool>(
      valueListenable: settingsStateManager.darkThemeStateNotifier,
      builder: (context, darkTheme, child) {
        print('[MyApp] build, darkTheme: $darkTheme');

        return MaterialApp(
          title: 'Smart Reminders App',
          theme: ThemeData(
            brightness: Brightness.light,
            primarySwatch: Colors.blue,
            /* light theme settings */
          ),
          darkTheme: ThemeData(
            brightness: Brightness.dark,
            primarySwatch: Colors.blue,
            /* dark theme settings */
          ),
          themeMode: darkTheme ? ThemeMode.dark : ThemeMode.light,
          debugShowCheckedModeBanner: false,
          home: const HomePage(title: 'Smart Reminders App - Home'),
        );
      },
    );
  }
}
