# Use Python 3.11 slim image
FROM python:3.11-slim

# Set working directory
WORKDIR /app

# Install system dependencies
RUN apt-get update && apt-get install -y \
    gcc \
    g++ \
    && rm -rf /var/lib/apt/lists/*

# Copy requirements first for better caching
COPY requirements.txt .

# Install Python dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Copy the entire project
COPY . .

# Create necessary directories
RUN mkdir -p server/__pycache__

# Set environment variables
ENV PYTHONPATH=/app
ENV FLASK_APP=server/proxy.py
ENV FLASK_ENV=production

# Expose port
EXPOSE 5000

# Change to server directory and start the application
WORKDIR /app/server
CMD ["python", "proxy.py"]
