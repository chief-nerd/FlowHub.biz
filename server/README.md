# FlowHub Server ⚙️

The robust backend for FlowHub, handling synchronization and service integration.

## 🛠️ Tech Stack
-   **Framework:** FastAPI
-   **ORM:** SQLAlchemy 2.0 (Async)
-   **Database:** PostgreSQL
-   **Task Queue:** Celery + Redis
-   **Security:** JWT + PBKDF2 (SHA256)

## 🏛️ Architectural Decisions

### 1. Unified User Model
The `User` model is the root of all data. All `Todos`, `Goals`, and `PluginConfigs` are tied directly to a `user_id` to ensure strict multi-tenant isolation.

### 2. Plugin Persistence
Integration settings (tokens, preferences) are stored in the `PluginConfig` model. This allows the server to perform background synchronization (e.g., via Celery cron jobs) even when the user is offline.

### 3. Timestamp Mixins
Every model inherits from `TimestampMixin`, providing automatic `created_at` and `updated_at` tracking, which is essential for the Sync Engine's delta calculations.

### 4. Password Security
We use `PBKDF2-SHA256` for password hashing to avoid environment-specific versioning issues with bcrypt, while maintaining industry-standard protection.

## 🧪 Development & Testing
Run linting:
```bash
ruff check .
black --check .
```

Run tests with coverage:
```bash
pytest --cov=src --cov-report=term-missing
```
