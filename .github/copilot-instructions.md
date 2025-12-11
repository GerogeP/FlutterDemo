# Copilot Instructions for this repository

Purpose
- Help AI coding agents become productive quickly in this repo. This project currently contains only a Git root and no discovered Flutter/project files (no `pubspec.yaml`, no `lib/`, etc.). If files are missing, ask the human to provide the project root or push the missing sources.

Quick repository snapshot
- Repo root contains only `.git/` at the time of inspection.
- Expected Flutter project files to look for: `pubspec.yaml`, `lib/main.dart`, `android/`, `ios/`, `test/`.

What to do first
- Confirm presence of `pubspec.yaml` at repo root. If missing, ask: “Where is the Flutter project root? Is this repo incomplete?”
- If `pubspec.yaml` exists, run `flutter pub get` and inspect `dependencies`/`dev_dependencies`.

Build / Run / Test commands (use only if this is a Flutter app)
- Get packages: `flutter pub get`
- Run app (device/emulator connected): `flutter run`
- Build APK: `flutter build apk --release`
- Run tests: `flutter test`

Project conventions to look for (when sources are present)
- App entry: `lib/main.dart` — follow `main()` to top-level `MaterialApp`/`CupertinoApp` and named routes.
- Feature modules: look for `lib/features/*` or `lib/screens/*` directories; prefer to follow existing directory granularity.
- State management: check for `provider`, `riverpod`, `bloc` or `get_it` in `pubspec.yaml` and follow the chosen pattern consistently.
- Platform channels / native integration: inspect `android/` and `ios/` for custom plugins or `MethodChannel` usage.

Patterns for code edits
- Keep changes localized: prefer adding files under `lib/` and avoid reshaping project layout without confirmation.
- When adding dependencies, update `pubspec.yaml` and run `flutter pub get`; include the minimum version required.

Integration and external dependencies
- Look in `pubspec.yaml` for external services (Firebase, REST clients). If Firebase is present, expect `android/google-services.json` and `ios/GoogleService-Info.plist`.

When to ask the user
- Missing root files (e.g., `pubspec.yaml`) — stop and ask for the correct project root.
- Significant architectural changes — propose and get confirmation before implementing.

Examples (how to reference project files)
- To inspect the app entry point: open `lib/main.dart`.
- To check CI or workflow definitions: open `.github/workflows/` if present.

If you update this file
- Merge intelligently: preserve any existing human-written guidance in this file. If you detect prior content, summarize and append only the delta.

Contact
- If uncertain what to do next, ask a short targeted question such as: “Do you want me to scaffold a new Flutter project here, or did you mean a different folder?”

---
Generated: concise baseline guidance based on current repo contents. Request feedback to iterate.
