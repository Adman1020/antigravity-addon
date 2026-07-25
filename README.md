# Antigravity Home Assistant Add-on

**Note: This is a vibe coded project with Antigravity** ✨

This repository contains a custom Home Assistant Add-on that allows you to run the Google Antigravity AI assistant directly within your Home Assistant interface.

It provides a web-based terminal (via `ttyd`) running the `agy` CLI, which you can access natively via Home Assistant Ingress (the sidebar), from both the web interface and the mobile app.

## Features
- **Native Ingress Support**: Appears in your Home Assistant sidebar.
- **Antigravity CLI**: Full access to Antigravity inside Home Assistant.
- **Home Assistant API Access**: Antigravity is configured to communicate with your local Home Assistant instance.

## Installation
1. Go to your Home Assistant UI -> **Settings** -> **Add-ons** -> **Add-on Store**.
2. Click the three dots in the top right corner and select **Repositories**.
3. Add the URL of this repository.
4. Refresh the Add-on store page.
5. Search for "Antigravity" and click **Install**.
6. Once installed, toggle **Show in sidebar** and start the add-on.

## Development
This add-on uses `ttyd` to serve the terminal. To test locally on Windows/Linux:
```bash
docker build -t antigravity-addon .
docker run -p 8099:8099 antigravity-addon
```
Then navigate to `http://localhost:8099`.
