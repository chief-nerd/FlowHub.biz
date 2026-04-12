# FlowHub App 📱

The primary frontend for FlowHub, built with Flutter.

## 🛠️ Tech Stack
-   **State Management:** BLoC (Business Logic Component)
-   **Database:** Isar (NoSQL, local-first)
-   **Localization:** ARB-based i18n
-   **Dependency Injection:** RepositoryProvider (from `flutter_bloc`)

## 🏛️ Architecture: Feature-Driven Clean Architecture

The app is organized into `lib/features/`, where each feature follows:
-   **`/data`**: Models (Isar) and Repositories.
-   **`/domain`**: BLoCs and business logic entities.
-   **`/presentation`**: Pages and Widgets.

### Key Architectural Decisions
1.  **Isar for Local-First:** Chosen for its performance and native support for complex objects and links.
2.  **Reactive Streams:** Repositories return `Stream<List<T>>`, allowing the BLoC to react instantly to local database changes (Optimistic UI).
3.  **Plugin Registry:** External integrations are managed via a centralized registry in `lib/core/plugins/` to avoid hardcoding and ensure easy extensibility.
4.  **Responsive Grid:** The calendar uses a dynamic `pixelsPerMinute` calculation based on `MediaQuery` to ensure readability across all screen sizes.

## 🧪 Testing
-   **Unit Tests:** Located in `test/unit_tests`. Focuses on utilities like `FlowDateUtils`.
-   **BLoC Tests:** Located in `test/bloc_tests`. Verifies state machine integrity.
-   **Widget Tests:** Located in `test/widget_tests`. Ensures UI components render and react correctly.

Run all tests:
```bash
fvm flutter test --coverage
```
