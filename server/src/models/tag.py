from typing import TYPE_CHECKING, Optional

from sqlalchemy import Column, ForeignKey, String, Table
from sqlalchemy.orm import Mapped, mapped_column, relationship

from src.core.database import Base, TimestampMixin, uuid_pk

if TYPE_CHECKING:
    from src.models.todo import Todo

# Association table for Todo <-> Tag (Many-to-Many)
todo_tags = Table(
    "todo_tags",
    Base.metadata,
    Column("todo_id", ForeignKey("todos.id", ondelete="CASCADE"), primary_key=True),
    Column("tag_id", ForeignKey("tags.id", ondelete="CASCADE"), primary_key=True),
)


class Tag(Base, TimestampMixin):
    __tablename__ = "tags"

    id: Mapped[uuid_pk]
    name: Mapped[str] = mapped_column(String(50), index=True)
    category: Mapped[str | None] = mapped_column(String(50), index=True)
    color: Mapped[str | None] = mapped_column(String(7), default="#808080")  # Hex color

    parent_id: Mapped[uuid_pk | None] = mapped_column(
        ForeignKey("tags.id", ondelete="SET NULL")
    )

    # Relationships
    parent: Mapped["Tag | None"] = relationship(
        "Tag", remote_side="Tag.id", back_populates="subtags"
    )
    subtags: Mapped[list["Tag"]] = relationship("Tag", back_populates="parent")

    todos: Mapped[list["Todo"]] = relationship(
        "Todo", secondary=todo_tags, back_populates="tags"
    )

    @property
    def display_name(self) -> str:
        if self.category:
            return f"{self.category}/{self.name}"
        return self.name
