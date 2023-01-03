import 'package:flutter/material.dart';

Future<String?> asyncInputDialog(BuildContext context) async {
  String sampleText = '';
  return showDialog<String>(
    context: context,
    barrierDismissible:
        false, // dialog is dismissible with a tap on the barrier
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('Enter Type'),
        content: Row(
          children: <Widget>[
            Expanded(
                child: TextField(
              autofocus: true,
              decoration: const InputDecoration(
                  labelText: 'Enter a Text', hintText: 'eg. Payment'),
              onChanged: (value) {
                sampleText = value;
              },
            ))
          ],
        ),
        actions: <Widget>[
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).pop(sampleText);
            },
            child: const Text('OK'),
          ),
        ],
      );
    },
  );
}
