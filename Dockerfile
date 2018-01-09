FROM gitlab/gitlab-runner:ubuntu

# installing java 8
RUN apt-get update && apt-get install -y software-properties-common && \
  add-apt-repository ppa:openjdk-r/ppa && apt-get update && apt-get install -y openjdk-8-jdk 
# installing sbt
RUN apt-get install -y apt-transport-https && \
  echo "deb http://dl.bintray.com/sbt/debian /" | tee -a /etc/apt/sources.list.d/sbt.list && \
  apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 2EE0EA64E40A89B84B2DF73499E82A75642AC823 && \ 
  apt-get update && apt-get install -y sbt && update-ca-certificates -f
  
# installing ansible
RUN apt-add-repository -y ppa:ansible/ansible && sudo apt-get update && \
  apt-get install -y ansible

RUN echo "gitlab-runner ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers

ENTRYPOINT ["/usr/bin/dumb-init", "/entrypoint"]
CMD ["run", "--user=gitlab-runner", "--working-directory=/home/gitlab-runner"]
