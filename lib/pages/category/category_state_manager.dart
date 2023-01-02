import 'package:flutter_prj_1/state/category_notifier.dart';

class CategoryStateManager {
  final categoryNotifier = CategoryNotifier();

  List<String> getCategoryList() {
    return categoryNotifier.value;
  }

  void setCategoryList(List<String> categoryList) {
    categoryNotifier.setCategoryList(categoryList);
  }
}
