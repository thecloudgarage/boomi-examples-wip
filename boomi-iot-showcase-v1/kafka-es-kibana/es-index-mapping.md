Kibana > dev tools > paste the below to create an index with the specified mapping
You might receive no request in error message initially. You might wait for some time and repeat the execution of the same.
This version of mapping template avoids any type.name post 7.13 ElasticSearch. But while creating the ES connnector in CP KAFKA, we need to mention "_doc" as type.name
```
PUT /gps
{
  "mappings": {
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
