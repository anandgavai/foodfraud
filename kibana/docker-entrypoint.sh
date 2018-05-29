#!/bin/bash

set -e

# Add kibana as command if needed
if [[ "$1" == -* ]]; then
		set -- kibana "$@"
	fi

	sed -ri "s!^(\#\s*)?(elasticsearch\.url:).*!\2 'http://${ELASTICSEARCH_SERVICE_HOST}:9200'!" /home/anandgavai/kibana-6.1.4-linux-x86_64/config/kibana.yml

	exec "$@"
