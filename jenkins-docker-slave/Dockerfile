FROM centos:centos7
MAINTAINER ome-devel@lists.openmicroscopy.org.uk

RUN yum install -y openssh-server sudo docker &&\
	yum clean all

RUN sed -i -re s'/(session\s+)required(\s+pam_loginuid.so)/\1optional\2/' \
	/etc/pam.d/sshd

RUN useradd hudson && \
	echo "hudson ALL=NOPASSWD: ALL" > /etc/sudoers.d/hudson

ADD ssh_host_rsa_key /etc/ssh/
ADD ssh_host_dsa_key /etc/ssh/

USER hudson
RUN mkdir /home/hudson/.ssh && chmod 700 /home/hudson/.ssh
ADD hudson_id_rsa.pub /home/hudson/.ssh/authorized_keys

USER root
EXPOSE 22
CMD /usr/sbin/sshd -De
