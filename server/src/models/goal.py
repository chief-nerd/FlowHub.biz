from sqlalchemy.orm import Mapped, mapped_column, relationship
from sqlalchemy import String, ForeignKey, Text, Boolean
from src.core.database import Base, TimestampMixin, uuid_pk
import uuid
from typing import List, Optional

class Goal(Base, TimestampMixin):
    __tablename__ = "goals"

    id: Mapped[uuid_pk]
    owner_id: Mapped[uuid.UUID] = mapped_column(ForeignKey("users.id", ondelete="CASCADE"), index=True)
    title: Mapped[str] = mapped_column(String(255))
    description: Mapped[Optional[str]] = mapped_column(Text, nullable=True)
    is_completed: Mapped[bool] = mapped_column(Boolean, default=False)

    owner: Mapped["User"] = relationship(back_populates="goals")
    todos: Mapped[List["Todo"]] = relationship(back_populates="goal", cascade="all, delete-orphan")
