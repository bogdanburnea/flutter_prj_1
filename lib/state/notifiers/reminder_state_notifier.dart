import 'package:flutter/material.dart';
import 'package:flutter_prj_1/state/objects/reminder.dart';
import 'package:flutter_prj_1/state/services/service_locator.dart';
import 'package:flutter_prj_1/state/services/storage_service/shared_preferences/shared_preferences_storage_service.dart';
import 'package:flutter_prj_1/utils/constants.dart';

class ReminderStateNotifier extends ValueNotifier<List<Reminder>> {
  // set intial value
  ReminderStateNotifier() : super(Constants.initialReminderList);

  // get the reference to SharedPreferencesStorageService, singleton
  final sharedPreferencesStorageService =
      getIt<SharedPreferencesStorageService>();

  List<Reminder> getReminderList() {
    return value;
  }

  void setReminderList(List<Reminder> reminderList) {
    // Set.from.list ensures that list elements are unique
    List<Reminder> newReminderList = List.from(Set.from(reminderList));

    newReminderList.sort((a, b) {
      // TODO: sort by dueDate
      return a.name.toLowerCase().compareTo(b.name.toLowerCase());
    });

    value = newReminderList;
    sharedPreferencesStorageService
        .setReminderList(Reminder.encode(newReminderList));
  }

  void deleteReminder(Reminder reminder) {
    List<Reminder>? reminderList = value;
    List<Reminder> newReminderList = [];

    reminderList.forEach((element) {
      if (element != reminder) {
        newReminderList.add(element);
      }
    });
    setReminderList(newReminderList);
  }

  void addReminder(Reminder reminder) {
    setReminderList(List.from(value)..add(reminder));
  }
}
