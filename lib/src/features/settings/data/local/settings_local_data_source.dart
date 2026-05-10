abstract interface class SettingsLocalDataSource {
  Future<String> getThemeMode();

  Future<void> updateThemeMode({required String themeMode});
}
