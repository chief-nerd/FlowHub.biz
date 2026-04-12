# FlowHub Execution Roadmap & Tracker

*Follow the Agent Work Loop defined in `Gemini.md` for every task.*

---

## 🗺️ Epic 0: Infrastructure & Monorepo Foundation
- [x] **0.1:** Initialize Git monorepo with `/app` (Flutter) and `/server` (Python) directories.
- [x] **0.2:** Configure Python backend: Setup Poetry/requirements.txt, FastAPI, Black formatter, and Ruff linter.
- [x] **0.3:** Configure Flutter frontend: Setup `pubspec.yaml`, flutter_lints, and initial folder structure (features, core, shared).
- [x] **0.4:** Create baseline Dockerfiles for the Python server and Flutter Web App.
- [x] **0.5:** Setup `docker-compose.yml` with Postgres, Redis, backend, frontend, and Nginx reverse proxy.
- [x] **0.6:** Setup GitHub Actions (or equivalent CI) for automated linting, testing, and Docker builds.

## 🗺️ Epic 1: Data Layer & Local-First Architecture
- [x] **1.1:** Backend: Define SQLAlchemy models for User, Goal, Todo, WorkSession. Setup Alembic migrations.
- [x] **1.2:** Frontend: Define Isar/SQLite schemas mapping to the backend models. Generate Isar accessors.
- [x] **1.3:** Backend: Implement JWT Authentication endpoints (Register, Login, Refresh, Me).
- [x] **1.4:** Frontend: Implement Auth BLoC and secure token storage.
- [x] **1.5:** Frontend: Build the local CRUD repository layer for Goals and Todos.
- [x] **1.6:** Fullstack: Implement the background Sync Engine queue. Handle offline mutations and Remote-Overrides-Local conflict resolution.

## 🗺️ Epic 2: UI Foundation & Side Panel Views
- [x] **2.1:** Implement the core Split-Pane layout (Collapsible Side Panel on left, Main placeholder right).
- [x] **2.2:** Build the Global Theming Engine (Minimal palette, Dark/Light mode).
- [x] **2.3:** Implement Side Panel list items UI (Infinite nesting support for sub-todos).
- [x] **2.4:** Build BLoC filters for UI Views: Inbox, Today, This Work Week, This Week Afterwork, This Month, Delegated.
- [x] **2.5:** Implement the "Sticky Header" logic: Force Overdue tasks to the top of every filtered list.
- [x] **2.6:** Implement Goal logic: Auto-transition to "Completed" when all children are completed.
- [x] **2.7:** Implement Todo logic: Require manual transition to "Completed" even if children are done.

## 🗺️ Epic 3: Main Calendar & Time Blocking
- [x] **3.1:** Implement the Main Calendar View time grid (snapping to 15-minute intervals).
- [x] **3.2:** Implement robust Timezone UTC conversion utilities in both frontend and backend. (Handled i18n, temporal display formats, and multiple view modes: Day, 3-Day, Week, Month)
- [ ] **3.3:** Implement Drag & Drop logic: Allow dragging a Todo from the Side Panel onto the Calendar grid.
- [ ] **3.4:** Build the "Allocate Time" UI Prompt (15m, 30m, 1h, 2h, Rest) and handle the `estimated_duration` burndown math.
- [ ] **3.5:** Implement UI for predefined Work Slots (e.g., Deep Work containers) and calculate remaining capacity.
- [ ] **3.6:** Backend: Build the Celery/Redis Midnight Cron Job (The "Temporal Rollover").
- [ ] **3.7:** Backend: Implement Rollover Rule A ("In Progress" -> "Logged" session, return Todo to Inbox).
- [ ] **3.8:** Backend: Implement Rollover Rule B ("Draft/Waiting" -> delete ghost session, return Todo to Inbox).

## 🗺️ Epic 4: Plugin Architecture & Integrations
- [ ] **4.1:** Backend: Define the Python Abstract Base Class (ABC) for external sync plugins.
- [ ] **4.2:** Fullstack: Implement OAuth2 Consent UI and backend token exchange for third-party integrations.
- [ ] **4.3:** GitHub Plugin: Implement mapping logic from PRs to FlowHub Todos (Title, URL, Status).
- [ ] **4.4:** GitHub Plugin: Implement Webhook listener router with SHA-256 signature validation. Map PR activity to FlowHub "In Progress" state.
- [ ] **4.5:** MS ToDo Plugin: Implement MS Graph API polling, handle rate-limit backoffs, map tasks to FlowHub.
- [ ] **4.6:** Email Plugin: Implement IMAP polling / SendGrid webhook to map flagged emails to FlowHub Todos.

## 🗺️ Epic 5: Collaboration & Delegation
- [ ] **5.1:** Fullstack: Implement User search endpoint and UI. Add `assignee_id` mapping to Todos.
- [ ] **5.2:** Frontend: Build the "Delegated" view logic (implicitly show as "Waiting" for Owner if Assignee is working).
- [ ] **5.3:** Backend: Implement Notification engine (Celery task checking for < 24h due dates on Draft tasks).
- [ ] **5.4:** Fullstack: Implement WebSockets or Server-Sent Events (SSE) to instantly notify Owner when Assignee completes a task.
- [ ] **5.5:** Frontend: Build the Notification Center overlay to display alerts.

