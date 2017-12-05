FROM docker.gillsoft.org/ubuntu-base

MAINTAINER Ronan Gill <ronan.gill@gillsoft.org>

RUN \
  echo oracle-java8-installer shared/accepted-oracle-license-v1-1 select true | debconf-set-selections && \
  add-apt-repository -y ppa:webupd8team/java && \
  apt-get update && \
  apt-get -yq dist-upgrade && \
  apt-get install -y oracle-java8-installer && \
  apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* /var/cache/oracle*

# Define commonly used JAVA_HOME variable
ENV JAVA_HOME /usr/lib/jvm/java-8-oracle
