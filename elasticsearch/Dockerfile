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



# Install Elasticsearch
RUN wget https://artifacts.elastic.co/downloads/elasticsearch/elasticsearch-6.1.4.tar.gz
RUN gunzip elasticsearch-6.1.4.tar.gz
RUN tar -xvf elasticsearch-6.1.4.tar
RUN rm elasticsearch-6.1.4.tar

# Install x-pack security settings
RUN /home/anandgavai/elasticsearch-6.1.4/bin/elasticsearch-plugin install x-pack --batch

ENV PATH /home/anandgavai/elasticsearch-6.1.4/bin:$PATH

RUN set -ex \
	&& for path in \
		./data \
		./logs \
		./config \
		./config/scripts \
	; do \
		mkdir -p "$path"; \
		chown -R anandgavai:anandgavai "$path"; \
	done

# Copy local config files to elasticsearch config directory
COPY config /home/anandgavai/elasticsearch-6.1.4/config
COPY docker-entrypoint.sh /

EXPOSE 9200 
EXPOSE 9300

# RUN chmod -R og+w /home/anandgavai/elasticsearch-6.1.4
RUN chown -R anandgavai:anandgavai /home/anandgavai/elasticsearch-6.1.4
USER 1000

USER root
RUN ["chmod", "+x", "/docker-entrypoint.sh"]

USER anandgavai
ENTRYPOINT ["/docker-entrypoint.sh"]

CMD ["/home/anandgavai/elasticsearch-6.1.4/bin/elasticsearch"]

# VOLUME ["/opt/elasticsearch/data","/opt/elasticsearch/logs"]

