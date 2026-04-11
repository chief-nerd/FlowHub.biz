from fastapi import FastAPI

app = FastAPI(title="FlowHub API")

@app.get("/")
async def root():
    return {"message": "FlowHub API is running"}

@app.get("/health")
async def health():
    return {"status": "healthy"}
