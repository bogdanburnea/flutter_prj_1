import 'package:flutter/material.dart';
import 'package:flutter_prj_1/pages/home/widgets/third_party/adaptive_scaffold.dart';
import 'package:flutter_prj_1/pages/settings/settings_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title});

  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

// use a stateful widget whenever you need to initialize something when the page first loads
// The State class of a stateful widget has a initState method.

class _HomePageState extends State<HomePage> {
  int _pageIndex = 0;
  String _title = "Smart Reminders App";

  @override
  initState() {
    _pageIndex = 0;
    _title = "Smart Reminders App - Dashboard";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print('[HomePage] build');
    return AdaptiveScaffold(
      title: Text(_title),
      currentIndex: _pageIndex,
      destinations: const [
        AdaptiveScaffoldDestination(title: 'Dashboard', icon: Icons.dashboard),
        AdaptiveScaffoldDestination(title: 'Reminders', icon: Icons.list),
        AdaptiveScaffoldDestination(title: 'Settings', icon: Icons.settings),
      ],
      body: _pageAtIndex(_pageIndex),
      onNavigationIndexChange: (newIndex) {
        setState(() {
          _pageIndex = newIndex;
          _title = _titleAtIndex(_pageIndex);
        });
      },
    );
  }

  static String _titleAtIndex(int index) {
    switch (index) {
      case 0:
        {
          return 'Smart Reminders App - Dashboard';
        }
      case 1:
        {
          return 'Smart Reminders App - Reminders';
        }
      case 2:
        {
          return 'Smart Reminders App - Settings';
        }
      default:
        {
          return 'Smart Reminders App - Home';
        }
    }
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
      //return const Center(child: Text('Settings page'));
    }

    return const Center(child: Text('Settings page'));
  }
}
