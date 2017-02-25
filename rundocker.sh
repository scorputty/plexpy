#!/usr/bin/env bash

# edit for your situation (config/plexpy should be there)
VOL_SHARE="/Volumes/shares/docker/"

test -d ${VOL_SHARE} || VOL_SHARE="${PWD}${VOL_SHARE}" && mkdir -p ${VOL_SHARE}/config/plexpy

docker run -d -h $(hostname) \
    -p 8181:8181 \
    -v ${VOL_SHARE}:/share \
    -e TZ="Europe/Amsterdam" \
    -e appUser="media" \
    -e appGroup="media" \
    -e PUID="10000" \
    -e PGID="10000" \
    --name=plexpy --restart=always cryptout/plexpy

  # for troubleshooting run
  # docker exec -it plexpy /bin/bash
  # to check logs run
  # docker logs -f plexpy
