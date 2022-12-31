abstract class SharedPreferencesStorageService {
  Future<String?> getUserName();

  Future<void> setUserName(String userName);

  Future<bool?> isDarkTheme();

  Future<void> setDarkTheme(bool darkTheme);
}