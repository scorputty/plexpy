FROM alpine:edge
MAINTAINER scorputty
LABEL Description="PlexPy" Vendor="Stef Corputty" Version="0.0.1"

# variables
ENV TZ="Europe/Amsterdam"
ENV appUser="media"
ENV appGroup="media"
ENV PUID="10000"
ENV PGID="10000"

# ports should be mapped with the run command to match your situation
EXPOSE 8181

# copy the start script and config to the container
COPY start.sh /start.sh

# create /opt/plexpy
RUN mkdir -p /opt/plexpy

# install runtime packages
RUN \
 apk --update add --no-cache \
       ca-certificates \
       bash \
       su-exec \
       py2-pip \
       git \
       python \
       py-libxml2 \
       py-lxml \
       openssl-dev \
       libffi-dev \
       unrar \
       tzdata && \

# update certificates
 update-ca-certificates && \

# install pip packages
 pip install --upgrade pip && \
 pip install --no-cache-dir -U \
       setuptools && \
 pip install --no-cache-dir -U \
       pyopenssl cryptography cheetah mako lockfile ndg-httpsclient notify pyasn1 requirements tzlocal && \

# get plexpy and update is now in start.sh
 git clone --depth 1  https://github.com/drzoidberg33/plexpy.git /opt/plexpy && \

# cleanup
 cd / && \
 apk del --purge && \

 rm -rf \
       /var/cache/apk/* \
       /tmp/*

# user with access to media files and config
RUN addgroup -g ${PGID} ${appGroup} && \
 adduser -G ${appGroup} -D -u ${PUID} ${appUser}

# create dir to be mounted over by volume
RUN mkdir -p /share/config/plexpy && touch /share/config/plexpy/tag.txt

# set owner
RUN chown -R ${appUser}:${appGroup} /start.sh /opt/plexpy /share

# make sure start.sh is executable
RUN chmod u+x  /start.sh

# switch to App user
USER ${appUser}

# single mounted shared volume
VOLUME ["/share"]

# start application
CMD ["/start.sh"]
