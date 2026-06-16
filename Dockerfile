# ── CafeFlow – QR Café Ordering ──
# Lightweight nginx image to serve the single-page app
FROM nginx:alpine

# Remove default nginx page
RUN rm -rf /usr/share/nginx/html/*

# Copy the app
COPY index.html /usr/share/nginx/html/index.html

# Optional: custom nginx config for SPA (serves index.html for all routes)
COPY nginx.conf /etc/nginx/conf.d/default.conf

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]
