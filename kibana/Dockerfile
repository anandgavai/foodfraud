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
RUN wget https://artifacts.elastic.co/downloads/kibana/kibana-6.1.4-linux-x86_64.tar.gz
RUN gunzip kibana-6.1.4-linux-x86_64.tar.gz
RUN tar -xvf kibana-6.1.4-linux-x86_64.tar
RUN rm kibana-6.1.4-linux-x86_64.tar

WORKDIR "/kibana-6.1.4-linux-x86_64/bin"

CMD ["./kibana-plugin install x-pack"]

EXPOSE 5601

CMD ["./kibana"]

