import uuid
from datetime import datetime, time, timedelta

from src.models.goal import Goal
from src.models.todo import Todo, TodoSourceType, TodoStatus
from src.models.user import User
from src.models.work_session import WorkSession, WorkSessionStatus


def test_user_model():
    user = User(
        email="test@example.com",
        hashed_password="hash",
        full_name="Test User",
        timezone="UTC",
        afterwork_start_time=time(18, 0),
    )
    assert user.email == "test@example.com"
    assert user.afterwork_start_time == time(18, 0)


def test_todo_relationships():
    user_id = uuid.uuid4()
    goal_id = uuid.uuid4()

    goal = Goal(id=goal_id, owner_id=user_id, title="Test Goal")

    todo = Todo(
        owner_id=user_id,
        goal_id=goal_id,
        title="Test Todo",
        status=TodoStatus.IN_PROGRESS,
        source_type=TodoSourceType.NATIVE,
    )

    # Mocking relationship back-references as SQLAlchemy would normally do
    todo.goal = goal
    assert todo.goal.title == "Test Goal"
    assert todo.status == TodoStatus.IN_PROGRESS


def test_work_session():
    todo_id = uuid.uuid4()
    start = datetime.now()
    end = start + timedelta(hours=1)

    session = WorkSession(
        todo_id=todo_id,
        start_time=start,
        end_time=end,
        status=WorkSessionStatus.SCHEDULED,
    )

    assert session.status == WorkSessionStatus.SCHEDULED
    assert session.end_time > session.start_time
