###Supported tags and respective Dockerfile links
* 5.2, 5.2.1, latest ([5.2/Dockerfile](https://github.com/stakater/dockerfile-elasticsearch/blob/master/5.2/Dockerfile))
* 2.3.1 ([2.3.1/Dockerfile](https://github.com/stakater/dockerfile-elasticsearch/blob/master/2.3.1/Dockerfile))

For more information Please look at the README files with the dockerfiles.

##What is Elasticsearch?

Elasticsearch is a search server based on Lucene. It provides a distributed, multitenant-capable full-text search engine with a RESTful web interface and schema-free JSON documents.
=======
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

`docker run -d -p 9200:9200 -p 9300:9300 stakater/elasticsearch elasticsearch`

You can also pass in additional flags to elasticsearch:

`docker run -d -p 9200:9200 -p 9300:9300 stakater/elasticsearch elasticsearch -Des.node.name="TestNode"`

This image comes with a default set of configuration files for elasticsearch, but if you want to provide your own set of configuration files, you can do so via a volume mounted at `/usr/share/elasticsearch/config`:

`/my/local/config/elastic.yml:/usr/share/elasticsearch/config/elasticsearch.yml`

`docker run -d -v "$PWD/config/elasticsearch.yml":/usr/share/elasticsearch/config/elasticsearch.yml -p 9200:9200 -p 9300:9300 stakater/elasticsearch`

This image is configured with a volume at `/usr/share/elasticsearch/data` to hold the persisted index data. Use that path if you would like to keep the data in a mounted volume:

`docker run -d -v "$PWD/esdata":/usr/share/elasticsearch/data -p 9200:9200 -p 9300:9300 stakater/elasticsearch`

This image includes EXPOSE `9200` `9300` (default http.port), so standard container linking will make it automatically available to the linked containers.

Tell elasticsearch container following things:

1. This image is configured with a volume at /usr/share/elasticsearch/data to hold the persisted index data. Use that path if you would like to keep the data in a mounted volume
e.g. `-v "$PWD/esdata":/usr/share/elasticsearch/data`

2. ports to expose

`docker run -d -p 9200:9200 -p 9300:9300 stakater/elasticsearch elasticsearch`

Basic elastic search queries:

`http://192.168.99.100:9200/_search?pretty`

`http://192.168.99.100:9200/_template/`

`http://{ELASTIC_SEARCH_HOST}:9200/_search?pretty`

`http://{ELASTIC_SEARCH_HOST}:9200/_template/`

In other words, in order to search for our movies we can make POST requests to either of the following URLs:

* `http://localhost:9200/_search` - Search across all indexes and all types.
* `http://localhost:9200/movies/_search` - Search across all types in the movies index.
* `http://localhost:9200/movies/movie/_search` - Search explicitly for documents of type movie within the movies index.

```
	manage_template => false
	index => "%{[@metadata][beat]}-%{+YYYY.MM.dd}"
	document_type => "%{[@metadata][type]}"
```

Inspiration: https://hub.docker.com/_/elasticsearch/
