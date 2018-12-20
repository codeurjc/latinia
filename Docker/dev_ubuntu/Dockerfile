FROM ubuntu:16.04

RUN apt-get update && \
    apt-get install -y \
    apt-transport-https \
    ca-certificates \
    curl \
    software-properties-common \ 
    git \
    curl \
    jq \
    subversion

# Install docker
RUN curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add - && \
    add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu xenial stable" && \
    apt-get update && \
    apt-get install -y docker-ce

# Install Java
COPY jdk-8u131-linux-x64.tar.gz /tmp/jdk-8u131-linux-x64.tar.gz
RUN tar zxf /tmp/jdk-8u131-linux-x64.tar.gz -C /usr/src

# Install MAVEN
RUN wget https://archive.apache.org/dist/maven/maven-3/3.5.0/binaries/apache-maven-3.5.0-bin.tar.gz -O /tmp/apache-maven-3.5.0-bin.tar.gz
RUN tar zxf /tmp/apache-maven-3.5.0-bin.tar.gz -C /usr/src/    
