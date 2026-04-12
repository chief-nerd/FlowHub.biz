import enum
import uuid
from datetime import date
from typing import Optional

from sqlalchemy import Date, Enum, ForeignKey, Integer, String, Text
from sqlalchemy.orm import Mapped, mapped_column, relationship

from src.core.database import Base, TimestampMixin, uuid_pk


class TodoStatus(str, enum.Enum):
    DRAFT = "Draft"
    IN_PROGRESS = "In Progress"
    WAITING = "Waiting"
    COMPLETED = "Completed"


class TodoSourceType(str, enum.Enum):
    NATIVE = "Native"
    GITHUB = "GitHub"
    MS_TODO = "MS ToDo"


class Todo(Base, TimestampMixin):
    __tablename__ = "todos"

    id: Mapped[uuid_pk]
    parent_id: Mapped[uuid.UUID | None] = mapped_column(
        ForeignKey("todos.id", ondelete="CASCADE"), nullable=True, index=True
    )
    goal_id: Mapped[uuid.UUID | None] = mapped_column(
        ForeignKey("goals.id", ondelete="SET NULL"), nullable=True, index=True
    )
    owner_id: Mapped[uuid.UUID] = mapped_column(
        ForeignKey("users.id", ondelete="CASCADE"), index=True
    )
    assignee_id: Mapped[uuid.UUID] = mapped_column(
        ForeignKey("users.id", ondelete="SET NULL"), nullable=True, index=True
    )

    source_type: Mapped[TodoSourceType] = mapped_column(
        Enum(TodoSourceType), default=TodoSourceType.NATIVE
    )
    external_id: Mapped[str | None] = mapped_column(String(255), nullable=True)

    title: Mapped[str] = mapped_column(String(255))
    description: Mapped[str | None] = mapped_column(Text, nullable=True)

    start_date: Mapped[date | None] = mapped_column(Date, nullable=True)
    due_date: Mapped[date | None] = mapped_column(Date, nullable=True)

    status: Mapped[TodoStatus] = mapped_column(
        Enum(TodoStatus), default=TodoStatus.DRAFT
    )
    estimated_duration: Mapped[int] = mapped_column(Integer, default=0)  # in minutes

    owner: Mapped["User"] = relationship(
        back_populates="todos", foreign_keys=[owner_id]
    )
    assignee: Mapped["User"] = relationship(
        back_populates="assigned_todos", foreign_keys=[assignee_id]
    )
    goal: Mapped["Goal | None"] = relationship(back_populates="todos")

    parent: Mapped["Todo | None"] = relationship(
        "Todo", remote_side="Todo.id", back_populates="sub_todos"
    )
    sub_todos: Mapped[list["Todo"]] = relationship("Todo", back_populates="parent")

    work_sessions: Mapped[list["WorkSession"]] = relationship(
        back_populates="todo", cascade="all, delete-orphan"
    )
