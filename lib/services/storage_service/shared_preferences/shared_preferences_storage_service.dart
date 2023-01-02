abstract class SharedPreferencesStorageService {
  Future<String?> getUserName();

  Future<void> setUserName(String userName);

  Future<bool?> isDarkTheme();

  Future<void> setDarkTheme(bool darkTheme);

  Future<List<String>?> getCategoryList();

  Future<void> setCategoryList(List<String> categoryList);

  Future<String?> getColorTheme();

  Future<void> setColorTheme(String userName);
}
