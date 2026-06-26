from fastapi import FastAPI
from app.api.v1.endpoints.employees import router as employee_router
from app.core.config import settings
from app.database.base import Base
from app.database.connection import engine

import app.models

Base.metadata.create_all(bind=engine)

app = FastAPI(
    title=settings.APP_NAME
)

app.include_router(
    employee_router,
    prefix=settings.API_V1_PREFIX,
    tags=["Employees"]
)


@app.get("/")
def root():
    return {
        "message": settings.APP_NAME
    }


@app.get("/health")
def health():
    return {
        "status": "healthy"
    }
