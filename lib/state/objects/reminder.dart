import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

Reminder _$ReminderFromJson(Map<String, dynamic> json) => Reminder(
      name: json['name'] as String,
      description: json['description'] as String,
      dueDate: json['dueDate'] == null
          ? null
          : DateTime.parse(json['dueDate'] as String),
    );

Map<String, dynamic> _$ReminderToJson(Reminder instance) => <String, dynamic>{
      'name': instance.name,
      'description': instance.description,
      'dueDate': instance.dueDate?.toIso8601String(),
    };

@JsonSerializable()
class Reminder {
  final String name;
  final String description;
  final DateTime? dueDate;

  const Reminder({required this.name, required this.description, this.dueDate});

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
