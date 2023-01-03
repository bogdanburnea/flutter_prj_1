import 'package:flutter/material.dart';
import 'package:flutter_prj_1/state/managers/type_state_manager.dart';
import 'package:flutter_prj_1/state/services/service_locator.dart';

Future<String?> asyncTypeAddDialog(BuildContext context) async {
  String newType = '';

  return showDialog<String>(
    context: context,
    barrierDismissible:
        false, // dialog is dismissible with a tap on the barrier
    builder: (BuildContext context) {
      return AlertDialog(
          title: const Center(child: Text('Add Type')),
          content: Row(
            children: <Widget>[
              Expanded(
                  child: TextField(
                autofocus: true,
                decoration: const InputDecoration(
                    hintText: 'eg. Payment'),
                onChanged: (value) {
                  newType = value;
                },
              ))
            ],
          ),
          actions: <Widget>[
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop(newType);
              },
              child: const Text('OK'),
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
