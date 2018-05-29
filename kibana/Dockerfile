FROM ubuntu:16.04
MAINTAINER Anand Gavai <anand.gavai@gmail.com>

# Create a user anandgavai and home directory for him
RUN useradd -ms /bin/bash anandgavai
USER anandgavai
WORKDIR /home/anandgavai

USER root
RUN apt-get update 
RUN apt-get -y upgrade
RUN apt-get install -y wget 
RUN apt-get install -y software-properties-common
RUN add-apt-repository -y ppa:webupd8team/java
RUN apt-get update
RUN apt-get install -y curl

# Install Java
RUN (echo oracle-java8-installer shared/accepted-oracle-license-v1-1 select true | /usr/bin/debconf-set-selections)
RUN apt-get install --no-install-recommends -y oracle-java8-installer



# Install Kibana
RUN wget https://artifacts.elastic.co/downloads/kibana/kibana-6.1.4-linux-x86_64.tar.gz
RUN gunzip kibana-6.1.4-linux-x86_64.tar.gz
RUN tar -xvf kibana-6.1.4-linux-x86_64.tar
RUN rm kibana-6.1.4-linux-x86_64.tar

# Install x-pack security settings
RUN /home/anandgavai/kibana-6.1.4-linux-x86_64/bin/kibana-plugin install x-pack

ENV PATH /home/anandgavai/kibana-6.1.4-linux-x86_64/bin:$PATH

# Copy local config files to kibana config directory
COPY config /home/anandgavai/kibana-6.1.4-linux-x86_64/config
COPY docker-entrypoint.sh /

EXPOSE 5601

RUN chown -R anandgavai:anandgavai /home/anandgavai/kibana-6.1.4-linux-x86_64
USER 1000

USER root
RUN ["chmod", "+x", "/docker-entrypoint.sh"]

USER anandgavai
ENTRYPOINT ["/docker-entrypoint.sh"]

CMD ["/home/anandgavai/kibana-6.1.4-linux-x86_64/bin/kibana"]

