FROM docker.gillsoft.org/ubuntu-base

LABEL maintainer="Ronan Gill <ronan.gill@gillsoft.org>"

RUN echo oracle-java8-installer shared/accepted-oracle-license-v1-1 select true | debconf-set-selections
RUN add-apt-repository -y ppa:webupd8team/java
RUN apt-get update
RUN apt-get -yq dist-upgrade
RUN apt-get install -y oracle-java8-installer
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* /var/cache/oracle*

# Define commonly used JAVA_HOME variable
ENV JAVA_HOME /usr/lib/jvm/java-8-oracle
