First and foremost, login to kibana > dev tools and paste the following (this will give a depreciation warning ignore it)

Basically, we are creating an index manually in Kibana that maps to our topic in Kafka (recommendation is to avoid dynamic indexing for geo_point)

Herein index name is gps and the type.name is _doc

```
PUT gps?include_type_name=true
{
  "mappings": {
    "_doc": {
      "properties": {
        "customerId": {
          "type": "long"
        },
        "customerName": {
          "type": "text",
          "fields": {
            "keyword": {
              "type": "keyword",
              "ignore_above": 256
            }
          }
        },
        "distancediff": {
          "type": "float"
        },
        "distancetotal": {
          "type": "float"
        },
        "driverId": {
          "type": "text",
          "fields": {
            "keyword": {
              "type": "keyword",
              "ignore_above": 256
            }
          }
        },
        "driverName": {
          "type": "text",
          "fields": {
            "keyword": {
              "type": "keyword",
              "ignore_above": 256
            }
          }
        },
        "fueldiff": {
          "type": "float"
        },
        "fuelefficiency": {
          "type": "float"
        },
        "fueltotal": {
          "type": "float"
        },
        "gpsterminalid": {
          "type": "text",
          "fields": {
            "keyword": {
              "type": "keyword",
              "ignore_above": 256
            }
          }
        },
        "location": {
		"type": "geo_point"
        },
        "speed": {
          "type": "float"
        },
        "temperature": {
          "type": "float"
        },
        "timestamp": {
          "type": "date"
        },
        "vehicleCategory": {
          "type": "text",
          "fields": {
            "keyword": {
              "type": "keyword",
              "ignore_above": 256
            }
          }
        },
        "vehicleNumber": {
          "type": "text",
          "fields": {
            "keyword": {
              "type": "keyword",
              "ignore_above": 256
            }
          }
        }
      }
    }
  }
}
```

Once done, login to kafka connnect UI and create a new connector. Delete the existing JSON and paste the below contents to create (wait for a couple of seconds till it says valid configuration)

```
{    "connector.class":"io.confluent.connect.elasticsearch.ElasticsearchSinkConnector",    "tasks.max": "1",    "topics": "gps",    "key.ignore":"true",    "schema.ignore": "true",    "connection.url": "http://elasticsearch:9200",    "type.name": "_doc", "name":"gps"  }
```
Create an Index pattern "gps" selecting the indice of gps.

Go to Maps and add a layer, select the data source as the gps index pattern and validate.
