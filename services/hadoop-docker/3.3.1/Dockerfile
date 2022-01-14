FROM ubuntu-jdk

MAINTAINER Nick Huang

USER root

# Setting ENV for Hadoop, Share Library and PATH 
ENV HADOOP_HOME=/root/hadoop
ENV HADOOP_CONF_DIR=$HADOOP_HOME/etc/hadoop
ENV LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$HADOOP_HOME/lib/native/:/root/protobuf/lib
ENV PATH=$PATH:/root/protobuf/bin:$HADOOP_HOME/bin:$HADOOP_HOME/sbin:.


# 1. Install OpenSSH, OpenSSL, bzip2-devel
RUN apt-get install -y \
	openssh-server \
	openssh-client \
	openssl && \
    apt-get clean && \
    ssh-keygen -t rsa -f ~/.ssh/id_rsa -P '' && \
    cat ~/.ssh/id_rsa.pub >> ~/.ssh/authorized_keys

ADD config/other/ssh_config /root/.ssh/config
RUN chmod 600 /root/.ssh/config && \
    # Reference: https://blog.gtwang.org/linux/linux-chown-command-tutorial/
    # Change owner
    chown root:root /root/.ssh/config

# Install Protocol Buffer, Hadoop
RUN curl https://github.com/NickHuangbeauty/hadoop_project_docker/blob/14c552715c3998097b40b9bdbb9e0c3c804c5ce3/source_hadoop_ecosystem/hadoop-3.3.1.tar.gz && \
    tar -xvf hadoop-3.3.1.tar.gz -C /root/ && \
    mv /root/hadoop-3.3.1 $HADOOP_HOME && \
    rm -rf hadoop-3.3.1.tar.gz && \
    rm -rf $HADOOP_HOME/bin/*.cmd && \
    rm -rf $HADOOP_HOME/sbin/*.cmd && \
    rm -rf $HADOOP_HOME/sbin/*all* && \
    rm -rf $HADOOP_CONF_DIR/*.cmd && \
    rm -rf $HADOOP_CONF_DIR/*.template && \
    rm -rf $HADOOP_CONF_DIR/*.example && \
    curl https://github.com/NickHuangbeauty/hadoop_project_docker/blob/14c552715c3998097b40b9bdbb9e0c3c804c5ce3/source_hadoop_ecosystem/protobuf-all-3.19.3.tar.gz && \
    tar -C /root/ -xvf protobuf-all-3.19.3.tar.gz && \
    rm -rf protobuf-all-3.19.3.tar.gz

# Copy env variables from config/other/bashrc
ADD config/other/bashrc /root/.bashrc

# Copy all Hadoop env variables from config/hadoop/*
ADD config/hadoop/* $HADOOP_HOME/etc/hadoop/


CMD [ "sh", "-c", "service sshd start; bash"]
