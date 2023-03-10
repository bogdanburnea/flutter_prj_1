import 'package:flutter/material.dart';
import 'package:flutter_prj_1/pages/category/category_page.dart';
import 'package:flutter_prj_1/pages/category/widgets/category_add_dialog.dart';
import 'package:flutter_prj_1/pages/reminder/reminder_page.dart';
import 'package:flutter_prj_1/pages/reminder/widgets/reminder_add_dialog.dart';
import 'package:flutter_prj_1/pages/settings/settings_page.dart';
import 'package:flutter_prj_1/pages/type/type_page.dart';
import 'package:flutter_prj_1/pages/type/widgets/type_add_dialog.dart';
import 'package:flutter_prj_1/pages/user_profile/user_profile_page.dart';
import 'package:flutter_prj_1/state/managers/category_state_manager.dart';
import 'package:flutter_prj_1/state/managers/reminder_state_manager.dart';
import 'package:flutter_prj_1/state/managers/settings_state_manager.dart';
import 'package:flutter_prj_1/state/managers/type_state_manager.dart';
import 'package:flutter_prj_1/state/objects/reminder.dart';
import 'package:flutter_prj_1/state/services/service_locator.dart';
import 'package:flutter_prj_1/utils/notification_frequency.dart';
import 'package:flutter_prj_1/utils/reminder_frequency.dart';
import 'package:flutter_prj_1/utils/reminder_type.dart';
import 'package:flutter_prj_1/utils/utils.dart';

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
  static const categories_label = 'Categories';
  static const types_label = 'Types';
  static const settings_label = 'Settings';
  static const user_profile_label = 'User Profile';

  int _pageIndex = 0;
  String _title = dashboard_label;
  Color themeUnSelectedColor = Colors.blue;
  Color themeSelectedColor = Colors.indigo;

  final typeStateManager = getIt<TypeStateManager>();
  final categoryStateManager = getIt<CategoryStateManager>();
  final reminderStateManager = getIt<ReminderStateManager>();

  @override
  initState() {
    _pageIndex = 0;
    _title = dashboard_label;
    themeUnSelectedColor = Colors.blue;
    themeSelectedColor = Colors.indigo;

    // startDialogWelcome();

    super.initState();
  }

  Future<void> startDialogWelcome() async {
    await Future.delayed(const Duration(seconds: 2), () {
      _showDialogWelcome();
    });
  }

  void _showDialogWelcome() {
    showDialog(
        context: context,
        builder: (context) {
          return const AlertDialog(
              title: Text('Welcome!'),
              content: Text('Hey! Welcome to my app!'));
        });
  }

  // for vertical navigation see https://api.flutter.dev/flutter/material/NavigationRail-class.html

  @override
  Widget build(BuildContext context) {
    print('[HomePage] build');

    final settingsStateManager = getIt<SettingsStateManager>();

    return ValueListenableBuilder<String>(
      valueListenable: settingsStateManager.colorThemeStateNotifier,
      builder: (context, colorTheme, child) {
        print('[HomePage] build, colorTheme: $colorTheme');

        themeUnSelectedColor = Utils.getUnSelectedColor(colorTheme);
        themeSelectedColor = Utils.getSelectedColor(colorTheme);

        return Scaffold(
          appBar: AppBar(
            title: Text(_title),
            backgroundColor: themeUnSelectedColor,
            actions: <Widget>[
              Padding(
                padding: const EdgeInsets.only(right: 23.0),
                child: _hasAddButton(context)
                    ? GestureDetector(
                        onTap: () {
                          _handleAddActionButtonPressed();
                        },
                        child: const Icon(
                          Icons.add_circle,
                          size: 31.0,
                        ),
                      )
                    : null,
              ),
            ],
          ),
          body: Center(
            child: _pageAtIndex(_pageIndex),
          ),
          bottomNavigationBar: BottomNavigationBar(
            unselectedIconTheme:
                IconThemeData(color: themeUnSelectedColor, size: 30),
            unselectedItemColor: themeUnSelectedColor,
            selectedIconTheme:
                IconThemeData(color: themeSelectedColor, size: 40),
            selectedItemColor: themeSelectedColor,
            showSelectedLabels: true,
            showUnselectedLabels: false,
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.dashboard),
                label: dashboard_label,
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.access_alarms_rounded),
                label: reminders_label,
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.interests_rounded),
                label: categories_label,
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.category_rounded),
                label: types_label,
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
      },
    );
  }

  bool _hasAddButton(BuildContext context) {
    if (_pageIndex == 1 || _pageIndex == 2 || _pageIndex == 3) {
      return true;
    }
    return false;
  }

  void _handleAddActionButtonPressed() {
    if (_pageIndex == 1) {
      // TODO: here we need a reminder object instead of a string
      asyncReminderAddDialog(context).then((value) => {
            if (value != null)
              {
                reminderStateManager.addReminder(Reminder(
                    name: value,
                    reminderType: ReminderType.personal,
                    description: "description",
                    reminderFrequency: ReminderFrequency.year,
                    sendNotification: false,
                    notificationFrequency: NotificationFrequency.day))
              }
          });
    }
    if (_pageIndex == 2) {
      asyncCategoryAddDialog(context).then((value) => {
            if (value != null) {categoryStateManager.addCategory(value)}
          });
    }
    if (_pageIndex == 3) {
      asyncTypeAddDialog(context).then((value) => {
            if (value != null) {typeStateManager.addType(value)}
          });
    }
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
            _title = categories_label;
          }
          break;
        case 3:
          {
            _title = types_label;
          }
          break;
        case 4:
          {
            _title = settings_label;
          }
          break;
        case 5:
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
    final typeStateManager = getIt<TypeStateManager>();
    List<String> typeList = typeStateManager.getTypeList();

    switch (index) {
      case 0:
        return const Center(child: Text('Dashboard page'));
      case 1:
        return const ReminderPage();
      case 2:
        return const CategoryPage();
      case 3:
        return const TypePage();
      case 4:
        return const SettingsPage();
      case 5:
        return const UserProfilePage();
      default:
        return const Center(child: Text('Dashboard page'));
    }
  }
}
