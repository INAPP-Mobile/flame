# Flame

A self-hosted startpage with a customizable dashboard of apps, bookmarks, and widgets — deployed on Railway.

[![Deploy to Railway](https://railway.app/button.svg)](https://railway.com/deploy/flame-1)

## Why Deploy

Flame is a lightweight, single-container startpage/dashboard that lets you organize bookmarks, apps, and widgets in a beautiful grid. It stores all configuration on a single persistent volume — no external database or multi-service stack required. Deploy in under two minutes and your dashboard layout survives restarts and redeploys.

## Features

- Customizable dashboard with bookmarks and self-hosted apps
- Built-in search bar with support for multiple search engines
- 15+ built-in color themes, plus a custom theme builder
- Docker label integration for auto-discovering containerized apps
- Optional weather widget, to-do widget, and RSS widget
- Password-protected admin panel for configuration
- Responsive design that works on desktop and mobile

## Configuration

| Variable | Description | Default |
|---|---|---|
| `PORT` | HTTP listen port (auto-injected by Railway) | `5005` |
| `PASSWORD` | Admin panel password | `change_me` |

## Volumes

- `/app/data` — Persistent stored configuration (settings, bookmarks, app layout, pinned apps)

Note: Railway allows one volume per service; sessions use ephemeral `/tmp` and are reset on redeploy (configuration data is unaffected).

## License

MIT — [Flame on GitHub](https://github.com/pawelmalak/flame)

## Deploy and Host

Click the Deploy to Railway button above to deploy Flame on Railway. Persistent volumes are configured automatically so your dashboard layout survives redeployments.

## About Hosting

This template runs Flame on Railway, a cloud platform that handles infrastructure, scaling, and HTTPS. All dashboard configuration data is stored on a persistent volume for durability. Railway provides automatic TLS termination and private networking between services.

## Common Use Cases

- Personal startpage / homepage replacement
- Team dashboard for self-hosted app links
- Bookmark hub organized by category and tags
- Developer workflow dashboard with quick-access apps

## Dependencies for

- Flame — Node.js/Express startpage application
- No database companion required — all data is stored on persistent volumes

### Deployment Dependencies

| Dependency | Description |
|---|---|
| Persistent volume `/app/data` | Stored configuration, bookmarks, app layout |
| Railway account | Must have access to a single service |

## Quick Start

1. Click the Deploy to Railway button above
2. Wait for the build to complete (~2 minutes)
3. Access Flame at the deployed URL
4. Enter the admin password (set `PASSWORD` env var) to customize your dashboard
