#!/bin/bash
_elaticsearch_version=$1
_elaticsearch_tag=$2
_release_build=false

if [ -z "${_elaticsearch_version}" ]; then
	source ELASTICSEARCH_VERSION
	_elaticsearch_version=$ELASTICSEARCH_VERSION
	_elaticsearch_tag=$ELASTICSEARCH_VERSION
	_release_build=true
fi

echo "ELASTICSEARCH_VERSION: ${_elaticsearch_version}"
echo "DOCKER TAG: ${_elaticsearch_tag}"
echo "RELEASE BUILD: ${_release_build}"

docker build --build-arg ELASTICSEARCH_VERSION=${_elaticsearch_version} --tag "stakater/elaticsearch:${_elaticsearch_tag}"  --no-cache=true .

if [ $_release_build == true ]; then
	docker build --build-arg ELASTICSEARCH_VERSION=${_elaticsearch_version} --tag "stakater/elaticsearch:latest"  --no-cache=true .
fi