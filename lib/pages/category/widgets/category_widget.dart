import 'package:flutter/material.dart';
import 'package:flutter_prj_1/pages/category/category_state_manager.dart';
import 'package:flutter_prj_1/services/service_locator.dart';

class CategoryWidget extends StatelessWidget {
  const CategoryWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final categoryStateManager = getIt<CategoryStateManager>();

    return ValueListenableBuilder<List<String>>(
      valueListenable: categoryStateManager.categoryNotifier,
      builder: (context, categoryList, child) {
        print('[CategoryWidget] build, categoryList: $categoryList');

        return Center(
            child: ListView.builder(
          itemCount: categoryList.length,
          itemBuilder: (context, index) {
            return Container(
              height: 50,
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
              child: Text(categoryList[index]),
            );
          },
        ));
      },
    );
  }
}
