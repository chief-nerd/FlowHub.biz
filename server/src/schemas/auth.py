from pydantic import BaseModel, EmailStr, ConfigDict
from uuid import UUID
from datetime import time
from typing import Optional

class UserBase(BaseModel):
    email: EmailStr
    full_name: str
    timezone: str = "UTC"
    afterwork_start_time: time = time(17, 0)

class UserCreate(UserBase):
    password: str

class UserUpdate(BaseModel):
    full_name: Optional[str] = None
    timezone: Optional[str] = None
    afterwork_start_time: Optional[time] = None
    password: Optional[str] = None

class User(UserBase):
    id: UUID
    
    model_config = ConfigDict(from_attributes=True)

class Token(BaseModel):
    access_token: str
    refresh_token: str
    token_type: str = "bearer"

class TokenPayload(BaseModel):
    sub: str
    exp: int
    type: str
