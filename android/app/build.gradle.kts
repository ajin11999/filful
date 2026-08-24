import java.io.File

plugins {
    id("com.android.application")
    id("org.jetbrains.kotlin.android")
    // The Flutter Gradle Plugin must be applied after the Android and Kotlin Gradle plugins.
    id("dev.flutter.flutter-gradle-plugin")
}

android {
    namespace = "com.filful.filful"
    compileSdk = flutter.compileSdkVersion
    ndkVersion = flutter.ndkVersion

    compileOptions {
        sourceCompatibility = JavaVersion.VERSION_17
        targetCompatibility = JavaVersion.VERSION_17
    }

    defaultConfig {
        // TODO: Specify your own unique Application ID (https://developer.android.com/studio/build/application-id.html).
        applicationId = "com.filful.filful"
        // You can update the following values to match your application needs.
        // For more information, see: https://flutter.dev/to/review-gradle-config.
        minSdk = flutter.minSdkVersion
        targetSdk = flutter.targetSdkVersion
        // Uses the version code from pubspec.yaml. When using split APKs, 1000 * ABI_VERSION
        // is added automatically by Flutter. (https://developer.android.com/studio/build/configure-apk-splits#configure-APK-versions)
        // You can force using the value of versionCode by specifying the `-P force-version-code-ignoring-abi=true`
        // flag during build.
        versionCode = flutter.versionCode
        versionName = flutter.versionName
    }

    signingConfigs {
        create("release") {
            val keystoreFilePath = System.getenv("KEYSTORE_FILE_PATH") ?: (project.findProperty("KEYSTORE_FILE_PATH") as String?)
            val storePasswordStr = System.getenv("KEYSTORE_PASSWORD") ?: (project.findProperty("KEYSTORE_PASSWORD") as String?)
            val keyAliasStr = System.getenv("KEY_ALIAS") ?: (project.findProperty("KEY_ALIAS") as String?)
            val keyPasswordStr = System.getenv("KEY_PASSWORD") ?: (project.findProperty("KEY_PASSWORD") as String?)

            if (!keystoreFilePath.isNullOrEmpty() && File(keystoreFilePath).exists()) {
                storeFile = File(keystoreFilePath)
                storePassword = storePasswordStr
                keyAlias = keyAliasStr
                keyPassword = keyPasswordStr
            } else {
                val debugConfig = signingConfigs.getByName("debug")
                val debugKeystore = debugConfig.storeFile
                if (debugKeystore != null && !debugKeystore.exists()) {
                    debugKeystore.parentFile?.mkdirs()
                    runCatching {
                        ProcessBuilder(
                            "keytool", "-genkey", "-v",
                            "-keystore", debugKeystore.absolutePath,
                            "-storepass", "android",
                            "-alias", "androiddebugkey",
                            "-keypass", "android",
                            "-keyalg", "RSA",
                            "-keysize", "2048",
                            "-validity", "10000",
                            "-dname", "CN=Android Debug,O=Android,C=US"
                        ).start().waitFor()
                    }
                }
                storeFile = debugConfig.storeFile
                storePassword = debugConfig.storePassword
                keyAlias = debugConfig.keyAlias
                keyPassword = debugConfig.keyPassword
            }
        }
    }

    buildTypes {
        release {
            signingConfig = signingConfigs.getByName("release")
        }
    }
}

kotlin {
    compilerOptions {
        jvmTarget = org.jetbrains.kotlin.gradle.dsl.JvmTarget.JVM_17
    }
}

flutter {
    source = "../.."
}
