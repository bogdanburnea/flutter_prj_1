import 'package:flutter/material.dart';
import 'package:flutter_prj_1/pages/settings/settings_state_manager.dart';
import 'package:flutter_prj_1/services/service_locator.dart';

class CategoryWidget extends StatelessWidget {
  const CategoryWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final settingsStateManager = getIt<SettingsStateManager>();

    return ValueListenableBuilder<List<String>>(
      valueListenable: settingsStateManager.categoryNotifier,
      builder: (context, categoryList, child) {
        print('[CategoryWidget] build, categoryList: $categoryList');

        return ListView.builder(
          shrinkWrap: true,
          itemCount: categoryList.length,
          itemBuilder: (context, index) {
            return Text(categoryList[index]);
          },
        );
      },
    );
  }
}
