FROM centos:7

RUN curl -L https://packages.gitlab.com/install/repositories/runner/gitlab-runner/script.rpm.sh | bash && \
    yum install -y gitlab-runner

VOLUME ["/etc/gitlab-runner", "/home/gitlab-runner"]

# installing java 8
RUN yum -y install java-1.8.0-openjdk java-1.8.0-openjdk-devel

# installing sbt
RUN curl https://bintray.com/sbt/rpm/rpm | tee /etc/yum.repos.d/bintray-sbt-rpm.repo && \
    yum install -y sbt

# installing ansible
RUN yum install -y epel-release ansible

# allowing to use docker commands with mounted docker.sock
RUN yum install -y yum-utils device-mapper-persistent-data lvm2 && \
  yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo && \
  yum install -y --setopt=obsoletes=0 docker-ce-17.03.1.ce-1.el7.centos docker-ce-selinux-17.03.1.ce-1.el7.centos

# allows to use sudo in .gitlab-ci.yml
RUN yum install -y sudo && \
    echo "gitlab-runner ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers

VOLUME ["/var/run/docker.sock"]
ENTRYPOINT ["gitlab-runner"]
CMD ["run", "--user=gitlab-runner", "--working-directory=/home/gitlab-runner"]