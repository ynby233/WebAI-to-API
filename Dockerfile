FROM python:3.11-slim

# Install Requirements
WORKDIR /app
ENV PYTHONUNBUFFERED=1 \
    PYTHONDONTWRITEBYTECODE=1 \
    PYTHONPATH=/app/src \
    ENVIRONMENT=production
COPY requirements.txt .
RUN pip install --upgrade pip
RUN pip install --no-cache-dir "pydantic~=2.12.5" -r requirements.txt

# Copy project files
COPY . .

# Default Port 
EXPOSE 6969

# Run Uvicorn server
CMD ["uvicorn", "app.main:app", "--host", "0.0.0.0", "--port", "6969"]
