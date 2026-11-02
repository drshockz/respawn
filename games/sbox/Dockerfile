FROM aydn/steamcmd-base:latest

RUN apt-get update \
 && apt-get install -y --no-install-recommends \
      libfontconfig1 libfreetype6 fonts-dejavu-core \
 && rm -rf /var/lib/apt/lists/*

ENV SERVER_NAME="s&box Server" \
	GAME=facepunch.sandbox \
	MAP="" \
	GSLT_TOKEN="" \
	EXTRA_ARGS=""

COPY game.conf /opt/game.conf
COPY --chmod=755 game.sh /opt/game.sh
