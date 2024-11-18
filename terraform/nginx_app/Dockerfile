FROM python:3.9-slim

# Set working directory
WORKDIR /app

# Install Flask and any dependencies
COPY requirements.txt ./ 
RUN pip install --no-cache-dir -r requirements.txt

# Copy application code
COPY . .

# Expose the port that Flask will run on
EXPOSE 5000

# Start Flask app
CMD ["python", "app.py"]
