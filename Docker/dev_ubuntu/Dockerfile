FROM ubuntu:16.04

ARG MAVEN_VERSION 
ARG JAVA_PKG 

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && \
    apt-get install -qqy --no-install-recommends \
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
COPY ${JAVA_PKG} /tmp/${JAVA_PKG}
RUN mkdir /usr/src/java
RUN tar zxf /tmp/${JAVA_PKG} -C /usr/src/java --strip-components=1
RUN rm /tmp/${JAVA_PKG}

# Install MAVEN
RUN curl https://archive.apache.org/dist/maven/maven-3/${MAVEN_VERSION}/binaries/apache-maven-${MAVEN_VERSION}-bin.tar.gz -o /tmp/apache-maven-${MAVEN_VERSION}-bin.tar.gz
RUN tar zxf /tmp/apache-maven-${MAVEN_VERSION}-bin.tar.gz -C /usr/src/
RUN rm /tmp/apache-maven-${MAVEN_VERSION}-bin.tar.gz 

ENV PATH=$PATH:/usr/src/java/bin:/usr/src/apache-maven-${MAVEN_VERSION}/bin
