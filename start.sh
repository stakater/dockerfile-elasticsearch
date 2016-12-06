#!/bin/bash

set -e

CMD="elasticsearch"
# Add elasticsearch as command if needed
if [ "${1:0:1}" = '-' ]; then
	set -- elasticsearch $CMD
fi

# Drop root privileges because we are running elasticsearch
# allow the container to be started with `--user`
# Change the ownership of /usr/share/elasticsearch/data to elasticsearch
chown -R elasticsearch:elasticsearch /usr/share/elasticsearch/data

set -- gosu elasticsearch $CMD
gosu elasticsearch $CMD