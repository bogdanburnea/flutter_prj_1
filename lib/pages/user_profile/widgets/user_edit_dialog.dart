import 'package:flutter/material.dart';
import 'package:flutter_prj_1/state/managers/user_profile_state_manager.dart';
import 'package:flutter_prj_1/state/services/service_locator.dart';

Future<String?> asyncUserEditDialog(
    BuildContext context, String editedUser) async {
  String newUser = editedUser;
  final userProfileStateManager = getIt<UserProfileStateManager>();

  return showDialog<String>(
    context: context,
    barrierDismissible:
    false, // dialog is dismissible with a tap on the barrier
    builder: (BuildContext context) {
      return AlertDialog(
          title: const Center(child: Text('Edit Username')),
          content: Row(
            children: <Widget>[
              Expanded(
                  child: TextFormField(
                    initialValue: editedUser,
                    autofocus: true,
                    decoration: const InputDecoration(hintText: 'eg. Nice User'),
                    onChanged: (value) {
                      newUser = value;
                    },
                  ))
            ],
          ),
          actions: <Widget>[
            ElevatedButton(
              onPressed: () {
                userProfileStateManager.setUserName(newUser);
                Navigator.of(context).pop(newUser);
              },
              child: const Text('Submit'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop(newUser);
              },
              child: const Text('Cancel'),
            ),
          ],
          actionsAlignment: MainAxisAlignment.spaceAround);
    },
  );
}
