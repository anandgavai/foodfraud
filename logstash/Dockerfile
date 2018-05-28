FROM ubuntu:16.04
MAINTAINER Anand Gavai <anand.gavai@gmail.com>


RUN apt-get update 
RUN apt-get -y upgrade
RUN apt-get install -y wget 
RUN apt-get install -y software-properties-common
RUN add-apt-repository -y ppa:webupd8team/java
RUN apt-get update

# Install Java
RUN (echo oracle-java8-installer shared/accepted-oracle-license-v1-1 select true | /usr/bin/debconf-set-selections)
RUN apt-get install --no-install-recommends -y oracle-java8-installer


# Install Kibana
RUN wget https://artifacts.elastic.co/downloads/logstash/logstash-6.1.4.tar.gz
RUN gunzip logstash-6.1.4.tar.gz
RUN tar -xvf logstash-6.1.4.tar
RUN rm logstash-6.1.4.tar

WORKDIR "/logstash-6.1.4/bin"

CMD ["./logstash -f "]

