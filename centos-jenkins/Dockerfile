FROM centos
MAINTAINER Simon Li "spli@dundee.ac.uk"

RUN yum -y install java-1.7.0-openjdk
ADD http://pkg.jenkins-ci.org/redhat/jenkins.repo /etc/yum.repos.d/jenkins.repo
RUN rpm --import http://pkg.jenkins-ci.org/redhat/jenkins-ci.org.key
RUN yum -y install jenkins

EXPOSE 8080
CMD service jenkins start

