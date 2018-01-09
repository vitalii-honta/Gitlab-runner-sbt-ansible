# Gitlab runner & sbt & ansible
Docker image for gitlab runnner with installed sbt and ansible 
for gitlab-ci pipeline

# About
Image is designed to run scala-specific gitlab pipeline
```bash
sbt test # test
sbt docker:publish # build and publish docker image
ansible-playbook $FILE # deploy service to docker(swarm) or kubernetes
```
It Has installed out-of-the box:
 - sbt
 - ansible 
 - docker (can be used with mounted '/var/run/docker.sock')
 
# Run
```bash
docker run -d --name gitlab-runner --restart always   -v /var/run/docker.sock:/var/run/docker.sock   -v /srv/gitlab-runner/config:/etc/gitlab-runner vitaliyhonta/gitlab-runner-sbt-ansible:latest
```
