import 'package:shared_preferences/shared_preferences.dart';

import 'shared_preferences_storage_service.dart';

class SharedPreferencesStorage extends SharedPreferencesStorageService {
  static const user_name_key = 'user_name';
  static const dark_theme_key = 'dark_theme';
  static const category_list_key = 'category_list';
  static const type_list_key = 'type_list';
  static const color_theme_key = 'color_theme';
  static const reminder_list_key = 'reminder_list';

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

  @override
  Future<String?> getColorTheme() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(color_theme_key);
  }

  @override
  Future<void> setColorTheme(String colorTheme) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString(color_theme_key, colorTheme);
  }

  @override
  Future<List<String>?> getTypeList() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getStringList(type_list_key);
  }

  @override
  Future<void> setTypeList(List<String> typeList) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setStringList(type_list_key, typeList);
  }

  @override
  Future<List<String>?> getReminderList() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getStringList(reminder_list_key);
  }

  @override
  Future<void> setReminderList(List<String> reminderList) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setStringList(reminder_list_key, reminderList);
  }
}
