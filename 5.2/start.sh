#!/bin/bash
set -e

# Add elasticsearch as command if needed
if [ "${COMMAND:0:1}" = '-' ]; then
	set -- elasticsearch "$COMMAND"
fi

# Drop root privileges if we are running elasticsearch
# allow the container to be started with `--user`
if [ "$COMMAND" = 'elasticsearch' -a "$(id -u)" = '0' ];
then
	# Change the ownership of user-mutable directories to elasticsearch
	for path in \
		/usr/share/elasticsearch/data \
		/usr/share/elasticsearch/logs \
	; do
		chown -R stakater:stakater "$path"
	done

	set -- su-exec stakater "$COMMAND"
	su-exec stakater "$COMMAND"
else
	# As argument is not related to elasticsearch,
	# then assume that user wants to run his own process,
	# for example a `bash` shell to explore this image
	exec "$COMMAND"
fi