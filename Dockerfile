FROM docker.gillsoft.org/ubuntu-base

MAINTAINER Ronan Gill <ronan.gill@gillsoft.org>

# RUN echo debconf shared/accepted-oracle-license-v1-1 seen true | debconf-set-selections

RUN \
  echo oracle-java8-installer shared/accepted-oracle-license-v1-1 select true | debconf-set-selections && \
  add-apt-repository -y ppa:webupd8team/java

RUN \
  apt-get update && DEBIAN_FRONTEND=noninteractive \
  apt-get install -y oracle-java8-installer && \
  apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* /var/cache/oracle*

# Define working directory.
WORKDIR /data

# Define commonly used JAVA_HOME variable
ENV JAVA_HOME /usr/lib/jvm/java-8-oracle

