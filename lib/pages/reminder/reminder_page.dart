import 'package:flutter/material.dart';
import 'package:flutter_prj_1/pages/reminder/widgets/reminder_delete_dialog.dart';
import 'package:flutter_prj_1/pages/reminder/widgets/reminder_edit_dialog.dart';
import 'package:flutter_prj_1/state/managers/reminder_state_manager.dart';
import 'package:flutter_prj_1/state/managers/settings_state_manager.dart';
import 'package:flutter_prj_1/state/objects/reminder.dart';
import 'package:flutter_prj_1/state/services/service_locator.dart';
import 'package:flutter_prj_1/utils/utils.dart';

// pure ui widget, so no ValueListenableBuilder wrapper

class ReminderPage extends StatefulWidget {
  const ReminderPage({super.key});

  @override
  _ReminderPageState createState() => _ReminderPageState();
}

class _ReminderPageState extends State<ReminderPage> {
  final settingsStateManager = getIt<SettingsStateManager>();
  final reminderStateManager = getIt<ReminderStateManager>();

  Color themeUnSelectedColor = Colors.blue;

  @override
  Widget build(BuildContext context) {
    print('[ReminderPage] build');

    return ValueListenableBuilder<List<Reminder>>(
        valueListenable: reminderStateManager.reminderStateNotifier,
        builder: (context, reminderList, child) {
          print('[ReminderPage] categoryList: $reminderList');

          return ValueListenableBuilder<String>(
              valueListenable: settingsStateManager.colorThemeStateNotifier,
              builder: (context, colorTheme, child) {
                print('[ReminderPage] build, colorTheme: $colorTheme');

                themeUnSelectedColor = Utils.getUnSelectedColor(colorTheme);

                return Scaffold(
                  body: ListView.builder(
                    itemCount: reminderList.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        leading: IconButton(
                          icon: const Icon(Icons.interests_rounded),
                          onPressed: () {},
                        ),
                        title: Text(reminderList[index].name),
                        trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              IconButton(
                                icon: const Icon(Icons.edit),
                                onPressed: () async {
                                  final String? newText =
                                      await asyncReminderEditDialog(
                                          context, reminderList[index]);
                                },
                              ),
                              IconButton(
                                icon: const Icon(Icons.delete),
                                onPressed: () async {
                                  await showReminderDeleteDialog(
                                      context, reminderList[index]);
                                },
                              ),
                            ]),
                      );
                    },
                  ),
                );
              });
        });
  }
}
