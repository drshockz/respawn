#!/usr/bin/env bash
set -euo pipefail

source /opt/game.conf

args=(+game "$GAME")
[ -n "$MAP" ] && args+=("$MAP")
args+=(+hostname "$SERVER_NAME")
[ -n "$GSLT_TOKEN" ] && args+=(+net_game_server_token "$GSLT_TOKEN")

if [ -n "$EXTRA_ARGS" ]; then
  read -ra extra <<< "$EXTRA_ARGS"
  args+=("${extra[@]}")
fi

export LD_LIBRARY_PATH="$SERVER_DIR/bin/linuxsteamrt64${LD_LIBRARY_PATH:+:$LD_LIBRARY_PATH}"

exec "./$SERVER_BINARY" "${args[@]}"
