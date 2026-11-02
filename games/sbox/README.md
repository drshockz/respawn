# s&box server

`aydndev/sbox-server`. See the [main README](../../README.md) for common
settings like `PUID` and `AUTO_UPDATE`.

## Quick start

    services:
      sbox:
        image: aydndev/sbox-server:latest
        environment:
          SERVER_NAME: "My s&box Server"
          GSLT_TOKEN: ${GSLT_TOKEN}
        volumes:
          - ./data:/data

## Settings

| Variable | Default | Description |
| --- | --- | --- |
| `GAME` | `facepunch.sandbox` | Game package to load |
| `MAP` | | Map package. Leave empty for the game's default |
| `SERVER_NAME` | `s&box Server` | Name in the server list |
| `GSLT_TOKEN` | | Steam game server token. Needed for players to join |
| `EXTRA_ARGS` | | Extra launch arguments, e.g. `+sf_cv_botcount 8` |

## Networking

Connections go through Steam's relay. No ports need forwarding.

## Notes

- Get a GSLT at steamcommunity.com/dev/managegameservers, with app ID 590830.
- Game convars: run `find <name>` in the server console.
