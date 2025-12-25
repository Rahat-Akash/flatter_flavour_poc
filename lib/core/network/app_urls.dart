class AppUrls {
  static const String baseUrl = "https://api.staging.deeptoplay.com/";
  static String getRefreshTokenPath(){
    return "$baseUrl/Administration/RefreshToken";
  }
  static const String settingsPath = "$baseUrl/v2/settings";
}
