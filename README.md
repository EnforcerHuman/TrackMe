## TrackMe

Developer quickstart to install dependencies, run the app on different platforms, and produce release builds.

### Prerequisites
- **Flutter SDK** (Stable channel). Install via `https://docs.flutter.dev/get-started/install` and add it to PATH.
- **Dart** comes with Flutter.
- At least one target platform toolchain:
  - Android: Android Studio + SDK + device/emulator, enable USB debugging
  - iOS (macOS only): Xcode + CocoaPods


Verify the environment:

```bash
flutter doctor -v
```

### Getting started
1) Clone/open this repository (root: `trackme`).
2) Fetch packages:

```bash
flutter pub get
```

3) Choose a device (emulator, simulator, browser, or desktop) and run:

```bash
flutter run
```

If you have multiple devices, list them and pick one:

```bash
flutter devices
flutter run -d <device_id>
```

### Platform specifics
#### Android
- Start an Android emulator from Android Studio (AVD) or connect a device with USB debugging.
- First run:

```bash
flutter run -d android
```

Create a release APK:

```bash
flutter build apk --release
```

App bundle (for Play Store):

```bash
flutter build appbundle --release
```

### Common issues
- Run `flutter clean && flutter pub get` if builds behave unexpectedly.
- For Android SDK issues, open Android Studio > SDK Manager and ensure required SDKs/platform-tools are installed.

### iOS
Note: Due to system constraints, iOS setup is not included. Please run and test using the Android build. On macOS, you can later add iOS by opening `ios/` in Xcode and configuring signing.

### Project structure
- `lib/main.dart`: Application entrypoint
- `lib/core/`: Base configurations (theme, routing, constants, dependency setup)
- `lib/services/`: Platform services (location, permissions, API client)
- `lib/presentation/`: UI screens, widgets, and state management
- `lib/data/` (if used): Models, repositories, data sources
- `assets/`: Images, fonts, and other static assets
- `android/`: Native Android project and build configuration
- `ios/`: Native iOS project (not configured here)
- `test/`: Unit and widget tests