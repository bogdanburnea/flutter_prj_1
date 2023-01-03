import 'package:flutter/material.dart';
import 'package:flutter_prj_1/state/managers/settings_state_manager.dart';
import 'package:flutter_prj_1/pages/type/widgets/type_delete_dialog.dart';
import 'package:flutter_prj_1/pages/type/widgets/type_edit_dialog.dart';
import 'package:flutter_prj_1/state/services/service_locator.dart';
import 'package:flutter_prj_1/utils/utils.dart';

// pure ui widget, so no ValueListenableBuilder wrapper

class TypePage extends StatefulWidget {
  const TypePage({super.key, required this.items});

  final List<String> items;

  @override
  _TypePageState createState() => _TypePageState();
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
                    icon: const Icon(Icons.category_outlined),
                    onPressed: () {},
                  ),
                  title: Text(widget.items[index]),
                  trailing:
                      Row(mainAxisSize: MainAxisSize.min, children: <Widget>[
                    IconButton(
                      icon: const Icon(Icons.edit),
                      onPressed: () async {
                        final String? newText = await asyncTypeEditDialog(
                            context, widget.items[index]);
                        // Scaffold.of(context).showSnackBar(SnackBar(
                        //   content: new Text("$newText"),
                        // ));
                      },
                    ),
                    IconButton(
                      icon: const Icon(Icons.delete),
                      onPressed: () async {
                        await showTypeDeleteDialog(
                            context, widget.items[index]);
                      },
                    ),
                  ]),
                );
              },
            ),
          );
        });
  }
}
