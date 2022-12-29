import 'package:flutter/material.dart';
import 'package:flutter_prj_1/pages/home/widgets/third_party/adaptive_scaffold.dart';
import 'package:flutter_prj_1/pages/settings/settings_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title});

  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _pageIndex = 0;
  String _title = "Smart Reminders App";

  @override
  initState(){
    _pageIndex = 0;
    _title = "Smart Reminders App";
  }

  @override
  Widget build(BuildContext context) {
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
          switch(_pageIndex) {
            case 0: { _title = 'Smart Reminders App - Dashboard'; }
            break;
            case 1: { _title = 'Smart Reminders App - Reminders'; }
            break;
            case 2: { _title = 'Smart Reminders App - Settings'; }
            break;
          }
        });
      },
    );
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
