from fastapi import FastAPI
from src.api.v1.api import api_router

app = FastAPI(title="FlowHub API")

app.include_router(api_router, prefix="/api/v1")

@app.get("/")
async def root():
    return {"message": "FlowHub API is running"}

@app.get("/health")
async def health():
    return {"status": "healthy"}
