## TrackMe

Developer quickstart to install dependencies, run the app on different platforms, and produce release builds.

### Clone
Use HTTPS:

```bash
git clone https://github.com/EnforcerHuman/TrackMe.git
cd trackme
```


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

### Beta builds (Firebase App Distribution)
Access pre-release Android builds here: [Firebase App Distribution invite link](https://appdistribution.firebase.dev/i/e5891d1d66548ca4)

Join as a tester
1) Share your Google account email with the maintainer to be added as a tester.
2) Accept the invitation sent to your email.
3) Open the invite link above and sign in with the same Google account.

Install the build (Android)
1) On the page, download the latest available APK.
2) If prompted with "Install blocked", enable installs from unknown sources for your browser or Files app:
   - Settings > Apps > Special app access > Install unknown apps > choose your app (e.g., Chrome/Files) > Allow
3) Open the downloaded APK and install.
4) For updates, revisit the same link and install the newer build (uninstall old build if signatures differ).

Troubleshooting
- Not authorized: ensure your Google account email has been added as a tester and you accepted the invite.
- 404 or link expired: ask the maintainer for a fresh invite link.
- Install blocked: enable "Install unknown apps" as noted above.

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


Features :


- Location tracking with local persistence
- Fetch and display users from a remote API
- Material 3 UI with centralized theming
- Error handling for Flutter and platform errors
- Modular architecture with providers, repositories, and use cases

### Usage & Flow
1) Launch the app on Android (`flutter run -d android`).
2) Grant location permissions when prompted.
3) Home screen loads with two core capabilities:
   - Location tracking: starts/stops via the `LocationNotifier` using `TrackLocationUseCase`, persisting updates via `LocationRepositoryImpl` and `LocationLocalDataSource` (Hive).
   - Users list: fetched via `UserNotifier` using `GetUsersUseCase`, backed by `UserRepositoryImpl` and `UserRemoteDataSource` using `ApiClient`.
4) Leave the app running to continue tracking as designed by the Home screen controls.
5) Troubleshoot by checking logs for error messages surfaced by global error handlers.



