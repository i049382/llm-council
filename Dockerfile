FROM python:3.11-slim

WORKDIR /app

COPY . .

RUN pip install --no-cache-dir -U pip \
 && pip install --no-cache-dir .

ENV PORT=8080

CMD ["python", "server.py"]
