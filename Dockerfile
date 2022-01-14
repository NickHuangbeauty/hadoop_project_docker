FROM ubuntu:latest

MAINTAINER Nick Huang

USER root

ENV JAVA_HOME=/usr/lib/jvm/java-openjdk

ENV PATH=$PATH:$JAVA_HOME/bin:$PATH


# Install OpenJDK
RUN apt-get update && \
    apt-get install -y \
	openjdk-8-jre \ 
	curl \
	vim \
	libarchive-tools && \
    apt-get clean && \
    cp /usr/share/zoneinfo/Asia/Taipei /etc/localtime

CMD ["/bin/bash"]
