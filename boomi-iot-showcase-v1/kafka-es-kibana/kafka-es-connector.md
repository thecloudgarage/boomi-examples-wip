```
{    "connector.class":"io.confluent.connect.elasticsearch.ElasticsearchSinkConnector",    "tasks.max": "1",    "topics": "gps",    "key.ignore":"true",    "schema.ignore": "true",    "connection.url": "http://elasticsearch:9200",    "type.name": "gps", "name":"gps"  }
```
