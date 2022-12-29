import 'package:flutter/material.dart';
import 'package:flutter_prj_1/pages/home/home_page.dart';
import 'package:flutter_prj_1/pages/settings/settings_state_manager.dart';
import 'package:flutter_prj_1/services/service_locator.dart';
import 'package:username_gen/username_gen.dart';

void main() {

  // connect to app logic layer, by singletons
  // Providing the UI layer with a reference to the state management layer
  setupGetIt();

  // get a random userName and set the user state
  final settingsStateManager = getIt<SettingsStateManager>();
  String randomUsername = UsernameGen.generateWith();
  settingsStateManager.setUserName(randomUsername);

  // here can go other init, for example contacting web server

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {

  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Smart Reminders App',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(title: 'Smart Reminders App - Home'),
    );
  }
}


