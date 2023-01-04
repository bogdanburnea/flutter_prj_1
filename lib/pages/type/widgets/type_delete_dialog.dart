import 'package:flutter/material.dart';
import 'package:flutter_prj_1/state/managers/type_state_manager.dart';
import 'package:flutter_prj_1/state/services/service_locator.dart';

Future<void> showTypeDeleteDialog(
    BuildContext context, String deletedType) async {
  final typeStateManager = getIt<TypeStateManager>();

  return showDialog<void>(
    context: context,
    barrierDismissible:
        false, // dialog is dismissible with a tap on the barrier
    builder: (BuildContext context) {
      return AlertDialog(
          title: const Center(child: Text('Delete Type')),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Center(child: Text('$deletedType')),
              ],
            ),
          ),
          actions: <Widget>[
            ElevatedButton(
              onPressed: () {
                typeStateManager.deleteType(deletedType);
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
