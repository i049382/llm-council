FROM python:3.11-slim

WORKDIR /app

# System deps (often needed)
RUN apt-get update && apt-get install -y curl && rm -rf /var/lib/apt/lists/*

COPY . .

# Install Python deps via pyproject
RUN pip install --no-cache-dir -U pip \
 && pip install --no-cache-dir -r backend/requirements.txt || true

# Make start script executable
RUN chmod +x start.sh

ENV PORT=8080
EXPOSE 8080

CMD ["./start.sh"]
