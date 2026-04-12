# FlowHub 🌊

FlowHub is a self-hostable, offline-first, multi-user productivity platform. It solves tool fragmentation by natively mapping external tasks (GitHub, MS ToDo, Emails, ERPNext) into a unified, calendar-driven interface.

## 🏗️ Monorepo Structure

-   **`/app`**: Flutter-based frontend (Mobile/Web/Desktop). Uses BLoC for state management and Isar for local-first persistence.
-   **`/server`**: Python (FastAPI) backend. Handles multi-user synchronization, external service integrations, and task ingestion.
-   **`/widgetbook`**: Standalone Flutter application for UI component development and testing.

## 🚀 Getting Started

### Prerequisites
-   **Flutter** (managed via `fvm`)
-   **Python 3.10+**
-   **Docker & Docker Compose** (for backend services like PostgreSQL, Redis)

### Quick Setup
1.  **Environment:** Copy `.env.example` to `.env` in the `server/` directory.
2.  **Backend:**
    ```bash
    cd server
    python -m venv .venv
    source .venv/bin/activate
    pip install -r requirements.txt
    ```
3.  **Frontend:**
    ```bash
    cd app
    fvm flutter pub get
    fvm flutter pub run build_runner build
    ```

## 🏛️ Architectural Decision Records (ADR)

-   **Local-First Priority:** The application writes to the local Isar database first. Syncing with the Python backend happens asynchronously via a background Sync Engine.
-   **Conflict Resolution:** We follow a **Remote-Overrides-Local** strategy. If an external source (like a GitHub PR) changes, it is the ultimate source of truth.
-   **Hierarchical Tags:** Tags support a `category/name` structure (e.g., `customer/RIT`) allowing for multi-level filtering and clear visual organization.
-   **Temporal Grid:** The calendar uses a 24-hour vertical grid with 15-minute snapping, designed specifically for deep work allocation.

## ✅ Quality Standards
Every feature must include:
1.  **BLoC Tests:** Full coverage of state transitions.
2.  **Widget Tests:** Verification of UI components.
3.  **Widgetbook Stories:** For visual regression and component isolation.
4.  **Manual Protocol:** Updated entries in `TEST_PROTOCOL.md`.
