from sqlalchemy.orm import Mapped, mapped_column, relationship
from sqlalchemy import String, ForeignKey, Text, Enum, Date, Integer
from src.core.database import Base, TimestampMixin, uuid_pk
import uuid
from typing import List, Optional
from datetime import date
import enum

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
    parent_id: Mapped[Optional[uuid.UUID]] = mapped_column(ForeignKey("todos.id", ondelete="CASCADE"), nullable=True, index=True)
    goal_id: Mapped[Optional[uuid.UUID]] = mapped_column(ForeignKey("goals.id", ondelete="SET NULL"), nullable=True, index=True)
    owner_id: Mapped[uuid.UUID] = mapped_column(ForeignKey("users.id", ondelete="CASCADE"), index=True)
    assignee_id: Mapped[uuid.UUID] = mapped_column(ForeignKey("users.id", ondelete="SET NULL"), nullable=True, index=True)
    
    source_type: Mapped[TodoSourceType] = mapped_column(Enum(TodoSourceType), default=TodoSourceType.NATIVE)
    external_id: Mapped[Optional[str]] = mapped_column(String(255), nullable=True)
    
    title: Mapped[str] = mapped_column(String(255))
    description: Mapped[Optional[str]] = mapped_column(Text, nullable=True)
    
    start_date: Mapped[Optional[date]] = mapped_column(Date, nullable=True)
    due_date: Mapped[Optional[date]] = mapped_column(Date, nullable=True)
    
    status: Mapped[TodoStatus] = mapped_column(Enum(TodoStatus), default=TodoStatus.DRAFT)
    estimated_duration: Mapped[int] = mapped_column(Integer, default=0) # in minutes

    owner: Mapped["User"] = relationship(back_populates="todos", foreign_keys=[owner_id])
    assignee: Mapped["User"] = relationship(back_populates="assigned_todos", foreign_keys=[assignee_id])
    goal: Mapped[Optional["Goal"]] = relationship(back_populates="todos")
    
    parent: Mapped[Optional["Todo"]] = relationship("Todo", remote_side="Todo.id", back_populates="sub_todos")
    sub_todos: Mapped[List["Todo"]] = relationship("Todo", back_populates="parent")
    
    work_sessions: Mapped[List["WorkSession"]] = relationship(back_populates="todo", cascade="all, delete-orphan")
