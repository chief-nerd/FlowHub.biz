# FlowHub: Master Architecture & Agent Mandate

## 🌍 Vision & Overall Goal
FlowHub is a self-hostable, offline-first, multi-user productivity platform. It solves tool fragmentation by natively mapping external tasks (GitHub, MS ToDo, Emails) into a unified, calendar-driven interface. It is designed for deep work, strict data sovereignty, and zero-latency interactions via a local-first architecture.

## 🛠️ Tech Stack & Infrastructure
* **Monorepo Structure:** `/app` (Frontend) and `/server` (Backend).
* **Frontend:** Flutter, BLoC (Strict State Management), GoRouter, Isar/SQLite (Local Database).
* **Backend:** Python (FastAPI), PostgreSQL, Redis/Celery (Job queues, webhooks, cron), SQLAlchemy/Alembic.
* **Deployment:** Containerized via Docker Compose (Nginx reverse proxy, API backend, Flutter Web frontend).

## 🏛️ Core Architectural Rules
1.  **Local-First & Optimistic UI:** The Flutter app writes to Isar/SQLite first. The UI reacts instantly. A background BLoC sync engine pushes changes to the Python backend.
2.  **Conflict Resolution:** Remote overrides Local. If an external source (GitHub, MS ToDo) changes, it is the ultimate source of truth.
3.  **UI/UX Paradigm ("Don't Make Me Think"):** Persistent Split-Pane layout. Side panel (Lists/Filters) on the left, Main Calendar grid on the right. Minimal, neutral colors. Semantic colors only for actions. Overdue tasks are universally pinned to the top of all views.

## 🗂️ Core Data Models & Schema
* **User:** Multi-tenant. `id`, `name`, `email`, `afterwork_start_time` (default 17:00), `timezone`.
* **Goal:** Structural container. No time estimation. Cannot be dragged to calendar. Auto-completes when all child elements complete.
* **Todo:** The actionable unit.
    * *Fields:* `id`, `parent_id` (FlowHub internal only), `owner_id`, `assignee_id`, `source_type` (Native, GitHub, MS ToDo), `external_id`, `start_date`, `due_date`, `status` (Draft, In Progress, Waiting, Completed), `estimated_duration`.
    * *Hierarchy Rule:* Parent Todos stay "In Progress" even if all sub-todos are completed. They require manual sign-off.
* **WorkSession:** The calendar block. A Todo can have many WorkSessions.
    * *Fields:* `id`, `todo_id`, `start_time`, `end_time`, `status` (Scheduled, Logged, Ghost).

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

## ⚙️ AGENT WORK LOOP (STRICT MANDATE)
For every single task in `TODO.md`, you MUST execute this loop:
1.  **Analyze & Scope:** State your architectural approach in the chat before coding.
2.  **Test-Driven Development:** Write minimal failing tests (Unit for backend, Widget/Unit for Flutter).
3.  **Implementation:** Code the feature to make tests pass.
4.  **Mocking/Validation:** Mock external APIs first. Verify timezone handling and state propagation.
5.  **In-Depth Review:** Check against the Core Architectural Rules above.
6.  **Verify:** Run all tests.
7.  **Complete:** Mark task complete in `TODO.md`, commit code, and move to next.

