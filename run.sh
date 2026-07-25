#!/usr/bin/env bash

echo "Starting Antigravity Home Assistant Add-on..."

# If testing locally, SUPERVISOR_TOKEN won't be set. 
# In HA, SUPERVISOR_TOKEN is injected by the host.
if [ -z "$SUPERVISOR_TOKEN" ]; then
  echo "Running in local testing mode (no HA Supervisor Token found)."
else
  echo "Connected to Home Assistant Supervisor."
  export HA_URL="http://supervisor/core"
  export HA_TOKEN="$SUPERVISOR_TOKEN"
fi

# We use ttyd to expose the terminal. We launch agy directly.
exec ttyd -p 8099 /root/.local/bin/agy
