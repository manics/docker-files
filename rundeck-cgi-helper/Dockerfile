FROM python:2
MAINTAINER Simon Li "spli@dundee.ac.uk"

RUN mkdir -p /server/cgi-bin
RUN useradd cgi
RUN pip install dnspython

ADD run.sh /
ADD rundeck-docker-running.py /server/cgi-bin/

USER cgi
WORKDIR /server

EXPOSE 8080
ENTRYPOINT ["/bin/bash", "/run.sh"]
CMD ["8080", "docker.openmicroscopy.org"]
