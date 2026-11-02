FROM cm2network/steamcmd:root-trixie

RUN apt-get update \
 && apt-get install -y --no-install-recommends gosu \
 && rm -rf /var/lib/apt/lists/*

RUN gosu steam /home/steam/steamcmd/steamcmd.sh +quit

ENV PUID=1000 \
    PGID=1000 \
    SERVER_DIR=/data \
    STEAM_BRANCH="" \
    AUTO_UPDATE=1

COPY --chmod=755 entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
