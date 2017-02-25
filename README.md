[![Build Status](https://travis-ci.org/scorputty/plexpy.svg?branch=master)](https://travis-ci.org/scorputty/plexpy) [![](https://images.microbadger.com/badges/image/cryptout/plexpy.svg)](https://microbadger.com/images/cryptout/plexpy "Get your own image badge on microbadger.com") [![](https://images.microbadger.com/badges/version/cryptout/plexpy.svg)](https://microbadger.com/images/cryptout/plexpy "Get your own version badge on microbadger.com")

# Docker plexpy (Alpine)

This is a Dockerfile to build "plexpy" - (https://github.com/JonnyWong16/plexpy/).

### Docker Hub
The built image is also hosted at Docker Hub - (https://hub.docker.com/r/cryptout/plexpy/).

# Build from Dockerfile
Clone this repository and run the build.sh script.
```sh
git clone https://github.com/scorputty/plexpy.git
cd plexpy
./build.sh
```

# Docker compose example
```
plexpy:
  container_name: plexpy
  image: docker.io/cryptout/plexpy
  hostname: plexpy
  network_mode: host
  environment:
    - TZ=Europe/Amsterdam
    - USER=media
    - USERID=10000
    - PUID=10000
    - PGID=10000
    - ENV appUser=media
    - ENV appGroup=media
  volumes:
    - /share:/share
```

### WebGUI
To reach the WebGUI go to - (http://localhost:8181).
Or replace localhost with your target IP.

## Info
* Shell access whilst the container is running: `docker exec -it plexpy /bin/sh`
* To monitor the logs of the container in realtime: `docker logs -f plexpy`


# Notes
I'm still learning Docker and use these private (pet)projects to develop my skills.
While I use these containers myself they are by no means perfect and are always prone to error or change.
That said, even if only one person copies a snippet of code or learns something from my projects I feel I've contributed a little bit to the Open-source cause...
