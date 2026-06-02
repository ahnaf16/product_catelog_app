# Product Catalog App

A Flutter product catalog app with product listing, search, product details, favorites, theme settings, responsive layouts, cached network images, and local persistence.

## Project Setup Instructions

1. Install Flutter and Dart. This project targets Dart `^3.11.0`.
2. Install dependencies:

```bash
flutter pub get
```

1. Generate code for Riverpod, Injectable, Hive, and `dart_mappable`:

```bash
dart run build_runner build --delete-conflicting-outputs
```

1. Run the app:

```bash
flutter run
```

1. Run static analysis:

```bash
flutter analyze
```

## CI/CD Release Process

GitHub Actions builds and publishes the Android release APK automatically after code is merged into the `main` branch.

The workflow runs these steps:

1. Install Java 17 and Flutter stable.
2. Install Flutter dependencies.
3. Generate source files with `build_runner`.
4. Run static analysis.
5. Run tests when a `test/` directory exists.
6. Build the release APK.
7. Create a GitHub Release with the APK attached.

Normal release flow:

1. Create or switch to a feature branch.
2. Commit and push changes with GitHub Desktop.
3. Open a pull request into `main` on GitHub.
4. Merge the pull request after review.
5. Wait for the GitHub Actions workflow to finish.
6. Download the APK from the repository's Releases page.

The workflow can also be started manually from the Actions tab with `workflow_dispatch`.

## Architecture Explanation

The app uses a feature-based structure under `lib/features`.

- `features/product` owns product listing, details, search, product controllers, and product API access.
- `features/favorites` owns favorite product persistence and favorite list UI.
- `features/app_config` owns app configuration, including theme preference.
- `_core` contains shared concerns such as networking, error handling, extensions, storage setup, strings, and toasts.
- `_widgets` contains reusable UI primitives such as `UImage`, skeleton loading widgets, empty/error state views, and theme option cards.
- `routes` contains `go_router` route paths and route configuration.
- `models` contains immutable app models and generated mapping code.

Dependencies are registered with `get_it` and `injectable`. Repositories are injected through the service locator, while UI state is exposed through Riverpod providers and controllers.

## State Management Explanation

State management is handled with `hooks_riverpod` and `riverpod_annotation`.

- `AsyncNotifier`-style generated providers load products, product details, favorites, and app configuration.
- Screens watch providers with `ref.watch(...)` and render loading, error, empty, and data states through `AsyncValue.when(...)`.
- Controllers expose small actions such as `reload`, `search`, `toggleFavorite`, `clearAll`, and `setThemeMode`.
- `flutter_hooks` is used for lightweight widget-local concerns such as memoizing notifier reads.
- Favorites and theme mode are persisted locally with Hive, then surfaced through Riverpod providers.

## Third-party Packages Used

- `cached_network_image`: Cached loading for network product images.
- `dart_mappable`: Immutable model mapping and generated serializers.
- `dio`: HTTP client for product API requests.
- `flutter_hooks`: Hook utilities for Flutter widgets.
- `flutter_staggered_grid_view`: Masonry product grid layout.
- `fpdart`: Functional result handling with `Either`.
- `gap`: Consistent spacing widgets.
- `get_it`: Service locator.
- `go_router`: Declarative app routing.
- `hive_ce` and `hive_ce_flutter`: Local persistence for favorites and app configuration.
- `hooks_riverpod`: Provider-based state management with hooks support.
- `injectable`: Dependency injection code generation.
- `intl`: Currency and number formatting.
- `lucide_icons_flutter`: Lucide icon set.
- `riverpod_annotation`: Riverpod provider annotations and generated providers.
- `toastification`: Toast notifications.

Development packages:

- `build_runner`: Runs code generators.
- `dart_mappable_builder`: Generates model mappers.
- `hive_ce_generator`: Generates Hive adapters.
- `injectable_generator`: Generates dependency injection registration.
- `riverpod_generator`: Generates Riverpod providers.
