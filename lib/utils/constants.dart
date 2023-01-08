import 'package:flutter_prj_1/state/objects/reminder.dart';
import 'package:flutter_prj_1/utils/notification_frequency.dart';
import 'package:flutter_prj_1/utils/reminder_frequency.dart';
import 'package:flutter_prj_1/utils/reminder_type.dart';

class Constants {
  static const bool initialDarkTheme = false;

  static const String initialColorTheme = "blue";

  static const String initialUserName = "initialUserName";

  // initial reminder with birthday
  static const Reminder initialReminder = Reminder(
      name: "name",
      reminderType: ReminderType.personal,
      description: "description",
      reminderFrequency: ReminderFrequency.year,
      sendNotification: false,
      notificationFrequency: NotificationFrequency.day);

  static const List<Reminder> initialReminderList = [initialReminder];

  static const List<String> initialCategoryList = [
    "Car",
    "Family",
    "Friends",
    "Home",
    "Personal"
  ];

  static const List<String> initialTypeList = [
    "Anniversary",
    "Assurance",
    "Credit",
    "Electricity",
    "Gas",
    "Health",
    "Internet",
    "Maintenance",
    "Mortgage",
    "Payment",
    "Phone",
    "Rent",
    "Tax",
    "TV",
    "Utilities",
  ];

  static const htmlData = """
  <div>
    <h1>This is a title</h1>
    <p>This is a <strong>paragraph</strong>.</p>
    <p>I like <i>dogs</i></p>
    <p>Red text</p>
    <ul>
        <li>List item 1</li>
        <li>List item 2</li>
        <li>List item 3</li>
    </ul>
    <img src='https://www.kindacode.com/wp-content/uploads/2020/11/my-dog.jpg' />
  </div>
  """;
}
