import 'package:flutter_prj_1/state_notifiers/category_state_notifier.dart';

class CategoryStateManager {
  final categoryNotifier = CategoryStateNotifier();

  List<String> getCategoryList() {
    return categoryNotifier.value;
  }

  void setCategoryList(List<String> categoryList) {
    categoryNotifier.setCategoryList(categoryList);
  }
}
