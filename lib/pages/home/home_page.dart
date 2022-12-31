import 'package:flutter/material.dart';
import 'package:flutter_prj_1/pages/settings/settings_page.dart';
import 'package:flutter_prj_1/pages/user_profile/user_profile_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title});

  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

// use a stateful widget whenever you need to initialize something when the page first loads
// The State class of a stateful widget has a initState method.

class _HomePageState extends State<HomePage> {
  static const dashboard_label = 'Dashboard';
  static const reminders_label = 'Reminders';
  static const settings_label = 'Settings';
  static const user_profile_label = 'User Profile';

  int _pageIndex = 0;
  String _title = dashboard_label;

  @override
  initState() {
    _pageIndex = 0;
    _title = dashboard_label;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print('[HomePage] build');

    return Scaffold(
      appBar: AppBar(
        title: Text(_title),
      ),
      body: Center(
        child: _pageAtIndex(_pageIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        unselectedIconTheme: const IconThemeData(color: Colors.blue, size: 30),
        unselectedItemColor: Colors.blue,
        selectedIconTheme: const IconThemeData(color: Colors.teal, size: 40),
        selectedItemColor: Colors.teal,
        showSelectedLabels: true,
        showUnselectedLabels: false,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.dashboard),
            label: dashboard_label,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: reminders_label,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: settings_label,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            label: user_profile_label,
          ),
        ],
        currentIndex: _pageIndex,
        onTap: _onItemTapped,
      ),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _pageIndex = index;

      switch (index) {
        case 0:
          {
            _title = dashboard_label;
          }
          break;
        case 1:
          {
            _title = reminders_label;
          }
          break;
        case 2:
          {
            _title = settings_label;
          }
          break;
        case 3:
          {
            _title = user_profile_label;
          }
          break;
        default:
          {
            _title = dashboard_label;
          }
      }
    });
  }

  static Widget _pageAtIndex(int index) {
    if (index == 0) {
      // return const DashboardPage();
      return const Center(child: Text('Dashboard page'));
    }

    if (index == 1) {
      // return const EntriesPage();
      return const Center(child: Text('Reminders page'));
    }

    if (index == 2) {
      return const SettingsPage();
    }

    if (index == 3) {
      return const UserProfilePage();
    }

    return const Center(child: Text('Dashboard page'));
  }
}
