from enum import Enum
from typing import TYPE_CHECKING, Any

if TYPE_CHECKING:
    from src.models.user import User

from sqlalchemy import JSON, ForeignKey, String
from sqlalchemy import Enum as SAEnum
from sqlalchemy.orm import Mapped, mapped_column, relationship

from src.core.database import Base, TimestampMixin, uuid_pk


class PluginType(str, Enum):
    GITHUB = "github"
    MS_TODO = "ms_todo"
    FLAGGED_EMAILS = "flagged_emails"
    FRAPPE = "frappe"


class PluginConfig(Base, TimestampMixin):
    __tablename__ = "plugin_configs"

    id: Mapped[uuid_pk]
    user_id: Mapped[uuid_pk] = mapped_column(ForeignKey("users.id", ondelete="CASCADE"))
    plugin_type: Mapped[PluginType] = mapped_column(SAEnum(PluginType))

    # Store credentials, tokens, etc. in a secure way (or JSON for now)
    # In a real app, sensitive fields should be encrypted
    config_data: Mapped[dict[str, Any]] = mapped_column(JSON, default=dict)

    is_enabled: Mapped[bool] = mapped_column(default=True)

    user: Mapped["User"] = relationship(back_populates="plugin_configs")
