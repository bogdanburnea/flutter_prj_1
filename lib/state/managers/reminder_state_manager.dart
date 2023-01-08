import 'package:flutter_prj_1/state/notifiers/reminder_state_notifier.dart';
import 'package:flutter_prj_1/state/objects/reminder.dart';

class ReminderStateManager {
  final reminderStateNotifier = ReminderStateNotifier();

  List<Reminder> getReminderList() {
    return reminderStateNotifier.value;
  }

  void setReminderList(List<Reminder> reminderList) {
    reminderStateNotifier.setReminderList(reminderList);
  }

  void deleteReminder(Reminder reminder) {
    reminderStateNotifier.deleteReminder(reminder);
  }

  void addReminder(Reminder reminder) {
    reminderStateNotifier.addReminder(reminder);
  }
}
