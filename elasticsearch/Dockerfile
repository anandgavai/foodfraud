FROM ubuntu:16.04
MAINTAINER Anand Gavai <anand.gavai@gmail.com>

# Create a user anandgavai and home directory for him
RUN useradd -ms /bin/bash anandgavai
USER anandgavai
WORKDIR /home/anandgavai

RUN apt-get update 
RUN apt-get -y upgrade
RUN apt-get install -y wget 
RUN apt-get install -y software-properties-common
RUN add-apt-repository -y ppa:webupd8team/java
RUN apt-get update

# Install Java
RUN (echo oracle-java8-installer shared/accepted-oracle-license-v1-1 select true | /usr/bin/debconf-set-selections)
RUN apt-get install --no-install-recommends -y oracle-java8-installer


# Install Elasticsearch
RUN wget https://artifacts.elastic.co/downloads/elasticsearch/elasticsearch-6.1.4.tar.gz
RUN gunzip elasticsearch-6.1.4.tar.gz
RUN tar -xvf elasticsearch-6.1.4.tar
RUN rm elasticsearch-6.1.4.tar

USER root
RUN /elasticsearch-6.1.4/bin/elasticsearch-plugin install x-pack --batch

USER anandgavai
CMD ["/elasticsearch-6.1.4/bin/elasticsearch"]

EXPOSE 9200 9300

# VOLUME ["/opt/elasticsearch/data","/opt/elasticsearch/logs"]

