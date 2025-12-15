plugins {
    id("com.android.application")
    id("kotlin-android")
    // The Flutter Gradle Plugin must be applied after the Android and Kotlin Gradle plugins.
    id("dev.flutter.flutter-gradle-plugin")
}

android {
    namespace = "com.example.flatter_flavour"
    compileSdk = flutter.compileSdkVersion
    ndkVersion = flutter.ndkVersion

    compileOptions {
        sourceCompatibility = JavaVersion.VERSION_17
        targetCompatibility = JavaVersion.VERSION_17
    }

    kotlinOptions {
        jvmTarget = JavaVersion.VERSION_17.toString()
    }

    defaultConfig {
        minSdk = flutter.minSdkVersion
        targetSdk = flutter.targetSdkVersion
    }

    flavorDimensions += "flavor"

    productFlavors {
        create("development") {
            dimension = "flavor"
            applicationId = "com.example.flatter_flavour.dev"
            versionCode = 1
            versionName = "1.0.0-dev"
            resValue("string", "app_name", "Flatter Flavour Dev")
        }
        create("staging") {
            dimension = "flavor"
            applicationId = "com.example.flatter_flavour.staging"
            versionCode = 2
            versionName = "1.0.0-staging"
            resValue("string", "app_name", "Flatter Flavour Staging")
        }
        create("production") {
            dimension = "flavor"
            applicationId = "com.example.flatter_flavour"
            versionCode = 3
            versionName = "1.0.0"
            resValue("string", "app_name", "Flatter Flavour")
        }
    }

    buildTypes {
        release {
            // TODO: Add your own signing config for the release build.
            // Signing with the debug keys for now, so `flutter run --release` works.
            signingConfig = signingConfigs.getByName("debug")
        }
    }
}

flutter {
    source = "../.."
}
