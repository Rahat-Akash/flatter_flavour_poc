# iOS Flavor Setup Scripts

## Setup Instructions

### 1. Add Firebase Configuration Files

Place your `GoogleService-Info.plist` files in the following directories:
- `assets/firebase/dev/GoogleService-Info.plist` (for development)
- `assets/firebase/staging/GoogleService-Info.plist` (for staging)
- `assets/firebase/prod/GoogleService-Info.plist` (for production)

### 2. Add Build Script to Xcode

1. Open `ios/Runner.xcworkspace` in Xcode
2. Select the Runner target
3. Go to Build Phases
4. Click the "+" button and select "New Run Script Phase"
5. Name it "Copy Firebase Config"
6. Add the following script:

```bash
"${PROJECT_DIR}/scripts/copy_firebase_config.sh"
```

7. Make sure this script runs before "Compile Sources"

### 3. Create Build Configurations (Optional but Recommended)

For a more complete setup, you can create separate build configurations in Xcode:

1. Go to Project Settings > Info
2. Duplicate Debug and Release configurations for each flavor
3. Create schemes for each flavor (Development, Staging, Production)
4. Set different bundle identifiers for each configuration:
   - Development: `com.example.flatter_flavour.dev`
   - Staging: `com.example.flatter_flavour.staging`
   - Production: `com.example.flatter_flavour`

### 4. Running with Flavors

Use Flutter commands with the `--dart-define` flag:

```bash
# Development
flutter run --dart-define=FLAVOR=development

# Staging
flutter run --dart-define=FLAVOR=staging

# Production
flutter run --dart-define=FLAVOR=production
```

Or build for iOS:

```bash
# Development
flutter build ios --dart-define=FLAVOR=development --release

# Staging
flutter build ios --dart-define=FLAVOR=staging --release

# Production
flutter build ios --dart-define=FLAVOR=production --release
```

