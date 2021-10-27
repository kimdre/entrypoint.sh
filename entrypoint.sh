#!/bin/sh
set -e

trap "echo Exiting...; exit 0" EXIT TERM

STARTUP_COMMAND="java Xmx2G -jar app.jar"  # Command that you specified in your Dockerfile as 'CMD' 
BASE_DIR="/app"  # Base directory of your containerized app

if [[ "$*" == "$STARTUP_COMMAND" ]]; then

  if ! [ -d "$BASE_DIR" ]; then
    echo "Error: $BASE_DIR is missing. Exiting..."
    exit 1
  fi

  cd "$BASE_DIR"

  echo "Starting app..."
  
  exec "$@"
fi

exec "$@"
