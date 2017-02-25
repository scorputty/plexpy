#!/bin/sh

set -e

# /share/config maps to nfs share home-server/config
test -d /share/config/plexpy || exit 1

cd /opt/plexpy

# get latest git data
git pull origin

# start plexpy
/usr/bin/python PlexPy.py --nolaunch --datadir=/share/config/plexpy
