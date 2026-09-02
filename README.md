# Coffee Shop UI

A modern, responsive Flutter UI for a coffee shop app showcasing product cards, special offers, and a polished bottom navigation. Built as a design-first demo to demonstrate layout, theming, and state management with Riverpod.

## Highlights
- Clean, dark-themed UI with responsive sizing
- Horizontal carousels of coffee cards and curated special offers
- Interactive category selection and bottom navigation
- State management using Riverpod (flutter_riverpod)
- Assets organized under assets/images/

## Stack
- Language(s): Dart
- Framework / runtime: Flutter (Dart SDK ^3.12.2)
- Notable libraries:
  - flutter_riverpod (state management)
  - riverpod
  - cupertino_icons

## Project structure (top-level)
```
android/           Android platform project
ios/               iOS platform project
lib/               Flutter source (UI and widgets)
  home_page/       Main UI widgets (CoffeeShopUi, cards, navigation, Riverpod providers)
assets/            Images and other static assets (assets/images/)
test/              Test folder (empty / scaffolded)
pubspec.yaml       Package manifest (dependencies, assets)
```

Key files:
- `lib/main.dart` — app entry point (runs `CoffeeShopUi`)
- `lib/home_page/coffee_shop_ui.dart` — main screen layout and composition
- `lib/home_page/*.dart` — reusable widgets: `coffee_card.dart`, `special_coffee_card.dart`, `nav_icon.dart`, `item_name.dart`, `text.dart`, and `coffee_name_riverpod.dart` (providers)
- `pubspec.yaml` — declares dependencies and the `assets/images/` asset path

## Screenshots
(Place screenshots in `assets/images/` and reference them here — e.g. `docs/screenshot_home.png`)

## Getting started — run locally

Prerequisites
- Flutter SDK (compatible with Dart SDK ^3.12.2)
- Platform toolchains as needed (Android Studio / Xcode for emulators or physical devices)

Quick start
```bash
# Clone the repository
git clone https://github.com/MMAI-Tech/Coffee_Shop_UI.git
cd Coffee_Shop_UI

# Get packages
flutter pub get

# Run on connected device or simulator
flutter run
```

Run on a specific platform:
- Android: flutter run -d android
- iOS: flutter run -d ios
- Web: flutter run -d chrome
- Desktop (if enabled): flutter run -d windows|macos|linux

Tips
- If assets are updated, run `flutter pub get` and restart the app.
- For a release build: `flutter build apk` or `flutter build ios` (follow platform-specific signing steps).

## Development notes
- UI uses screen dimensions (MediaQuery) for responsive sizing across device sizes.
- `lib/home_page/coffee_name_riverpod.dart` holds simple `StateProvider` providers:
  - `coffee_num` — selected coffee category
  - `nav_num` — bottom navigation selection
- The app is primarily presentational and structured for easy extension (e.g., connecting to a backend, adding a cart, or persisting favorites).
- Assets are expected under `assets/images/` and are referenced directly in widgets (e.g., `assets/images/coffee1.png`, `profile.png`).

## Suggestions & Next Improvements
- Extract data models and replace inline hard-coded items with JSON or model classes.
- Add tests (widget and unit tests) under `test/`.
- Add localization support for multiple languages.
- Add accessibility improvements (semantic labels, larger tappable areas).
- Consider extracting theme into a centralized `ThemeData` to support light/dark toggles.

## Contributing
Contributions are welcome. Suggested workflow:
1. Fork the repository
2. Create a feature branch: `git checkout -b feat/my-feature`
3. Make changes and add tests where appropriate
4. Open a pull request with a clear description of changes

## License
Specify a license for the project (e.g., MIT). If you don't have one yet, add a `LICENSE` file.

## Contact
For questions or collaboration: open an issue in this repository or contact the maintainers.
