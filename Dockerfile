from ring0club/git:2.13.0-r0
RUN apk add openssh
RUN ssh-keygen -A && \
    adduser -D -g 'git' -s /usr/bin/git-shell git && \
    sed --in-place "s/git:!/git:*/" /etc/shadow
COPY git-shell-commands /home/git/git-shell-commands/
RUN chown -R git:git /home/git/git-shell-commands
EXPOSE 22
VOLUME /home/git
ENTRYPOINT ["/usr/sbin/sshd", "-D"]
