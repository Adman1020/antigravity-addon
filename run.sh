#!/usr/bin/bash

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

# We use ttyd to expose a bash shell running antigravity (agy)
# We set it to run bash initially. The user can just type `agy` to start.
# Or we can launch `agy` directly. We'll launch `bash` so the user has a full shell 
# and can run `agy` when they want.
exec ttyd -p 8099 bash
