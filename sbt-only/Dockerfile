FROM docker:git

# installing java8
RUN apk update && apk add openjdk8

# installing sbt
ENV sbt_version 1.1.0
ENV sbt_home /usr/local/sbt
ENV PATH ${PATH}:${sbt_home}/bin

# Install sbt
RUN apk add --no-cache bash wget && \
    mkdir -p "$sbt_home" && \
    wget -qO - --no-check-certificate "https://github.com/sbt/sbt/releases/download/v$sbt_version/sbt-$sbt_version.tgz" | tar xz -C $sbt_home --strip-components=1 && \
    apk del wget

# installing ansible
RUN apk add ansible sshpass sudo && \
    echo "gitlab-runner ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers

CMD ["sh"]
