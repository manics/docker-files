FROM centos:centos6
MAINTAINER Simon Li "spli@dundee.ac.uk"

ENV RUNDECK_RELEASE 2.4.2-1.3.GA
# RUN yum -y install http://rundeck.org/latest.rpm && yum -y install rundeck
RUN yum -y install java-1.7.0-openjdk && \
	yum -y install \
	http://download.rundeck.org/rpm/rundeck-${RUNDECK_RELEASE}.noarch.rpm \
	http://download.rundeck.org/rpm/rundeck-config-${RUNDECK_RELEASE}.noarch.rpm && \
	yum clean all

ADD run.sh /

#USER rundeck

VOLUME /config
EXPOSE 4440 4443
CMD runuser -s /bin/bash -l rundeck -c /run.sh
