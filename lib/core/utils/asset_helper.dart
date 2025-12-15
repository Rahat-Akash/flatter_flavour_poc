import '../constants/app_constants.dart';

/// Helper class for loading flavor-specific assets
class AssetHelper {
  /// Get the full path to a flavor-specific asset
  /// 
  /// Example:
  /// ```dart
  /// final logoPath = AssetHelper.getAssetPath('logo.png');
  /// Image.asset(logoPath);
  /// ```
  static String getAssetPath(String assetName) {
    final basePath = AppConstants.assetPath;
    return '$basePath/$assetName';
  }

  /// Get the Firebase configuration path for the current flavor
  static String get firebaseConfigPath => AppConstants.firebaseConfigPath;
}

