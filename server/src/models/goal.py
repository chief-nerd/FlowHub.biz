import uuid
from typing import TYPE_CHECKING

if TYPE_CHECKING:
    from src.models.todo import Todo
    from src.models.user import User

from sqlalchemy import Boolean, ForeignKey, String, Text
from sqlalchemy.orm import Mapped, mapped_column, relationship

from src.core.database import Base, TimestampMixin, uuid_pk


class Goal(Base, TimestampMixin):
    __tablename__ = "goals"

    id: Mapped[uuid_pk]
    owner_id: Mapped[uuid.UUID] = mapped_column(
        ForeignKey("users.id", ondelete="CASCADE"), index=True
    )
    title: Mapped[str] = mapped_column(String(255))
    description: Mapped[str | None] = mapped_column(Text, nullable=True)
    is_completed: Mapped[bool] = mapped_column(Boolean, default=False)

    owner: Mapped["User"] = relationship(back_populates="goals")
    todos: Mapped[list["Todo"]] = relationship(
        back_populates="goal", cascade="all, delete-orphan"
    )
