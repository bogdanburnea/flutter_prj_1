import 'package:flutter/material.dart';
import 'package:flutter_prj_1/state/managers/category_state_manager.dart';
import 'package:flutter_prj_1/state/services/service_locator.dart';

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
            return ListTile(
              leading: IconButton(
                icon: const Icon(Icons.category_rounded),
                onPressed: () {},
              ),
              title: Text(categoryList[index]),
              trailing: Row(mainAxisSize: MainAxisSize.min, children: <Widget>[
                IconButton(
                  icon: Icon(Icons.edit),
                  onPressed: () async {},
                ),
                IconButton(
                  icon: const Icon(Icons.delete),
                  onPressed: () {},
                ),
              ]),
            );
          },
        ));
      },
    );
  }
}
