#!/bin/bash
_elasticsearch_version=$1
_elasticsearch_tag=$2
_release_build=false

if [ -z "${_elasticsearch_version}" ]; then
	source ELASTICSEARCH_VERSION
	_elasticsearch_version=$ELASTICSEARCH_VERSION
	_elasticsearch_tag=$ELASTICSEARCH_VERSION
	_release_build=true
fi

echo "ELASTICSEARCH_VERSION: ${_elasticsearch_version}"
echo "DOCKER TAG: ${_elasticsearch_tag}"
echo "RELEASE BUILD: ${_release_build}"

docker build --build-arg ELASTICSEARCH_VERSION=${_elasticsearch_version} --tag "stakater/elasticsearch:${_elasticsearch_tag}"  --no-cache=true .

if [ $_release_build == true ]; then
	docker build --build-arg ELASTICSEARCH_VERSION=${_elasticsearch_version} --tag "stakater/elasticsearch:latest"  --no-cache=true .
fi