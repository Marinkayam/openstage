#!/bin/bash
# OpenStage launcher (macOS) — double-click to run.
# Keep this Terminal window open while presenting; close it to stop.

cd "$(dirname "$0")" || exit 1
PORT=4321
URL="http://localhost:${PORT}/index.html"

# (Re)start the no-cache server so the latest version always loads.
lsof -ti:${PORT} | xargs kill -9 >/dev/null 2>&1
sleep 1
python3 serve.py >/dev/null 2>&1 &
sleep 1

# Prefer Chrome/Edge (needed to remember files between sessions); fall back to default.
if [ -d "/Applications/Google Chrome.app" ]; then
  open -a "Google Chrome" "$URL"
elif [ -d "/Applications/Microsoft Edge.app" ]; then
  open -a "Microsoft Edge" "$URL"
else
  echo "Tip: open in Chrome or Edge so files are remembered between sessions."
  open "$URL"
fi

echo ""
echo "OpenStage is running: $URL"
echo "Keep this window open while presenting. Close it to stop."
echo ""
wait
