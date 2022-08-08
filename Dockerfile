FROM ubuntu:latest

RUN \
    apt-get update && \
    apt-get install -y git openssh-server && \
    rm -rf /var/lib/apt/lists/* && \
    useradd -d /home/git -m -s /usr/bin/git-shell git && \
    su -s /bin/sh git -c ' \
    touch /home/git/.hushlogin \
    '
COPY --chown=git git-shell-commands /home/git/git-shell-commands
VOLUME [ "/home/git" ]

COPY docker-entrypoint.sh /usr/local/bin/
ENTRYPOINT [ "docker-entrypoint.sh" ]
EXPOSE 22 9418
