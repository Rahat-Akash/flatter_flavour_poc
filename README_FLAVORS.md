# Flutter Flavor Setup Guide

This project is configured with multiple flavors (Development, Staging, Production) to support a SaaS product architecture. Each flavor has its own:

- **Asset Management**: Separate asset folders for each flavor
- **Firebase Configuration**: Different Firebase projects for each environment
- **App Theme**: Distinct color schemes for easy identification
- **Bundle Identifier**: Unique package names for each flavor
- **Build Version**: Different version codes and names

## Project Structure

```
lib/
├── core/
│   ├── constants/
│   │   └── app_constants.dart      # App-wide constants
│   ├── flavor/
│   │   ├── app_flavor.dart         # Flavor enum
│   │   └── flavor_config.dart      # Flavor configuration
│   └── theme/
│       └── app_theme.dart          # Theme configuration per flavor

assets/
├── flavors/
│   ├── dev/                        # Development assets
│   ├── staging/                    # Staging assets
│   └── prod/                       # Production assets
└── firebase/
    ├── dev/
    │   └── google-services.json    # Android Firebase config
    │   └── GoogleService-Info.plist # iOS Firebase config
    ├── staging/
    │   └── google-services.json
    │   └── GoogleService-Info.plist
    └── prod/
        └── google-services.json
        └── GoogleService-Info.plist
```

## Flavors

### Development
- **App Name**: Flatter Flavour Dev
- **Bundle ID**: `com.example.flatter_flavour.dev`
- **Version**: 1.0.0-dev (Code: 1)
- **Theme**: Blue
- **Assets**: `assets/flavors/dev/`
- **Firebase**: `assets/firebase/dev/`

### Staging
- **App Name**: Flatter Flavour Staging
- **Bundle ID**: `com.example.flatter_flavour.staging`
- **Version**: 1.0.0-staging (Code: 2)
- **Theme**: Orange
- **Assets**: `assets/flavors/staging/`
- **Firebase**: `assets/firebase/staging/`

### Production
- **App Name**: Flatter Flavour
- **Bundle ID**: `com.example.flatter_flavour`
- **Version**: 1.0.0 (Code: 3)
- **Theme**: Deep Purple
- **Assets**: `assets/flavors/prod/`
- **Firebase**: `assets/firebase/prod/`

## Setup Instructions

### 1. Firebase Configuration

#### Android
1. Go to Firebase Console
2. Select your project (dev/staging/prod)
3. Add Android app with the corresponding bundle ID
4. Download `google-services.json`
5. Place it in the appropriate directory:
   - `assets/firebase/dev/google-services.json`
   - `assets/firebase/staging/google-services.json`
   - `assets/firebase/prod/google-services.json`

#### iOS
1. Go to Firebase Console
2. Select your project (dev/staging/prod)
3. Add iOS app with the corresponding bundle ID
4. Download `GoogleService-Info.plist`
5. Place it in the appropriate directory:
   - `assets/firebase/dev/GoogleService-Info.plist`
   - `assets/firebase/staging/GoogleService-Info.plist`
   - `assets/firebase/prod/GoogleService-Info.plist`

6. Add the copy script to Xcode (see `ios/scripts/README.md`)

### 2. Assets

Place flavor-specific assets in their respective directories:
- `assets/flavors/dev/` - Development assets
- `assets/flavors/staging/` - Staging assets
- `assets/flavors/prod/` - Production assets

### 3. Running the App

**Important:** You must specify both `--dart-define=FLAVOR=<flavor>` and `--flavor <flavor>` flags:
- `--dart-define=FLAVOR=<flavor>` - Passes the flavor to Dart code
- `--flavor <flavor>` - Tells Gradle which Android flavor to build

#### Development
```bash
flutter run --dart-define=FLAVOR=development --flavor development
```

#### Staging
```bash
flutter run --dart-define=FLAVOR=staging --flavor staging
```

#### Production
```bash
flutter run --dart-define=FLAVOR=production --flavor production
```

### 4. Building for Release

#### Android

**Development:**
```bash
flutter build apk --dart-define=FLAVOR=development --release --flavor development
```

**Staging:**
```bash
flutter build apk --dart-define=FLAVOR=staging --release --flavor staging
```

**Production:**
```bash
flutter build apk --dart-define=FLAVOR=production --release --flavor production
```

#### iOS

**Development:**
```bash
flutter build ios --dart-define=FLAVOR=development --release
```

**Staging:**
```bash
flutter build ios --dart-define=FLAVOR=staging --release
```

**Production:**
```bash
flutter build ios --dart-define=FLAVOR=production --release
```

## Using Flavor Configuration in Code

### Accessing Current Flavor
```dart
import 'package:flatter_flavour/core/constants/app_constants.dart';

final config = AppConstants.config;
print('Current flavor: ${config.flavor.displayName}');
print('App name: ${config.appName}');
print('Bundle ID: ${config.bundleId}');
```

### Accessing Flavor-Specific Assets
```dart
import 'package:flatter_flavour/core/constants/app_constants.dart';

final assetPath = AppConstants.assetPath;
Image.asset('$assetPath/logo.png');
```

### Using Theme
The theme is automatically applied based on the current flavor. You can access it via:
```dart
Theme.of(context) // Automatically uses the flavor-specific theme
```

## Customization

### Adding a New Flavor - Step-by-Step Guide

This guide will walk you through adding a new flavor (e.g., "demo" or "qa") to your project. We'll use "demo" as an example throughout.

#### Step 1: Add Flavor to Enum

**File:** `lib/core/flavor/app_flavor.dart`

1. Add the new flavor to the `AppFlavor` enum:
```dart
enum AppFlavor {
  development,
  staging,
  production,
  demo,  // Add your new flavor here
}
```

2. Update the `name` getter in the extension:
```dart
extension AppFlavorExtension on AppFlavor {
  String get name {
    switch (this) {
      case AppFlavor.development:
        return 'development';
      case AppFlavor.staging:
        return 'staging';
      case AppFlavor.production:
        return 'production';
      case AppFlavor.demo:  // Add this case
        return 'demo';
    }
  }

  String get displayName {
    switch (this) {
      case AppFlavor.development:
        return 'Development';
      case AppFlavor.staging:
        return 'Staging';
      case AppFlavor.production:
        return 'Production';
      case AppFlavor.demo:  // Add this case
        return 'Demo';
    }
  }
}
```

#### Step 2: Add Flavor Configuration

**File:** `lib/core/flavor/flavor_config.dart`

1. Add a new static constant for your flavor configuration:
```dart
static const FlavorConfig demo = FlavorConfig(
  flavor: AppFlavor.demo,
  appName: 'Flatter Flavour Demo',
  bundleId: 'com.example.flatter_flavour.demo',
  packageName: 'com.example.flatter_flavour.demo',
  versionName: '1.0.0-demo',
  versionCode: 4,  // Increment from the highest existing version code
  firebaseConfigPath: 'assets/firebase/demo/google-services.json',
  assetPath: 'assets/flavors/demo',
);
```

2. Update the `current` getter to handle the new flavor:
```dart
static FlavorConfig get current {
  const flavorString = String.fromEnvironment('FLAVOR', defaultValue: 'development');
  
  switch (flavorString) {
    case 'staging':
      return staging;
    case 'production':
      return production;
    case 'demo':  // Add this case
      return demo;
    case 'development':
    default:
      return development;
  }
}
```

#### Step 3: Add Theme Configuration

**File:** `lib/core/theme/app_theme.dart`

1. Add a new theme method for your flavor:
```dart
static ThemeData get _demoTheme {
  return ThemeData(
    useMaterial3: true,
    colorScheme: ColorScheme.fromSeed(
      seedColor: Colors.green,  // Choose a color for your flavor
      brightness: Brightness.light,
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.green,
      foregroundColor: Colors.white,
    ),
    cardTheme: CardThemeData(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
    ),
  );
}
```

2. Update the `getTheme()` method to include the new flavor:
```dart
static ThemeData getTheme() {
  final config = FlavorConfig.current;
  
  switch (config.flavor) {
    case AppFlavor.development:
      return _developmentTheme;
    case AppFlavor.staging:
      return _stagingTheme;
    case AppFlavor.production:
      return _productionTheme;
    case AppFlavor.demo:  // Add this case
      return _demoTheme;
  }
}
```

#### Step 4: Add Android Flavor Configuration

**File:** `android/app/build.gradle.kts`

Add a new product flavor in the `productFlavors` block:
```kotlin
productFlavors {
    // ... existing flavors ...
    
    create("demo") {
        dimension = "flavor"
        applicationId = "com.example.flatter_flavour.demo"
        versionCode = 4  // Increment from highest existing
        versionName = "1.0.0-demo"
        resValue("string", "app_name", "Flatter Flavour Demo")
    }
}
```

#### Step 5: Create Asset Directories

Create the asset directories for your new flavor:

```bash
# Create flavor assets directory
mkdir -p assets/flavors/demo

# Create Firebase config directory
mkdir -p assets/firebase/demo
```

Or create them manually:
- `assets/flavors/demo/` - For flavor-specific assets (images, icons, etc.)
- `assets/firebase/demo/` - For Firebase configuration files

#### Step 6: Add Firebase Configuration Files

1. **For Android:**
   - Go to Firebase Console
   - Create or select your demo project
   - Add an Android app with bundle ID: `com.example.flatter_flavour.demo`
   - Download `google-services.json`
   - Place it in: `assets/firebase/demo/google-services.json`

2. **For iOS:**
   - In the same Firebase project, add an iOS app with bundle ID: `com.example.flatter_flavour.demo`
   - Download `GoogleService-Info.plist`
   - Place it in: `assets/firebase/demo/GoogleService-Info.plist`

3. **Or create placeholder files** (if not using Firebase yet):
   - Copy an existing `google-services.json` and update the bundle ID
   - Copy an existing `GoogleService-Info.plist` and update the bundle ID

#### Step 7: Update pubspec.yaml

**File:** `pubspec.yaml`

Add the new asset paths in the `assets` section:
```yaml
flutter:
  assets:
    # ... existing assets ...
    # Demo flavor assets
    - assets/flavors/demo/
    - assets/firebase/demo/google-services.json
```

#### Step 8: Add VS Code Launch Configuration

**File:** `.vscode/launch.json`

Add three new configurations (Debug, Profile, Release) for your flavor:
```json
{
    "name": "Demo (Debug)",
    "request": "launch",
    "type": "dart",
    "args": [
        "--dart-define=FLAVOR=demo",
        "--flavor",
        "demo"
    ]
},
{
    "name": "Demo (Profile)",
    "request": "launch",
    "type": "dart",
    "flutterMode": "profile",
    "args": [
        "--dart-define=FLAVOR=demo",
        "--flavor",
        "demo"
    ]
},
{
    "name": "Demo (Release)",
    "request": "launch",
    "type": "dart",
    "flutterMode": "release",
    "args": [
        "--dart-define=FLAVOR=demo",
        "--flavor",
        "demo"
    ]
}
```

Add these to the `configurations` array in your `launch.json` file.

#### Step 9: Add Android Studio Run Configurations

**Directory:** `.idea/runConfigurations/`

Create three XML files for your new flavor:

**File:** `.idea/runConfigurations/Demo_Debug.xml`
```xml
<component name="ProjectRunConfigurationManager">
  <configuration default="false" name="Demo (Debug)" type="FlutterRunConfigurationType" factoryName="Flutter">
    <option name="filePath" value="$PROJECT_DIR$/lib/main.dart" />
    <option name="vmAdditionalArgs" value="--dart-define=FLAVOR=demo" />
    <option name="buildFlavor" value="demo" />
    <method v="2" />
  </configuration>
</component>
```

**File:** `.idea/runConfigurations/Demo_Profile.xml`
```xml
<component name="ProjectRunConfigurationManager">
  <configuration default="false" name="Demo (Profile)" type="FlutterRunConfigurationType" factoryName="Flutter">
    <option name="filePath" value="$PROJECT_DIR$/lib/main.dart" />
    <option name="vmAdditionalArgs" value="--dart-define=FLAVOR=demo" />
    <option name="buildFlavor" value="demo" />
    <option name="buildMode" value="profile" />
    <method v="2" />
  </configuration>
</component>
```

**File:** `.idea/runConfigurations/Demo_Release.xml`
```xml
<component name="ProjectRunConfigurationManager">
  <configuration default="false" name="Demo (Release)" type="FlutterRunConfigurationType" factoryName="Flutter">
    <option name="filePath" value="$PROJECT_DIR$/lib/main.dart" />
    <option name="vmAdditionalArgs" value="--dart-define=FLAVOR=demo" />
    <option name="buildFlavor" value="demo" />
    <option name="buildMode" value="release" />
    <method v="2" />
  </configuration>
</component>
```

#### Step 10: Test Your New Flavor

1. **Run from terminal:**
   ```bash
   flutter run --dart-define=FLAVOR=demo --flavor demo
   ```

2. **Run from VS Code:**
   - Press `F5` or open Run and Debug panel
   - Select "Demo (Debug)" from the dropdown
   - Press `F5` to run

3. **Run from Android Studio:**
   - Select "Demo (Debug)" from the run configuration dropdown
   - Click Run or press `Shift+F10`

4. **Build for release:**
   ```bash
   flutter build apk --dart-define=FLAVOR=demo --release --flavor demo
   ```

#### Step 11: Update Documentation (Optional)

Update this README to include your new flavor in the Flavors section and any other relevant documentation.

#### Checklist Summary

- [ ] Added flavor to `AppFlavor` enum
- [ ] Updated `name` and `displayName` getters
- [ ] Added `FlavorConfig` constant
- [ ] Updated `current` getter in `FlavorConfig`
- [ ] Added theme method in `AppTheme`
- [ ] Updated `getTheme()` method
- [ ] Added Android product flavor in `build.gradle.kts`
- [ ] Created `assets/flavors/<flavor_name>/` directory
- [ ] Created `assets/firebase/<flavor_name>/` directory
- [ ] Added Firebase config files (or placeholders)
- [ ] Updated `pubspec.yaml` assets section
- [ ] Added VS Code launch configurations
- [ ] Added Android Studio run configurations
- [ ] Tested running the new flavor
- [ ] Updated documentation

#### Important Notes

- **Bundle ID must be unique:** Each flavor needs a unique bundle identifier (e.g., `com.example.flatter_flavour.demo`)
- **Version Code:** Increment the version code for each new flavor (use the highest existing + 1)
- **Flavor name consistency:** Keep the flavor name consistent across all files (use lowercase, e.g., "demo")
- **Firebase:** Each flavor should have its own Firebase project or at least its own app configuration within a project
- **Case sensitivity:** Flavor names are case-sensitive. Use lowercase consistently.

### Modifying Themes

Edit the theme methods in `lib/core/theme/app_theme.dart`:
- `_developmentTheme`
- `_stagingTheme`
- `_productionTheme`

### Modifying Version Numbers

Update the version information in:
- `lib/core/flavor/flavor_config.dart` (Dart code)
- `android/app/build.gradle.kts` (Android build config)

## Notes

- The flavor is determined at compile time using `--dart-define=FLAVOR=<flavor_name>`
- All flavors share the same codebase but use different configurations
- Each flavor can be installed simultaneously on the same device (different bundle IDs)
- Firebase configurations must match the bundle IDs configured in Firebase Console

