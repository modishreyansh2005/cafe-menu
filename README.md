# ☕ CafeFlow – Docker Deployment

A QR-based café ordering system packed into a single HTML file, served by nginx in Docker.

## Files

| File | Purpose |
|------|---------|
| `index.html` | The entire CafeFlow app (single-page) |
| `Dockerfile` | Builds an nginx image with the app |
| `nginx.conf` | nginx config with SPA routing, gzip, security headers |
| `docker-compose.yml` | One-command deployment |

---

## Quick Start

### Option A — Docker Compose (recommended)

```bash
# Build and run
docker compose up -d

# View logs
docker compose logs -f

# Stop
docker compose down
```

App is live at **http://localhost**

---

### Option B — Plain Docker

```bash
# Build image
docker build -t cafeflow .

# Run container
docker run -d \
  --name cafeflow \
  -p 80:80 \
  --restart unless-stopped \
  cafeflow
```

---

### Option C — Different port (e.g. 8080)

Edit `docker-compose.yml`:
```yaml
ports:
  - "8080:80"   # host:container
```
Or with plain Docker:
```bash
docker run -d -p 8080:80 --name cafeflow cafeflow
```

---

## QR Codes

1. Open the app → click **⚙ Admin** → password: `cafe123`
2. Go to **QR codes** tab
3. Download a QR for each table and print/place them

Each QR encodes `http://<your-server-ip>/?table=N` — customers scan and land directly on the menu with their table pre-selected.

> **Tip:** Replace `localhost` with your server's IP or domain in the QR tab so the codes work from customer phones.

---

## Admin

| Setting | Value |
|---------|-------|
| Password | `cafe123` |
| Change in | `index.html` → `const ADMIN_PASSWORD='cafe123'` |

---

## Update the App

```bash
# After editing index.html
docker compose up -d --build
```
