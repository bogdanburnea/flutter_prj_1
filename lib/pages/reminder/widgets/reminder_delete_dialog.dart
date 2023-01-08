import 'package:flutter/material.dart';
import 'package:flutter_prj_1/state/managers/reminder_state_manager.dart';
import 'package:flutter_prj_1/state/objects/reminder.dart';
import 'package:flutter_prj_1/state/services/service_locator.dart';

Future<void> showReminderDeleteDialog(
    BuildContext context, Reminder deletedReminder) async {

  final reminderStateManager = getIt<ReminderStateManager>();

  return showDialog<void>(
    context: context,
    barrierDismissible:
        false, // dialog is dismissible with a tap on the barrier
    builder: (BuildContext context) {
      return AlertDialog(
          title: const Center(child: Text('Delete Reminder')),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Center(child: Text('$deletedReminder')),
              ],
            ),
          ),
          actions: <Widget>[
            ElevatedButton(
              onPressed: () {
                reminderStateManager.deleteReminder(deletedReminder);
                Navigator.of(context).pop();
              },
              child: const Text('Submit'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Cancel'),
            ),
          ],
          actionsAlignment: MainAxisAlignment.spaceAround);
    },
  );
}
