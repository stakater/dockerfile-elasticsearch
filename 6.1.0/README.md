# Dockerfile for Elasticsearch
Elasticsearch is a powerful open source search and analytics engine that makes data easy to explore.

Elasticsearch is a search server based on Lucene. It provides a distributed, multitenant-capable full-text search engine with a RESTful web interface and schema-free JSON documents.

based on Alpine & oracle java 8

Run the latest container with:

`docker run stakater/elasticsearch`


### NOTE: 
The elasticsearch docker images currently doesn't run on a machine with RAM below `4096 Mb`. If elasticsearch container fails to start due to VM memmory error, run the following command on the host machine: 

```
sysctl -w vm.max_map_count=262144
``` 

For OS specific commands and further details refer to https://www.elastic.co/guide/en/elasticsearch/reference/current/docker.html

## Advanced

Build an image:
`docker build -t stakater/elasticsearch .`

Push an image:
`sudo docker push stakater/elasticsearch`

You can run the default elasticsearch command by specifying it in the `COMMAND` environmental variable :

```
$ docker run -d -e COMMAND="elasticsearch" stakater/elasticsearch
```

You can also pass in additional flags to elasticsearch:

```
$ docker run -d -e COMMAND="elasticsearch -Des.node.name="TestNode" stakater/elasticsearch
```

This image comes with a default set of configuration files for elasticsearch, but if you want to provide your own set of configuration files, you can do so via a volume mounted at /usr/share/elasticsearch/config:

```
$ docker run -d -v "$PWD/config":/usr/share/elasticsearch/config stakater/elasticsearch
```

This image is configured with a volume at /usr/share/elasticsearch/data to hold the persisted index data. Use that path if you would like to keep the data in a mounted volume:

```
$ docker run -d -v "$PWD/esdata":/usr/share/elasticsearch/data stakater/elasticsearch
```

This image includes EXPOSE `9200` `9300` (default http.port), so standard container linking will make it automatically available to the linked containers.

Tell elasticsearch container following things:

1.
2. This image is configured with a volume at /usr/share/elasticsearch/data to hold the persisted index data. Use that path if you would like to keep the data in a mounted volume
e.g.
`-v "$PWD/esdata":/usr/share/elasticsearch/data`
3. ports to expose

`docker run -d -p 9200:9200 -p 9300:9300 stakater/elasticsearch elasticsearch`

### Basic elastic search queries

```
http://{ELASTIC_SEARCH_HOST}:9200/_search?pretty
http://{ELASTIC_SEARCH_HOST}:9200/_template/
```

In other words, in order to search for our movies we can make POST requests to either of the following URLs:

```
http://localhost:9200/_search - Search across all indexes and all types.
http://localhost:9200/movies/_search - Search across all types in the movies index.
http://localhost:9200/movies/movie/_search - Search explicitly for documents of type movie within the movies index.
```

```
manage_template => false
index => "%{[@metadata][beat]}-%{+YYYY.MM.dd}"
document_type => "%{[@metadata][type]}"
```

Inspiration: https://hub.docker.com/_/elasticsearch/
