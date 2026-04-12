from datetime import timedelta
from src.core import security

def test_password_hashing():
    password = "secret_password"
    hashed = security.get_password_hash(password)
    assert hashed != password
    assert security.verify_password(password, hashed) is True
    assert security.verify_password("wrong_password", hashed) is False

def test_jwt_tokens():
    subject = "user_id_123"
    access_token = security.create_access_token(subject)
    refresh_token = security.create_refresh_token(subject)
    
    assert access_token is not None
    assert refresh_token is not None
    
    decoded_access = security.decode_token(access_token)
    assert decoded_access["sub"] == subject
    assert decoded_access["type"] == "access"
    
    decoded_refresh = security.decode_token(refresh_token)
    assert decoded_refresh["sub"] == subject
    assert decoded_refresh["type"] == "refresh"

def test_token_expiry():
    subject = "user_id_456"
    expires = timedelta(minutes=5)
    token = security.create_access_token(subject, expires_delta=expires)
    decoded = security.decode_token(token)
    assert decoded["sub"] == subject
