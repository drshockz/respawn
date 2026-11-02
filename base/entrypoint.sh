#!/usr/bin/env bash
set -euo pipefail

log() { echo "[entrypoint] $*"; }

[ -f /opt/game.conf ] || { log "/opt/game.conf missing: the game image must provide it"; exit 1; }
source /opt/game.conf
: "${APP_ID:?APP_ID must be set in /opt/game.conf}"

# ---- Root pass ----
if [ "$(id -u)" = "0" ]; then
  [ "$(id -g steam)" = "$PGID" ] || groupmod -o -g "$PGID" steam
  [ "$(id -u steam)" = "$PUID" ] || usermod  -o -u "$PUID" steam
  mkdir -p "$SERVER_DIR"
  [ "$(stat -c %u "$SERVER_DIR")" = "$PUID" ] || chown -R -h steam:steam "$SERVER_DIR"
  exec gosu steam "$0" "$@"
fi

# ---- Update ----
if [ "$AUTO_UPDATE" = "1" ] || [ -z "$(ls -A "$SERVER_DIR")" ]; then
  update=(+force_install_dir "$SERVER_DIR" +login anonymous +app_update "$APP_ID")
  [ -n "$STEAM_BRANCH" ] && update+=(-beta "$STEAM_BRANCH")
  update+=(+quit)

  for attempt in 1 2 3; do
    log "updating app $APP_ID (attempt $attempt/3)"
    /home/steam/steamcmd/steamcmd.sh "${update[@]}" && break
    sleep 5
  done
fi

# ---- Hand off to the game ----
cd "$SERVER_DIR"
exec /opt/game.sh "$@"
