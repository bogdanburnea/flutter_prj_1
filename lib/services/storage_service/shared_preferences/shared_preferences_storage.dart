import 'package:shared_preferences/shared_preferences.dart';

import 'shared_preferences_storage_service.dart';

class SharedPreferencesStorage extends SharedPreferencesStorageService {
  static const user_name_key = 'user_name';
  static const dark_theme_key = 'dark_theme';
  static const category_list_key = 'category_list';

  @override
  Future<String?> getUserName() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(user_name_key);
  }

  @override
  Future<void> setUserName(String userName) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString(user_name_key, userName);
  }

  @override
  Future<bool?> isDarkTheme() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(dark_theme_key);
  }

  @override
  Future<void> setDarkTheme(bool darkTheme) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setBool(dark_theme_key, darkTheme);
  }

  @override
  Future<List<String>?> getCategoryList() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getStringList(category_list_key);
  }

  @override
  Future<void> setCategoryList(List<String> categoryList) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setStringList(category_list_key, categoryList);
  }
}
