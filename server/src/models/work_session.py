from sqlalchemy.orm import Mapped, mapped_column, relationship
from sqlalchemy import ForeignKey, DateTime, Enum
from src.core.database import Base, TimestampMixin, uuid_pk
import uuid
from typing import Optional
from datetime import datetime
import enum

class WorkSessionStatus(str, enum.Enum):
    SCHEDULED = "Scheduled"
    LOGGED = "Logged"
    GHOST = "Ghost"

class WorkSession(Base, TimestampMixin):
    __tablename__ = "work_sessions"

    id: Mapped[uuid_pk]
    todo_id: Mapped[uuid.UUID] = mapped_column(ForeignKey("todos.id", ondelete="CASCADE"), index=True)
    
    start_time: Mapped[datetime] = mapped_column(DateTime(timezone=True))
    end_time: Mapped[datetime] = mapped_column(DateTime(timezone=True))
    
    status: Mapped[WorkSessionStatus] = mapped_column(Enum(WorkSessionStatus), default=WorkSessionStatus.SCHEDULED)

    todo: Mapped["Todo"] = relationship(back_populates="work_sessions")
