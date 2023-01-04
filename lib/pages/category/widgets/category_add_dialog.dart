import 'package:flutter/material.dart';

Future<String?> asyncCategoryAddDialog(BuildContext context) async {
  String newCategory = '';

  return showDialog<String>(
    context: context,
    barrierDismissible:
        false, // dialog is dismissible with a tap on the barrier
    builder: (BuildContext context) {
      return AlertDialog(
          title: const Center(child: Text('Add Category')),
          content: Row(
            children: <Widget>[
              Expanded(
                  child: TextField(
                autofocus: true,
                decoration: const InputDecoration(hintText: 'eg. Home'),
                onChanged: (value) {
                  newCategory = value;
                },
              ))
            ],
          ),
          actions: <Widget>[
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop(newCategory);
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
