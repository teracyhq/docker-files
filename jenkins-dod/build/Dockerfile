FROM teracy/jenkins-dood

LABEL authors="hoatle <hoatle@teracy.com>"

ARG DOCKER_GROUP_ID

USER root

#TODO the group ID for docker group on my Ubuntu is 125, therefore I can only run docker commands if I have same group id inside. 
# Otherwise the socket file is not accessible.
RUN groupadd -g $DOCKER_GROUP_ID docker && usermod -a -G docker jenkins

USER jenkins
