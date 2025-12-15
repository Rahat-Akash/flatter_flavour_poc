import 'app_flavor.dart';

class FlavorConfig {
  final AppFlavor flavor;
  final String appName;
  final String bundleId;
  final String packageName;
  final String versionName;
  final int versionCode;
  final String firebaseConfigPath;
  final String assetPath;

  const FlavorConfig({
    required this.flavor,
    required this.appName,
    required this.bundleId,
    required this.packageName,
    required this.versionName,
    required this.versionCode,
    required this.firebaseConfigPath,
    required this.assetPath,
  });

  static FlavorConfig get current {
    const flavorString = String.fromEnvironment('FLAVOR', defaultValue: 'development');
    
    switch (flavorString) {
      case 'staging':
        return staging;
      case 'production':
        return production;
      case 'development':
      default:
        return development;
    }
  }

  static const FlavorConfig development = FlavorConfig(
    flavor: AppFlavor.development,
    appName: 'Flatter Flavour Dev',
    bundleId: 'com.example.flatter_flavour.dev',
    packageName: 'com.example.flatter_flavour.dev',
    versionName: '1.0.0-dev',
    versionCode: 1,
    firebaseConfigPath: 'assets/firebase/dev/google-services.json',
    assetPath: 'assets/flavors/dev',
  );

  static const FlavorConfig staging = FlavorConfig(
    flavor: AppFlavor.staging,
    appName: 'Flatter Flavour Staging',
    bundleId: 'com.example.flatter_flavour.staging',
    packageName: 'com.example.flatter_flavour.staging',
    versionName: '1.0.0-staging',
    versionCode: 2,
    firebaseConfigPath: 'assets/firebase/staging/google-services.json',
    assetPath: 'assets/flavors/staging',
  );

  static const FlavorConfig production = FlavorConfig(
    flavor: AppFlavor.production,
    appName: 'Flatter Flavour',
    bundleId: 'com.example.flatter_flavour',
    packageName: 'com.example.flatter_flavour',
    versionName: '1.0.0',
    versionCode: 3,
    firebaseConfigPath: 'assets/firebase/prod/google-services.json',
    assetPath: 'assets/flavors/prod',
  );

  @override
  String toString() {
    return 'FlavorConfig(flavor: $flavor, appName: $appName, bundleId: $bundleId, versionName: $versionName, versionCode: $versionCode)';
  }
}

