#!/usr/bin/env bash
set -euo pipefail
podman build -t docker.io/aydn/steamcmd-base:latest base
podman build -t docker.io/aydn/sbox-server:latest \
  --build-arg BASE=docker.io/aydn/steamcmd-base:latest games/sbox
