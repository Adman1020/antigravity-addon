#!/usr/bin/with-contenv bash

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
# Generate the Antigravity configuration file dynamically
AGY_CONF_DIR="/root/.gemini/antigravity-cli"
mkdir -p "$AGY_CONF_DIR"

cat <<EOF > "$AGY_CONF_DIR/settings.json"
{
  "mcpServers": {
    "homeassistant": {
      "command": "/usr/local/bin/uvx",
      "args": ["ha-mcp"],
      "env": {
        "HA_URL": "$HA_URL",
        "HA_TOKEN": "$HA_TOKEN"
      }
    }
  }
}
EOF
# We use ttyd to expose the terminal. We launch agy directly and ensure HOME is defined.
exec ttyd -W -p 8099 env HOME=/root /root/.local/bin/agy
