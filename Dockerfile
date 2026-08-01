# Flame — self-hosted startpage/dashboard for Railway
# Pin to the exact digest verified healthy on Docker Hub to avoid :latest drift.
FROM pawelmalak/flame@sha256:7a5edc859235486a82871eb624f03048e44f603cba42ea3f60dc7cfe60ca6b3f

# Railway injects PORT (e.g. 8080) and routes to it. Flame's server.js honors
# process.env.PORT, so this is sufficient — no port rebind wrapper needed.
ENV PORT=5005
EXPOSE 5005

# Healthcheck: hit the HTTP root; Railway routes / to the dashboard.
HEALTHCHECK --interval=30s --timeout=5s --start-period=20s --retries=3 \
  CMD wget -q -O /dev/null "http://127.0.0.1:${PORT:-5005}" || exit 1

# The official CMD runs chown then starts the server. We preserve that pattern
# but use a wrapper script for the data-dir permission fix, which is needed
# because Railway volumes are root-owned and node must write to /app/data.
COPY start.sh /usr/local/bin/flame-start.sh
RUN chmod +x /usr/local/bin/flame-start.sh

CMD ["/usr/local/bin/flame-start.sh"]
