FROM python:3.11

# Install system dependencies
RUN apt-get update && apt-get install -y --no-install-recommends git && \
    rm -rf /var/lib/apt/lists/*

# Set the working directory
WORKDIR /app

# Copy requirements first to leverage caching
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copy the application files into the container
COPY . .

# Set the default command to run your application
CMD ["python", "main.py"]
