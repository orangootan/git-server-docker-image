FROM ring0club/git:2.13.0-r0
RUN apk add openssh --no-cache
RUN ssh-keygen -A && \
    adduser -D -g 'git' -s /usr/bin/git-shell git && \
    sed --in-place "s/git:!/git:*/" /etc/shadow
COPY git-shell-commands /home/git/git-shell-commands/
VOLUME /home/git /etc/ssh
ENTRYPOINT ["/usr/sbin/sshd", "-D", "-e"]
