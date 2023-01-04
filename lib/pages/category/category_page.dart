import 'package:flutter/material.dart';
import 'package:flutter_prj_1/pages/category/widgets/category_delete_dialog.dart';
import 'package:flutter_prj_1/pages/category/widgets/category_edit_dialog.dart';
import 'package:flutter_prj_1/state/managers/category_state_manager.dart';
import 'package:flutter_prj_1/state/managers/settings_state_manager.dart';
import 'package:flutter_prj_1/state/services/service_locator.dart';
import 'package:flutter_prj_1/utils/utils.dart';

// pure ui widget, so no ValueListenableBuilder wrapper

class CategoryPage extends StatefulWidget {
  const CategoryPage({super.key});

  @override
  _CategoryPageState createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {

  final settingsStateManager = getIt<SettingsStateManager>();
  final categoryStateManager = getIt<CategoryStateManager>();

  Color themeUnSelectedColor = Colors.blue;

  @override
  Widget build(BuildContext context) {
    print('[CategoryPage] build');

    return ValueListenableBuilder<List<String>>(
        valueListenable: categoryStateManager.categoryStateNotifier,
        builder: (context, categoryList, child) {
          print('[CategoryPage] categoryList: $categoryList');

          return ValueListenableBuilder<String>(
              valueListenable: settingsStateManager.colorThemeStateNotifier,
              builder: (context, colorTheme, child) {
                print('[CategoryPage] build, colorTheme: $colorTheme');

                themeUnSelectedColor = Utils.getUnSelectedColor(colorTheme);

                return Scaffold(
                  body: ListView.builder(
                    itemCount: categoryList.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        leading: IconButton(
                          icon: const Icon(Icons.interests_rounded),
                          onPressed: () {},
                        ),
                        title: Text(categoryList[index]),
                        trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              IconButton(
                                icon: const Icon(Icons.edit),
                                onPressed: () async {
                                  final String? newText =
                                  await asyncCategoryEditDialog(
                                      context, categoryList[index]);
                                },
                              ),
                              IconButton(
                                icon: const Icon(Icons.delete),
                                onPressed: () async {
                                  await showCategoryDeleteDialog(
                                      context, categoryList[index]);
                                },
                              ),
                            ]),
                      );
                    },
                  ),
                );
              });
        });
  }
}
