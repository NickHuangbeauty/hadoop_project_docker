FROM centos:latest

MAINTAINER Nick Huang

USER root

ENV JAVA_HOME=/usr/lib/jvm/java-openjdk

ENV PATH=$PATH:$JAVA_HOME/bin:$PATH


# Install OpenJDK
RUN yum update -y && \
    yum install -y java-1.8.0-openjdk-devel wget vim bsdtar&& \
    yum clean all && \
    cp /usr/share/zoneinfo/Asia/Taipei /etc/localtime

CMD ["/bin/bash"]
