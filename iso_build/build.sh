#!/usr/bin/env bash

set -euo pipefail

function finish {
  set +e
  docker kill nixos-arm-builder > /dev/null
  docker rm nixos-arm-builder > /dev/null
}
trap finish EXIT

docker build -t nixos-arm-builder .
docker run --name nixos-arm-builder --detach nixos-arm-builder sleep 10m > /dev/null
docker cp nixos-arm-builder:/tmp/nixos.iso .
