# Quick Start Guide - Flutter Flavors

## Prerequisites

1. Add Firebase configuration files:
   - Android: `assets/firebase/{flavor}/google-services.json`
   - iOS: `assets/firebase/{flavor}/GoogleService-Info.plist`

2. Run `flutter pub get`

## Running the App

**Important:** You need to specify both `--dart-define=FLAVOR=<flavor>` and `--flavor <flavor>` flags.

### Development Flavor
```bash
flutter run --dart-define=FLAVOR=development --flavor development
```

### Staging Flavor
```bash
flutter run --dart-define=FLAVOR=staging --flavor staging
```

### Production Flavor
```bash
flutter run --dart-define=FLAVOR=production --flavor production
```

## Building for Release

### Android APK
```bash
# Development
flutter build apk --dart-define=FLAVOR=development --release --flavor development

# Staging
flutter build apk --dart-define=FLAVOR=staging --release --flavor staging

# Production
flutter build apk --dart-define=FLAVOR=production --release --flavor production
```

### Android App Bundle
```bash
# Development
flutter build appbundle --dart-define=FLAVOR=development --release --flavor development

# Staging
flutter build appbundle --dart-define=FLAVOR=staging --release --flavor staging

# Production
flutter build appbundle --dart-define=FLAVOR=production --release --flavor production
```

### iOS
```bash
# Development
flutter build ios --dart-define=FLAVOR=development --release

# Staging
flutter build ios --dart-define=FLAVOR=staging --release

# Production
flutter build ios --dart-define=FLAVOR=production --release
```

## Using Flavor-Specific Assets

```dart
import 'package:flatter_flavour/core/utils/asset_helper.dart';

// Load a flavor-specific asset
Image.asset(AssetHelper.getAssetPath('logo.png'));
```

## Accessing Flavor Configuration

```dart
import 'package:flatter_flavour/core/constants/app_constants.dart';

final config = AppConstants.config;
print('Flavor: ${config.flavor.displayName}');
print('App Name: ${config.appName}');
print('Bundle ID: ${config.bundleId}');
print('Version: ${config.versionName}');
```

## Flavor Details

| Flavor | App Name | Bundle ID | Version | Theme Color |
|--------|----------|-----------|---------|-------------|
| Development | Flatter Flavour Dev | com.example.flatter_flavour.dev | 1.0.0-dev (1) | Blue |
| Staging | Flatter Flavour Staging | com.example.flatter_flavour.staging | 1.0.0-staging (2) | Orange |
| Production | Flatter Flavour | com.example.flatter_flavour | 1.0.0 (3) | Deep Purple |

