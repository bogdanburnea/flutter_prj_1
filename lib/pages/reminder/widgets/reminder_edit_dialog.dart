import 'package:flutter/material.dart';
import 'package:flutter_prj_1/state/managers/reminder_state_manager.dart';
import 'package:flutter_prj_1/state/objects/reminder.dart';
import 'package:flutter_prj_1/state/services/service_locator.dart';

Future<String?> asyncReminderEditDialog(
    BuildContext context, Reminder editedReminder) async {
  Reminder newReminder = editedReminder;
  final reminderStateManager = getIt<ReminderStateManager>();

  return showDialog<String>(
    context: context,
    barrierDismissible:
        false, // dialog is dismissible with a tap on the barrier
    builder: (BuildContext context) {
      return AlertDialog(
          title: const Center(child: Text('Edit Reminder')),
          content: Row(
            children: <Widget>[
              Expanded(
                  child: TextFormField(
                initialValue: editedReminder.name,
                autofocus: true,
                decoration: const InputDecoration(hintText: 'eg. Payment'),
                onChanged: (value) {
                  newReminder = Reminder(
                      name: value,
                      reminderType: editedReminder.reminderType,
                      description: editedReminder.description,
                      reminderFrequency: editedReminder.reminderFrequency,
                      sendNotification: editedReminder.sendNotification,
                      notificationFrequency:
                          editedReminder.notificationFrequency);
                },
              ))
            ],
          ),
          actions: <Widget>[
            ElevatedButton(
              onPressed: () {
                reminderStateManager.deleteReminder(editedReminder);
                reminderStateManager.addReminder(newReminder);
                Navigator.of(context).pop(newReminder);
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
