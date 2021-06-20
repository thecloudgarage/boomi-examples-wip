```
PUT /gps?include_type_name=true
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
