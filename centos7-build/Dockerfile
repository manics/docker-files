FROM centos:centos7
MAINTAINER spli@dundee.ac.uk

RUN yum -y install @development
RUN yum -y install yum-utils createrepo
RUN useradd build

USER build
WORKDIR /home/build
RUN mkdir -p rpmbuild/{BUILD,RPMS,SOURCES,SPECS,SRPMS} && \
	echo '%_topdir /home/build/rpmbuild' > .rpmmacros

USER root
# So that build-deps can be installed
