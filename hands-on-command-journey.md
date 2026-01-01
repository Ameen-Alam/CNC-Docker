# Hands-on Command Journey

## 1) Core Docker commands (the “must know” list)

### Help + version

```bash
docker --help
docker version
docker info
```

### Images

```bash
docker images
docker pull python:3.12-slim
docker rmi <image_id>
docker image prune
```

### Containers (run/stop/logs/exec)

```bash
docker ps
docker ps -a

docker run hello-world
docker run --name mybox -it ubuntu:24.04 bash

docker stop mybox
docker start mybox
docker restart mybox
docker rm mybox

docker logs <container>
docker logs -f <container>

docker exec -it <container> bash
```

### Ports + env + naming

```bash
docker run --name api -p 8000:8000 -e ENV=dev python:3.12-slim
```

### Volumes (persistency)

```bash
docker volume ls
docker volume create appdata
docker volume inspect appdata
docker run -v appdata:/data -it ubuntu:24.04 bash
docker volume rm appdata
docker volume prune
```

### Bind mounts (dev workflow)

```bash
docker run -it --rm -v "%cd%":/app -w /app python:3.12-slim bash
# (Linux/Mac: -v "$(pwd)":/app)
```

### Networks (service-to-service)

```bash
docker network ls
docker network create appnet
docker network inspect appnet
docker run -d --name redis --network appnet redis:7
docker run -it --rm --network appnet redis:7 redis-cli -h redis ping
```

### Cleanup (important for students’ laptops 😄)

```bash
docker system df
docker system prune
docker system prune -a --volumes
```

---

## 2) Dockerfile example: FastAPI + uv (production-ready pattern)

> Assumption: you run FastAPI with **uvicorn** (common). If you truly meant “uv” the Python package manager, tell me and I’ll adjust.

### `Dockerfile` (multi-stage, small-ish, prod)

```dockerfile
# ---- base stage ----
FROM python:3.12-slim AS base
WORKDIR /app
ENV PYTHONDONTWRITEBYTECODE=1 \
    PYTHONUNBUFFERED=1

# System deps (adjust if you need build tools)
RUN apt-get update && apt-get install -y --no-install-recommends \
    curl \
  && rm -rf /var/lib/apt/lists/*

# ---- deps stage ----
FROM base AS deps
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# ---- runtime stage ----
FROM base AS runtime
COPY --from=deps /usr/local /usr/local
COPY . .

EXPOSE 8000
CMD ["uvicorn", "app.main:app", "--host=0.0.0.0", "--port=8000"]
```

**Build + run**

```bash
docker build -t fastapi-app:prod .
docker run --rm -p 8000:8000 fastapi-app:prod
```

---

## 3) Dev image vs Prod image (what to teach)

### Development container (hot reload + bind mount)

Run (no Dockerfile required, but you can still use one):

```bash
docker run --rm -it \
  -p 8000:8000 \
  -v "%cd%":/app -w /app \
  python:3.12-slim \
  bash -lc "pip install -r requirements.txt && uvicorn app.main:app --host 0.0.0.0 --port 8000 --reload"
```

**Teaching point:** dev = bind mount + reload + bigger image acceptable.

### Production container (immutable + no reload)

* Copy code into image
* No bind mounts
* Use pinned deps
* Add healthchecks (optional)
* Run as non-root (advanced best practice)

---

## 4) Next.js Dockerfile (production) + dev command

### Prod `Dockerfile` (Next.js)

```dockerfile
FROM node:20-alpine AS deps
WORKDIR /app
COPY package*.json ./
RUN npm ci

FROM node:20-alpine AS build
WORKDIR /app
COPY --from=deps /app/node_modules ./node_modules
COPY . .
RUN npm run build

FROM node:20-alpine AS runtime
WORKDIR /app
ENV NODE_ENV=production
COPY --from=build /app ./
EXPOSE 3000
CMD ["npm", "run", "start"]
```

Dev run (bind mount):

```bash
docker run --rm -it -p 3000:3000 -v "%cd%":/app -w /app node:20-alpine sh -lc "npm i && npm run dev"
```

---

## 5) Docker Compose starter (FastAPI + Next.js + Postgres + Redis)

`docker-compose.yml`

```yaml
services:
  db:
    image: postgres:16
    environment:
      POSTGRES_USER: app
      POSTGRES_PASSWORD: app
      POSTGRES_DB: appdb
    volumes:
      - pgdata:/var/lib/postgresql/data
    ports:
      - "5432:5432"

  redis:
    image: redis:7
    ports:
      - "6379:6379"

  api:
    build: ./api
    environment:
      DATABASE_URL: postgresql://app:app@db:5432/appdb
      REDIS_URL: redis://redis:6379/0
    ports:
      - "8000:8000"
    depends_on:
      - db
      - redis

  web:
    build: ./web
    ports:
      - "3000:3000"
    depends_on:
      - api

volumes:
  pgdata:
```

Compose commands:

```bash
docker compose up -d --build
docker compose ps
docker compose logs -f api
docker compose down
docker compose down -v
```

---

## 6) AI Agents SDK + background tasks + persistency (how to explain in Docker terms)

* **Background tasks** (FastAPI BackgroundTasks / Celery / RQ):
  run as **separate container** (a “worker”) or same container (not recommended for scale).
* **Persistency**: use **volumes** for DB, vector DB, file storage, etc.
* **Networking**: containers talk by **service name** in compose (`db`, `redis`, `api`).

If you want a clean “agents + worker” pattern:

* `api` container (HTTP)
* `worker` container (process jobs)
* `redis` (queue)
* `db` (state)
