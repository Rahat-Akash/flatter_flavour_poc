# IDE Setup Guide - Running Flavors in VS Code and Android Studio

This guide explains how to run your Flutter app with different flavors using VS Code and Android Studio without using the terminal.

## VS Code Setup

### Using Launch Configurations

1. **Open the Run and Debug panel:**
   - Press `F5` or `Cmd+Shift+D` (Mac) / `Ctrl+Shift+D` (Windows/Linux)
   - Or click the "Run and Debug" icon in the sidebar

2. **Select a configuration:**
   - Click the dropdown at the top of the Run and Debug panel
   - You'll see the following options:
     - **Development (Debug)** - Run development flavor in debug mode
     - **Development (Profile)** - Run development flavor in profile mode
     - **Development (Release)** - Run development flavor in release mode
     - **Staging (Debug)** - Run staging flavor in debug mode
     - **Staging (Profile)** - Run staging flavor in profile mode
     - **Staging (Release)** - Run staging flavor in release mode
     - **Production (Debug)** - Run production flavor in debug mode
     - **Production (Profile)** - Run production flavor in profile mode
     - **Production (Release)** - Run production flavor in release mode

3. **Run the app:**
   - Select your desired configuration
   - Press `F5` or click the green play button
   - The app will launch with the selected flavor

### Quick Access

- **Start Debugging:** `F5`
- **Stop Debugging:** `Shift+F5`
- **Hot Reload:** `Ctrl+F5` (Windows/Linux) or `Cmd+F5` (Mac)
- **Hot Restart:** `Ctrl+Shift+F5` (Windows/Linux) or `Cmd+Shift+F5` (Mac)

## Android Studio Setup

### Method 1: Using Pre-configured Run Configurations

The project includes pre-configured run configurations in `.idea/runConfigurations/`. These should appear automatically in Android Studio.

1. **Open Android Studio** and open your Flutter project

2. **Access Run Configurations:**
   - Look at the top toolbar for the run configuration dropdown (next to the device selector)
   - Click the dropdown to see all available configurations:
     - Development (Debug)
     - Development (Profile)
     - Development (Release)
     - Staging (Debug)
     - Staging (Profile)
     - Staging (Release)
     - Production (Debug)
     - Production (Profile)
     - Production (Release)

3. **Run the app:**
   - Select your desired configuration
   - Click the green "Run" button or press `Shift+F10`

### Method 2: Create Custom Run Configuration (Manual)

If the pre-configured run configurations don't appear, you can create them manually:

1. **Open Run Configuration Dialog:**
   - Click on the run configuration dropdown in the toolbar
   - Select "Edit Configurations..."

2. **Create New Configuration:**
   - Click the "+" button
   - Select "Flutter"

3. **Configure the Flavor:**
   - **Name:** Development (Debug) (or any name you prefer)
   - **Dart entrypoint:** `lib/main.dart`
   - **Additional run args:** `--dart-define=FLAVOR=development --flavor development`
   - **Build flavor:** `development`
   - **Build mode:** `debug` (or `profile`/`release`)

4. **Repeat for other flavors:**
   - Create similar configurations for:
     - Staging: `--dart-define=FLAVOR=staging --flavor staging`
     - Production: `--dart-define=FLAVOR=production --flavor production`

### Method 3: Using Flutter Plugin Settings

1. **Open Flutter Settings:**
   - Go to `File` → `Settings` (Windows/Linux) or `Android Studio` → `Preferences` (Mac)
   - Navigate to `Languages & Frameworks` → `Flutter`

2. **Configure Additional Arguments:**
   - In the "Additional run args" field, enter:
     - For Development: `--dart-define=FLAVOR=development --flavor development`
     - For Staging: `--dart-define=FLAVOR=staging --flavor staging`
     - For Production: `--dart-define=FLAVOR=production --flavor production`

3. **Note:** This method sets a global default. For different flavors, use Method 1 or 2.

## Tips

### VS Code
- Use the Command Palette (`Cmd+Shift+P` / `Ctrl+Shift+P`) and type "Flutter: Select Device" to choose your target device
- The status bar at the bottom shows the current device and Flutter SDK version
- Debug console shows logs and allows you to evaluate expressions

### Android Studio
- Use the device selector dropdown to choose your target device/emulator
- The Flutter Inspector tab provides widget tree visualization
- The Debug tab shows variables, call stack, and breakpoints
- Use the Flutter Performance tab to monitor app performance

## Troubleshooting

### VS Code
- **Configurations not appearing:** Make sure the Flutter extension is installed and enabled
- **Build fails:** Ensure you have the correct device/emulator selected
- **Hot reload not working:** Try a hot restart (`Ctrl+Shift+F5` / `Cmd+Shift+F5`)

### Android Studio
- **Run configurations not appearing:** 
  - Try "Invalidate Caches / Restart" from `File` menu
  - Ensure the `.idea/runConfigurations/` folder exists
  - Manually create configurations using Method 2
- **Flavor not applying:** 
  - Check that both `--dart-define` and `--flavor` arguments are set
  - Verify the flavor name matches exactly (case-sensitive)

## Quick Reference

| Flavor | VS Code Config | Android Studio Config |
|--------|---------------|---------------------|
| Development | Development (Debug) | Development (Debug) |
| Staging | Staging (Debug) | Staging (Debug) |
| Production | Production (Debug) | Production (Debug) |

All configurations support Debug, Profile, and Release build modes.

