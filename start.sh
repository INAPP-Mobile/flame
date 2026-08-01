#!/bin/sh
set -e

# Railway runtime wrapper for Flame:
# 1. Ensure the data directory is writable by the non-root node user
#    (Railway volumes are created root-owned; the node user can't write without this).
mkdir -p /app/data
chown -R node:node /app/data 2>/dev/null || true

# 2. Start the Flame server.
#    server.js honors process.env.PORT (Railway injects this).
exec node server.js
