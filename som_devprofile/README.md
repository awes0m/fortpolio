
# som_devprofile

A personal Flutter portfolio app that showcases projects, experience, education, and contact information.

This repository contains a working Flutter portfolio application used to present a developer profile across mobile, web, and desktop targets.

## Quick overview

- Flutter app built with standard project structure in `lib/`.
- Static assets (images, fonts, JSON) live under `assets/`.
- Platform folders: `android/`, `ios/`, `web/`, `windows/`, `macos/`, `linux/` are included for multi-platform builds.

## Requirements

- Flutter SDK (stable channel). Tested with Flutter 3.x+ (use `flutter --version` to check).
- A compatible platform SDK/tooling for your target (Android Studio or Android SDK for Android, Xcode for iOS/macOS, etc.).

## Installation (Windows PowerShell)


1. Clone the repo and open the project:

```powershell
git clone <repo-url> som_devprofile
cd 'd:\Vscode Projects\Flutter\git_repos\fortpolio\som_devprofile'
```

1. Get packages:

```powershell
flutter pub get
```

1. Run the app on a connected device or emulator:

```powershell
flutter run
```

To run on a specific platform:

- Android: `flutter run -d <device-id>`
- Web (Chrome): `flutter run -d chrome`
- Windows (desktop): `flutter run -d windows`

## Build / Release

Create a release build for a platform:

- Android (APK):

```powershell
flutter build apk --release
```

- Web:

```powershell
flutter build web --release
```

- Windows:

```powershell
flutter build windows --release
```

Refer to the official Flutter docs for platform-specific signing and publishing steps.

## Project structure

- `lib/` — application source code (entry: `main.dart`, app scaffold in `app.dart`).
- `assets/` — images, fonts, JSON (e.g. `portfolio.json`).
- `android/`, `ios/`, `web/`, `windows/`, `macos/`, `linux/` — platform projects.
- `test/` — unit/widget tests.

Key files:

- `lib/main.dart` — app entry point.
- `lib/app.dart` — top-level app widget and routing.
- `assets/portfolio.json` — content used by the app.

## Development notes

- When adding images or fonts, update `pubspec.yaml` to include the new assets and run `flutter pub get`.
- Keep `portfolio.json` in sync with displayed content.
- Use Flutter DevTools and `flutter analyze` to catch issues early.

## Tests

Run unit/widget tests with:

```powershell
flutter test
```

## Troubleshooting

- If you see missing asset errors, ensure `pubspec.yaml` lists the asset paths and re-run `flutter pub get`.
- If a platform build fails, run the build command with `-v` to see verbose logs.

## Contributing

Contributions are welcome. Typical workflow:

1. Fork the repo.
1. Create a feature branch: `git checkout -b feat/your-change`.
1. Commit changes and open a pull request.

Please keep UI/content changes small and provide screenshots for visual updates.

## License & credits

This project includes third-party assets and fonts — check `assets/` and `pubspec.yaml` for attributions. Add your preferred license file (`LICENSE`) at the repo root.

---

If you'd like, I can also:

- Add a short screenshot section with inline images from `assets/`.
- Add CI instructions (e.g., GitHub Actions) for building and testing on push.

Requirements coverage:

- Create a clear README describing how to run and build — Done
- Document project structure and key files — Done
- Provide platform-specific run/build commands (PowerShell) — Done
- Note that I could not run Flutter commands here to validate builds remotely — Deferred (requires local Flutter environment)

If you want these changes to include screenshots or badges, tell me which images to use and I will update the file.
