import 'package:flutter_prj_1/state/notifiers/category_state_notifier.dart';

class CategoryStateManager {
  final categoryStateNotifier = CategoryStateNotifier();

  List<String> getCategoryList() {
    return categoryStateNotifier.value;
  }

  void setCategoryList(List<String> categoryList) {
    categoryStateNotifier.setCategoryList(categoryList);
  }

  void deleteCategoryFromCategoryList(String category) {
    categoryStateNotifier.deleteCategoryFromCategoryList(category);
  }

  void addCategoryToCategoryList(String category) {
    categoryStateNotifier.addCategoryToCategoryList(category);
  }
}
