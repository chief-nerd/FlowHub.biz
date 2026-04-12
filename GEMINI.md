# FlowHub: Master Architecture & Agent Mandate

## 🌍 Vision & Overall Goal
FlowHub is a self-hostable, offline-first, multi-user productivity platform. It solves tool fragmentation by natively mapping external tasks (GitHub, MS ToDo, Emails) into a unified, calendar-driven interface. It is designed for deep work, strict data sovereignty, and zero-latency interactions via a local-first architecture.

## 🛠️ Tech Stack & Infrastructure
* **Monorepo Structure:** `/app` (Frontend), `/server` (Backend), and `/widgetbook` (Component Stories).
* **Frontend:** Flutter, BLoC (Strict State Management), GoRouter, Isar (Local Database).
* **Backend:** Python (FastAPI), PostgreSQL, Redis/Celery (Job queues, webhooks, cron), SQLAlchemy 2.0 (Async)/Alembic.
* **Deployment:** Containerized via Docker Compose (Nginx reverse proxy, API backend, Flutter Web frontend).

## 🏛️ Core Architectural Rules
1.  **Local-First & Optimistic UI:** The Flutter app writes to Isar first. The UI reacts instantly. A background BLoC sync engine pushes changes to the Python backend.
2.  **Conflict Resolution:** Remote overrides Local. If an external source (GitHub, MS ToDo) changes, it is the ultimate source of truth.
3.  **UI/UX Paradigm ("Don't Make Me Think"):** Persistent Split-Pane layout. Side panel (Lists/Filters) on the left, Main Calendar grid on the right. Minimal, neutral colors. Semantic colors only for actions. Overdue tasks are universally pinned to the top of all views.

## 🗂️ Core Data Models & Schema
* **User:** Multi-tenant. `id` (UUID), `name`, `email`, `afterwork_start_time` (default 17:00), `timezone`.
* **Goal:** Structural container. No time estimation. Cannot be dragged to calendar. Auto-completes when all child elements complete.
* **Todo:** The actionable unit.
    * *Fields:* `id` (UUID), `parent_id` (FlowHub internal only), `owner_id`, `assignee_id`, `source_type` (Native, GitHub, MS ToDo), `external_id`, `start_date`, `due_date`, `status` (Draft, In Progress, Waiting, Completed), `estimated_duration`.
    * *Hierarchy Rule:* Parent Todos stay "In Progress" even if all sub-todos are completed. They require manual sign-off.
* **WorkSession:** The calendar block. A Todo can have many WorkSessions.
    * *Fields:* `id` (UUID), `todo_id`, `start_time`, `end_time`, `status` (Scheduled, Logged, Ghost).

## 🔄 Sync Engine & Universal Tree Protocol
* **Universal Tree:** FlowHub handles task hierarchy entirely locally. External plugins do *not* attempt to map FlowHub sub-tasks to external sub-tasks. (e.g., A FlowHub Sub-Todo mapped to a GitHub PR is just a standard PR on GitHub).
* **Dual Ingestion:** Backend uses Webhooks (for immediate push events) and fallback polling (IMAP/APIs).
* **Event-Driven State:** External events (e.g., PR mention) automatically transition a mapped Todo's status from "Waiting" to "In Progress".

## 📅 Calendar & Temporal Rules
* **Time Allocation:** Dragging a Todo to the calendar prompts: "Allocate Time: 15m, 30m, 1h, 2h, or Rest (`estimated_duration` - `consumed_time`)".
* **The Midnight Sweep (Temporal Rollover):** A cron job runs at 00:00 local time.
    * If a Todo is **"In Progress"**: Finalize its `WorkSession` as "Logged". Return the base Todo to the Side Panel Inbox.
    * If a Todo is **"Draft/Waiting"**: Delete the `WorkSession` (Ghost). Return the base Todo to the Side Panel Inbox.

## 🤝 Delegation Protocol
* **Assignment:** The Assignee dictates the true `status`. If `owner_id != assignee_id`, the UI implicitly renders the task as "Waiting" for the Owner.
* **Notifications:** Triggered if Assignee completes the task, or if `due_date` is < 24h and status is still "Draft".

---

## ⚙️ AGENT WORK MODE (STRICT MANDATE)
As a Senior Engineer, you must operate with high autonomy and strategic foresight. For every task in `TODO.md`, execute this **Senior Work Loop**:

1.  **Analyze & Scope (Senior Thinking):** 
    *   Explain the architectural approach in the chat.
    *   Look "left and right": Identify edge cases, security implications, and performance bottlenecks before they happen.
    *   Identify "low-hanging fruit": Implement sensible secondary features that improve the core task (e.g., adding `created_at` timestamps, better error logging).
2.  **Clean Architecture Implementation:**
    *   Maintain strict separation of concerns (Presentation -> Domain -> Data).
    *   Backend: Use Pydantic schemas for validation and SQLAlchemy models for persistence.
    *   Frontend: Use BLoC for business logic and Repositories for data access.
3.  **Test-Driven Development (TDD):**
    *   Write minimal failing tests (Unit for backend, Widget/Unit for Flutter).
    *   Use mocks for external dependencies and database interactions.
4.  **Verification & Validation:**
    *   Verify timezone handling (everything stored in UTC).
    *   Check state propagation across BLoCs and Sync Engine.
    *   **Frontend: Build essential Widgetbook stories and Widget/Unit tests for all new widgets/features.**
    *   **QA: Update `TEST_PROTOCOL.md` with corresponding User Stories and manual verification steps for every new feature.**
    *   Run all tests.
5.  **Clean Up & Document:**
    *   Ensure code is formatted (Black/Ruff for Python).
    *   Update `GEMINI.md` with any new critical knowledge discovered or decided during implementation.
6.  **Complete:** Mark task complete in `TODO.md`, commit code, and move to next.

## 💎 CRITICAL IMPLEMENTATION KNOWLEDGE
*   **UUID Persistence:** We use UUIDs as primary keys in the backend (PostgreSQL) to avoid ID collisions during synchronization from various clients. Isar on the frontend uses `Id.autoIncrement` (int), but stores the backend UUID in an `externalId` field.
*   **Timestamp Mixins:** All backend models must inherit from `TimestampMixin` (providing `created_at` and `updated_at`).
*   **Sync Logic:** Local-First means we always write to Isar first. The `SyncEngine` tracks `PendingMutations` to push to the backend. Conflict resolution is strictly **Remote-Overrides-Local**.
*   **JWT Security:** Auth tokens consist of an `access_token` (30m expiry) and a `refresh_token` (7d expiry).
*   **Flutter Structure:** 
    *   `lib/core`: Cross-feature logic (API client, database service).
    *   `lib/shared`: UI components used by multiple features.
    *   `lib/features/[feature_name]`: Domain-driven feature directories.
