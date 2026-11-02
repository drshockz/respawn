# respawn

Self-hosted Steam game server images, built on SteamCMD.

## Games

| Game | Image | Docs |
| --- | --- | --- |
| s&box | `aydndev/sbox-server` | [games/sbox](games/sbox/README.md) |

## Quick start

1. Pick a game above and copy its `compose.example.yaml`.
2. `docker compose up -d`

The server installs itself into `./data` on first start.

## Common settings

These work with every image.

| Variable | Default | Description |
| --- | --- | --- |
| `PUID` | `1000` | Host user ID that owns the data folder |
| `PGID` | `1000` | Host group ID that owns the data folder |
| `AUTO_UPDATE` | `1` | Update the server on every start |
| `STEAM_BRANCH` | | Steam beta branch, e.g. `staging` |

## Volumes

| Path | Contents |
| --- | --- |
| `/data` | Game server install and saves |

## How it works

One paragraph: root pass, SteamCMD update, game launch.# respawn
