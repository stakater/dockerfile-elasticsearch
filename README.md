### Supported tags and respective Dockerfile links
* 6.1.0, 6.1, 6, latest ([6.1/Dockerfile](https://github.com/stakater/dockerfile-elasticsearch/blob/master/6.1/Dockerfile))
* 5.2, 5.2.1 ([5.2/Dockerfile](https://github.com/stakater/dockerfile-elasticsearch/blob/master/5.2/Dockerfile))
* 2.3.1 ([2.3.1/Dockerfile](https://github.com/stakater/dockerfile-elasticsearch/blob/master/2.3.1/Dockerfile))

For more information Please look at the version specific README files with the dockerfiles.

## What is Elasticsearch?

Elasticsearch is a search server based on Lucene. It provides a distributed, multitenant-capable full-text search engine with a RESTful web interface and schema-free JSON documents.

Run the latest container with:

`docker run -d -p 9200:9200 -p 9300:9300 stakater/elasticsearch`

## Advanced

Build an image:
`docker build -t stakater/elasticsearch .`

Push an image:
`sudo docker push stakater/elasticsearch`

_Note_ you might have to login first before you can push the image to docker-hub `sudo docker login`

You can run the default elasticsearch command simply:

`docker run -d -p 9200:9200 -p 9300:9300 stakater/elasticsearch`

For more information Please look at the version specific README files with the dockerfiles.

Inspiration: https://hub.docker.com/_/elasticsearch/
