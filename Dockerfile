FROM ubuntu:16.04


RUN apt-get -qq update
RUN apt-get install -y wget 
RUN apt-get install -y software-properties-common
RUN add-apt-repository -y ppa:webupd8team/java
RUN apt-get update

# Install Java
RUN (echo oracle-java8-installer shared/accepted-oracle-license-v1-1 select true | /usr/bin/debconf-set-selections)
RUN apt-get install --no-install-recommends -y oracle-java8-installer

# Install Golang
RUN mkdir goProjects
RUN cd goProjects
RUN add-apt-repository -y ppa:gophers/archive
RUN apt-get update
RUN apt-get install -y golang-1.10-go


# Install R and its dependencies

# Install Elasticsearch
RUN wget https://artifacts.elastic.co/downloads/elasticsearch/elasticsearch-6.1.4.tar.gz
RUN gunzip elasticsearch-6.1.4.tar.gz
RUN tar -xvf elasticsearch-6.1.4.tar
RUN rm elasticsearch-6.1.4.tar

