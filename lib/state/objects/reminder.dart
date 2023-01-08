import 'dart:convert';

import 'package:flutter_prj_1/utils/notification_frequency.dart';
import 'package:flutter_prj_1/utils/reminder_frequency.dart';
import 'package:flutter_prj_1/utils/reminder_type.dart';
import 'package:json_annotation/json_annotation.dart';

Reminder _$ReminderFromJson(Map<String, dynamic> json) => Reminder(
      name: json['name'] as String,
      reminderType: ReminderType.values.firstWhere(
          (e) => e.toString() == 'ReminderType.' + json['reminderType']),
      description: json['description'] as String,
      reminderFrequency: ReminderFrequency.values.firstWhere((e) =>
          e.toString() == 'ReminderFrequency.' + json['reminderFrequency']),
      sendNotification: json['sendNotification'] as bool,
      notificationFrequency: NotificationFrequency.values.firstWhere((e) =>
          e.toString() ==
          'NotificationFrequency.' + json['notificationFrequency']),
      dueDate: json['dueDate'] == null
          ? null
          : DateTime.parse(json['dueDate'] as String),
    );

Map<String, dynamic> _$ReminderToJson(Reminder instance) => <String, dynamic>{
      'name': instance.name,
      'reminderType': instance.reminderType.toString(),
      'description': instance.description,
      'reminderFrequency': instance.reminderFrequency.toString(),
      'sendNotification': instance.sendNotification,
      'notificationFrequency': instance.notificationFrequency.toString(),
      'dueDate': instance.dueDate?.toIso8601String(),
    };

@JsonSerializable()
class Reminder {
  final String name;
  final ReminderType reminderType;
  final String description;
  final ReminderFrequency reminderFrequency;
  final bool sendNotification;
  final NotificationFrequency notificationFrequency;
  final DateTime? dueDate;

  const Reminder(
      {required this.name,
      required this.reminderType,
      required this.description,
      required this.reminderFrequency,
      required this.sendNotification,
      required this.notificationFrequency,
      this.dueDate});

  factory Reminder.fromJson(Map<String, dynamic> json) =>
      _$ReminderFromJson(json);

  static Map<String, dynamic> toJson(Reminder reminder) =>
      _$ReminderToJson(reminder);

  static List<String> encode(List<Reminder> reminders) =>
      reminders.map((element) => jsonEncode(Reminder.toJson(element))).toList();

  static List<Reminder> decode(List<String> reminders) => reminders
      .map((element) => Reminder.fromJson(jsonDecode(element)))
      .toList();
}
