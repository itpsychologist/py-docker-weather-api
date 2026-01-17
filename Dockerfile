# Use slim Python image for minimal size
FROM python:3.11-slim
LABEL maintainer="devpsychologist"

ENV PYTHONUNBUFFERED=1

# Set working directory
WORKDIR /app

# Copy requirements first for better caching
COPY docker_requirements.txt requirements.txt

# Install dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Copy application code
COPY app/ ./app/

# Run the application
CMD ["python", "app/main.py"]