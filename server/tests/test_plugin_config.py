import uuid

from src.models.plugin_config import PluginConfig, PluginType
from src.models.user import User


def test_plugin_config_model():
    user_id = uuid.uuid4()
    config = PluginConfig(
        user_id=user_id,
        plugin_type=PluginType.GITHUB,
        config_data={"token": "gh_secret_token"},
        is_enabled=True,
    )

    assert config.plugin_type == PluginType.GITHUB
    assert config.config_data["token"] == "gh_secret_token"
    assert config.user_id == user_id
    assert config.is_enabled is True
