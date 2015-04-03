FROM centos:centos7
MAINTAINER Simon Li "spli@dundee.ac.uk"

ENV RUNDECK_RELEASE 2.4.2-1.3.GA
# RUN yum -y install http://rundeck.org/latest.rpm && yum -y install rundeck
RUN yum -y install java-1.7.0-openjdk && \
	yum -y install \
	http://download.rundeck.org/rpm/rundeck-${RUNDECK_RELEASE}.noarch.rpm \
	http://download.rundeck.org/rpm/rundeck-config-${RUNDECK_RELEASE}.noarch.rpm && \
	yum clean all

RUN yum -y install sudo && \
	yum clean all && \
	echo 'rundeck ALL= (ALL) NOPASSWD: ALL' > /etc/sudoers.d/rundeck && \
	chmod 440 /etc/sudoers.d/rundeck

RUN mkdir -p /rundeck/data /rundeck/projects /rundeck/logs /rundeck/ssh && \
	chown rundeck:rundeck /rundeck/*

USER rundeck

RUN sed -i \
	-e 's|/var/lib/rundeck/data|/rundeck/data|' \
	-e 's|/var/rundeck/projects|/rundeck/projects|' \
	-e 's|/var/lib/rundeck/logs|/rundeck/logs|' \
	-e 's|/var/lib/rundeck/.ssh/id_rsa|/rundeck/ssh/id_rsa|' \
	/etc/rundeck/profile \
	/etc/rundeck/framework.properties && \
	sed -i -re 's|#(.*-Drundeck.ssl.config)|\1|' /etc/rundeck/profile

RUN keytool -keystore /etc/rundeck/ssl/keystore -alias rundeck -genkey \
	-keyalg RSA -keypass adminadmin -storepass adminadmin \
	-dname "cn=localhost, o=OME, c=UK" && \
	cp /etc/rundeck/ssl/keystore /etc/rundeck/ssl/truststore && \
	mv /var/lib/rundeck/.ssh/id_rsa* /rundeck/ssh/

ADD run.sh /

VOLUME ["/etc/rundeck", "/rundeck"]

EXPOSE 4440 4443

CMD /run.sh
