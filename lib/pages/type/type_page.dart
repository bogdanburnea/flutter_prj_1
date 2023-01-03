import 'package:flutter/material.dart';
import 'package:flutter_prj_1/pages/settings/settings_state_manager.dart';
import 'package:flutter_prj_1/services/service_locator.dart';
import 'package:flutter_prj_1/utils/utils.dart';

// pure ui widget, so no ValueListenableBuilder wrapper

class TypePage extends StatefulWidget {
  const TypePage({super.key, required this.items});

  final List<String> items;

  @override
  _TypePageState createState() => _TypePageState();
}

Future<String?> _asyncInputDialog(BuildContext context) async {
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

class _TypePageState extends State<TypePage> {
  Color themeUnSelectedColor = Colors.blue;

  @override
  Widget build(BuildContext context) {
    print('[TypePage] build');

    final settingsStateManager = getIt<SettingsStateManager>();

    return ValueListenableBuilder<String>(
        valueListenable: settingsStateManager.colorThemeStateNotifier,
        builder: (context, colorTheme, child) {
          print('[HomePage] build, colorTheme: $colorTheme');

          themeUnSelectedColor = Utils.getUnSelectedColor(colorTheme);

          return Scaffold(
            body: ListView.builder(
              itemCount: widget.items.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: IconButton(
                    icon: const Icon(Icons.library_books),
                    onPressed: () {},
                  ),
                  title: Text('${widget.items[index]}'),
                  trailing:
                      Row(mainAxisSize: MainAxisSize.min, children: <Widget>[
                    IconButton(
                      icon: Icon(Icons.edit),
                      onPressed: () async {
                        final String? newText =
                            await _asyncInputDialog(context);
                        // Scaffold.of(context).showSnackBar(SnackBar(
                        //   content: new Text("$newText"),
                        // ));
                      },
                    ),
                    IconButton(
                      icon: const Icon(Icons.delete),
                      onPressed: () {},
                    ),
                  ]),
                );
              },
            ),
          );
        });
  }
}
