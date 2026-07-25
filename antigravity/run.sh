#!/usr/bin/with-contenv bashio

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
# Generate global rules to provide context to Antigravity
AGY_CONF_DIR="/root/.gemini/antigravity"
mkdir -p "$AGY_CONF_DIR"

cat <<EOF > "$AGY_CONF_DIR/rules.md"
# Home Assistant Context

You are running as a native Add-on inside the user's Home Assistant server!
Your primary purpose is to help the user manage, configure, and troubleshoot their smart home environment.

The user's Home Assistant MCP server tools are synced to you. Always prioritize using these tools to interact with Home Assistant (e.g., getting entities, managing add-ons, checking logs, calling services).

Be incredibly helpful, proactive, and aware that you are running natively on their Home Assistant instance.
EOF

# We use ttyd to expose the terminal. We launch agy directly and ensure HOME is defined.
exec ttyd -W -p 8099 env HOME=/root /root/.local/bin/agy
