FROM centos:centos7
MAINTAINER Simon Li "spli@dundee.ac.uk"

# http://caffe.berkeleyvision.org/installation.html
# http://caffe.berkeleyvision.org/install_yum.html

RUN yum -y install epel-release && \
	yum -y install tar unzip gcc gcc-c++ make bc && \
	yum -y install protobuf-devel leveldb-devel snappy-devel \
	opencv-devel boost-devel hdf5-devel \
	gflags-devel glog-devel lmdb-devel \
	atlas-devel atlas-static blas-devel blas-static

RUN yum -y install python-devel \
	Cython numpy scipy python-matplotlib ipython h5py \
	python-networkx python-nose python-dateutil protobuf-python PyYAML \
	python-pillow

# Not available as rpm
RUN yum -y install python-pip && \
	pip install scikit-image leveldb pandas python-gflags

RUN mkdir /src && cd /src && \
	curl -L https://github.com/BVLC/caffe/archive/master.zip > \
	caffe-master.zip && \
	unzip caffe-master.zip

WORKDIR /src/caffe-master
RUN sed -r -e 's/# CPU_ONLY .+/CPU_ONLY := 1/' \
	-e 's|# BLAS_LIB := /path/to/your/blas|BLAS_LIB := /usr/lib64/atlas|' \
	Makefile.config.example > Makefile.config && \
	sed -i.bak -re \
	's/LIBRARIES \+= cblas atlas/LIBRARIES += satlas tatlas atlas/' \
	Makefile
RUN make all pycaffe && make distribute


ENV LD_LIBRARY_PATH /src/caffe-master/distribute/lib
ENV PYTHONPATH /src/caffe-master/distribute/python

VOLUME ["/deepdream"]

#CMD bash

