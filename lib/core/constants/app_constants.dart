import '../flavor/flavor_config.dart';

class AppConstants {
  static FlavorConfig get config => FlavorConfig.current;
  
  static String get appName => config.appName;
  static String get bundleId => config.bundleId;
  static String get packageName => config.packageName;
  static String get versionName => config.versionName;
  static int get versionCode => config.versionCode;
  static String get assetPath => config.assetPath;
  static String get firebaseConfigPath => config.firebaseConfigPath;
}

