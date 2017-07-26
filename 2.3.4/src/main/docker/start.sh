#!/bin/bash
set -e

# Convert COMMAND variable into an array 
# Simulating positional parameter behaviour 
IFS=' ' read -r -a CMD_ARRAY <<< "$COMMAND"

# explicitly setting positional parameters ($@) to CMD_ARRAY
# Add logstash as command if needed i.e. when 
# Add elasticsearch as command if needed
if [ "${CMD_ARRAY[0]:0:1}" = '-' ]; then
	set -- elasticsearch "${CMD_ARRAY[@]}"
else
	set -- "${CMD_ARRAY[@]}"
fi

# Drop root privileges if we are running elasticsearch
# allow the container to be started with `--user`
if [ "$1" = 'elasticsearch' -a "$(id -u)" = '0' ];
then
	# Change the ownership of user-mutable directories to elasticsearch
	for path in \
		/usr/share/elasticsearch/data \
		/usr/share/elasticsearch/logs \
	; do
		chown -R stakater:stakater "$path"
	done

	set -- su-exec stakater "$@"
fi

# As argument is not related to elasticsearch,
# then assume that user wants to run his own process,
# for example a `bash` shell to explore this image
exec "$@"