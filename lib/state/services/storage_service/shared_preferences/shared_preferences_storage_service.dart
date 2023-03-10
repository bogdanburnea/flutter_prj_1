abstract class SharedPreferencesStorageService {
  Future<String?> getUserName();

  Future<void> setUserName(String userName);

  Future<bool?> isDarkTheme();

  Future<void> setDarkTheme(bool darkTheme);

  Future<List<String>?> getCategoryList();

  Future<void> setCategoryList(List<String> categoryList);

  Future<String?> getColorTheme();

  Future<void> setColorTheme(String userName);

  Future<List<String>?> getTypeList();

  Future<void> setTypeList(List<String> typeList);

  Future<List<String>?> getReminderList();

  Future<void> setReminderList(List<String> typeList);
}
