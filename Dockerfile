# Use Ubuntu 24.04 as base (24.06 is not yet released, so use the latest LTS)
FROM ubuntu:24.04

# Set environment variables to avoid interactive prompts
ENV DEBIAN_FRONTEND=noninteractive

# Install system dependencies
RUN apt-get update && \
    apt-get install -y python3 python3-pip python3-venv git && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Set work directory
WORKDIR /app

# Copy project files
COPY . /app

# Install Python dependencies
RUN pip3 install --upgrade pip && \
    pip3 install -r requirements.txt

# Set environment variables for Kedro
ENV PYTHONPATH=/app/src

# Default command to run the Kedro pipeline
CMD ["kedro", "run"]