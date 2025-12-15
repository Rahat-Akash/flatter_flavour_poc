# Quick Checklist: Adding a New Flavor

Use this checklist when adding a new flavor to ensure you don't miss any steps.

## Flavor Details
- **Flavor Name:** _______________ (e.g., demo, qa, beta)
- **Display Name:** _______________ (e.g., Demo, QA, Beta)
- **Bundle ID:** _______________ (e.g., com.example.flatter_flavour.demo)
- **App Name:** _______________ (e.g., Flatter Flavour Demo)
- **Version Name:** _______________ (e.g., 1.0.0-demo)
- **Version Code:** _______________ (increment from highest existing)
- **Theme Color:** _______________ (e.g., Colors.green)

---

## Step-by-Step Checklist

### 1. Dart Code Configuration

- [ ] **`lib/core/flavor/app_flavor.dart`**
  - [ ] Add flavor to `AppFlavor` enum
  - [ ] Add case in `name` getter
  - [ ] Add case in `displayName` getter

- [ ] **`lib/core/flavor/flavor_config.dart`**
  - [ ] Add static const `FlavorConfig` for new flavor
  - [ ] Add case in `current` getter switch statement

- [ ] **`lib/core/theme/app_theme.dart`**
  - [ ] Create new theme method (e.g., `_demoTheme`)
  - [ ] Add case in `getTheme()` switch statement

### 2. Android Configuration

- [ ] **`android/app/build.gradle.kts`**
  - [ ] Add new `create("flavor_name")` block in `productFlavors`
  - [ ] Set `dimension = "flavor"`
  - [ ] Set `applicationId` (bundle ID)
  - [ ] Set `versionCode` (increment from highest)
  - [ ] Set `versionName`
  - [ ] Set `resValue("string", "app_name", "...")`

### 3. Asset Directories

- [ ] Create directory: `assets/flavors/<flavor_name>/`
- [ ] Create directory: `assets/firebase/<flavor_name>/`

### 4. Firebase Configuration

- [ ] **Android:** Place `google-services.json` in `assets/firebase/<flavor_name>/`
- [ ] **iOS:** Place `GoogleService-Info.plist` in `assets/firebase/<flavor_name>/`
- [ ] Verify bundle IDs in Firebase config files match your flavor's bundle ID

### 5. Asset Configuration

- [ ] **`pubspec.yaml`**
  - [ ] Add `- assets/flavors/<flavor_name>/` to assets list
  - [ ] Add `- assets/firebase/<flavor_name>/google-services.json` to assets list

### 6. IDE Configurations

- [ ] **VS Code: `.vscode/launch.json`**
  - [ ] Add "Flavor (Debug)" configuration
  - [ ] Add "Flavor (Profile)" configuration
  - [ ] Add "Flavor (Release)" configuration

- [ ] **Android Studio: `.idea/runConfigurations/`**
  - [ ] Create `Flavor_Debug.xml`
  - [ ] Create `Flavor_Profile.xml`
  - [ ] Create `Flavor_Release.xml`

### 7. Testing

- [ ] Test from terminal: `flutter run --dart-define=FLAVOR=<flavor> --flavor <flavor>`
- [ ] Test from VS Code (select configuration and run)
- [ ] Test from Android Studio (select configuration and run)
- [ ] Verify app name displays correctly
- [ ] Verify theme color is applied
- [ ] Verify bundle ID is correct
- [ ] Test building APK: `flutter build apk --dart-define=FLAVOR=<flavor> --release --flavor <flavor>`

### 8. Documentation

- [ ] Update `README_FLAVORS.md` with new flavor details
- [ ] Update any other relevant documentation

---

## Example: Adding "demo" Flavor

### Flavor Details
- **Flavor Name:** demo
- **Display Name:** Demo
- **Bundle ID:** com.example.flatter_flavour.demo
- **App Name:** Flatter Flavour Demo
- **Version Name:** 1.0.0-demo
- **Version Code:** 4
- **Theme Color:** Colors.green

### Quick Command Reference

```bash
# Run
flutter run --dart-define=FLAVOR=demo --flavor demo

# Build APK
flutter build apk --dart-define=FLAVOR=demo --release --flavor demo

# Build App Bundle
flutter build appbundle --dart-define=FLAVOR=demo --release --flavor demo

# Build iOS
flutter build ios --dart-define=FLAVOR=demo --release
```

---

## Common Issues & Solutions

### Issue: Build fails with "flavor not found"
- **Solution:** Ensure flavor name in `build.gradle.kts` matches exactly (case-sensitive)

### Issue: App shows wrong theme
- **Solution:** Verify the switch case in `app_theme.dart` includes your new flavor

### Issue: Bundle ID conflict
- **Solution:** Ensure each flavor has a unique bundle ID

### Issue: Assets not found
- **Solution:** Run `flutter pub get` after updating `pubspec.yaml`

### Issue: VS Code configuration not appearing
- **Solution:** Reload VS Code window (`Cmd+Shift+P` → "Reload Window")

### Issue: Android Studio configuration not appearing
- **Solution:** Invalidate caches: `File` → `Invalidate Caches / Restart`

---

## Notes

- Keep flavor names in **lowercase** for consistency
- Version codes must be **unique** and **incremental**
- Bundle IDs must be **unique** across all flavors
- Test thoroughly before deploying to production
