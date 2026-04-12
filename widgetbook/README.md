# FlowHub Widgetbook 📓

A standalone storybook for the FlowHub design system and UI components.

## 🛠️ Purpose
The Widgetbook is used to:
-   Develop UI components in isolation from the main app logic.
-   Test responsiveness using different device frames.
-   Verify internationalization (i18n) strings in real-time.
-   Provide a "live" documentation of the application's widgets.

## 🏗️ Structure
The Widgetbook is a separate Flutter application that depends on the `/app` project via a path dependency.

### Manual Configuration
To ensure maximum stability and avoid generation conflicts, the stories in this project are manually registered in `lib/main.dart`. This allows for complex mocking (e.g., using `Mocktail` for BLoCs) without fighting with automated generators.

## 🚀 Running Widgetbook
```bash
cd widgetbook
fvm flutter run
```

## 🧩 Featured Components
-   **SplitPaneLayout**: Test the collapsible side panel.
-   **CalendarGrid**: Verify 12h/24h formats and multi-day view modes.
-   **TodoListItem**: Preview importance levels and hierarchical tags.
-   **AccountSettingsPage**: Review plugin connection flows.
