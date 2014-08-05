FROM centos
MAINTAINER Simon Li "spli@dundee.ac.uk"

# Install Jenkins and dependencies
RUN yum -y install java-1.7.0-openjdk
#ADD http://pkg.jenkins-ci.org/redhat/jenkins.repo /etc/yum.repos.d/jenkins.repo
#RUN rpm --import http://pkg.jenkins-ci.org/redhat/jenkins-ci.org.key
#RUN yum -y install jenkins

# Disable the service
#RUN chkconfig jenkins off
ADD http://mirrors.jenkins-ci.org/war/latest/jenkins.war /root/jenkins.war
# Run jenkins
EXPOSE 8080
#CMD ["java" "-DJENKINS_HOME=/var/lib/jenkins" "-jar" "/usr/lib/jenkins/jenkins.war" "--logfile=/var/log/jenkins/jenkins.log"]
CMD ["java", "-jar", "/root/jenkins.war"]

