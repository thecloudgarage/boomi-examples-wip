Kafka connect UI > new > ElasticSearch > JSON > remove the existing content and paste the below
This has to be done after Kafka topics are created and Kibana mappings are created

```
{    "connector.class":"io.confluent.connect.elasticsearch.ElasticsearchSinkConnector",    "tasks.max": "1",    "topics": "gps",    "key.ignore":"true",    "schema.ignore": "true",    "connection.url": "http://elasticsearch:9200",    "type.name": "_doc", "name":"gps"  }
```
