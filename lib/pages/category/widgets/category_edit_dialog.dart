import 'package:flutter/material.dart';
import 'package:flutter_prj_1/state/managers/category_state_manager.dart';
import 'package:flutter_prj_1/state/services/service_locator.dart';

Future<String?> asyncCategoryEditDialog(
    BuildContext context, String editedCategory) async {
  String newCategory = editedCategory;
  final categoryStateManager = getIt<CategoryStateManager>();

  return showDialog<String>(
    context: context,
    barrierDismissible:
        false, // dialog is dismissible with a tap on the barrier
    builder: (BuildContext context) {
      return AlertDialog(
          title: const Center(child: Text('Edit Category')),
          content: Row(
            children: <Widget>[
              Expanded(
                  child: TextFormField(
                initialValue: editedCategory,
                autofocus: true,
                decoration: const InputDecoration(hintText: 'eg. Payment'),
                onChanged: (value) {
                  newCategory = value;
                },
              ))
            ],
          ),
          actions: <Widget>[
            ElevatedButton(
              onPressed: () {
                categoryStateManager.deleteCategory(editedCategory);
                categoryStateManager.addCategory(newCategory);
                Navigator.of(context).pop(newCategory);
              },
              child: const Text('Submit'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop(newCategory);
              },
              child: const Text('Cancel'),
            ),
          ],
          actionsAlignment: MainAxisAlignment.spaceAround);
    },
  );
}
