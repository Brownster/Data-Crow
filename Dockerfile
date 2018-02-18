FROM java:8-jdk

ENV LC_ALL=C.UTF-8

RUN true \
 && apt-get update \
 && apt-get upgrade -y -o Dpkg::Options::="--force-confold" \
 && apt-get install -y libfontconfig1 unzip ttf-dejavu --no-install-recommends \
 && apt-get clean \
 && rm -rf /tmp/* \
 && rm -rf /var/tmp/* \
 && for logs in `find /var/log -type f`; do > $logs; done \
 && rm -rf /usr/share/locale/* \
 && rm -rf /usr/share/man/* \
 && rm -rf /usr/share/doc/* \
 && rm -rf /var/lib/apt/lists/*
 && mkdir /src \
 && cd /src
ADD datacrow_4_2_2_server_zipped /src/dc-server/

EXPOSE 80 9000 9001

#ENTRYPOINT [FIXME
CMD [ "java" "-Xmx512m" "-jar" "/src/dc-server/datacrow-server.jar" "-userdir:/src" "-webserverport:80" ]
