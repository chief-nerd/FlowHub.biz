from sqlalchemy.orm import Mapped, mapped_column, relationship
from sqlalchemy import String, Time
from src.core.database import Base, TimestampMixin, uuid_pk
from datetime import time
from typing import List

class User(Base, TimestampMixin):
    __tablename__ = "users"

    id: Mapped[uuid_pk]
    email: Mapped[str] = mapped_column(String(255), unique=True, index=True)
    hashed_password: Mapped[str] = mapped_column(String(255))
    full_name: Mapped[str] = mapped_column(String(255))
    timezone: Mapped[str] = mapped_column(String(50), default="UTC")
    afterwork_start_time: Mapped[time] = mapped_column(Time, default=time(17, 0))

    goals: Mapped[List["Goal"]] = relationship(back_populates="owner", cascade="all, delete-orphan")
    todos: Mapped[List["Todo"]] = relationship(
        back_populates="owner", 
        foreign_keys="Todo.owner_id",
        cascade="all, delete-orphan"
    )
    assigned_todos: Mapped[List["Todo"]] = relationship(
        back_populates="assignee",
        foreign_keys="Todo.assignee_id"
    )
