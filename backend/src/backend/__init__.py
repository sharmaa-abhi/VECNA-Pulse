"""
VECNA-Pulse Backend Package.
Exposes the FastAPI application instance for ASGI servers and package imports.
"""
from app.main import app

__all__ = ["app"]
