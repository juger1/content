# Use Python 3.11 as the base image
FROM python:3.11

# Install system dependencies
RUN apt-get update && apt-get install -y --no-install-recommends git && \
    rm -rf /var/lib/apt/lists/*

# Upgrade pip to the latest version
RUN pip3 install --upgrade pip

# Set the working directory
WORKDIR /app

# Copy the requirements first to leverage Docker layer caching
COPY requirements.txt .

# Install Python dependencies
RUN pip3 install --no-cache-dir -r requirements.txt

# Copy the application files into the container
COPY . .

# Expose the port the app runs on
EXPOSE 8080  # Replace with your actual port if different

# Run your application
CMD ["python3", "main.py"]
