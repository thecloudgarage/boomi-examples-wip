# Real-time IoT data pipelines using Boomi, Docker and multiple data services.
 ![Build Status](https://travis-ci.org/Raouf25/Spring-Boot-efficient-search-API.svg?branch=master)
 ![Quality Gate Status](https://sonarcloud.io/api/project_badges/measure?project=Raouf25_Spring-Boot-efficient-search-API&metric=alert_status)
 ![BCH compliance](https://bettercodehub.com/edge/badge/Raouf25/Spring-Boot-efficient-search-API?branch=master)

## Objective

Build an **end-to-end real-time data pipeline** on top of Boomi integration that can serve as a tool-chain for various IoT use cases. 

> Special thanks to **Chris Cappetta** https://github.com/ccappetta and **Premjit Mishra** from Boomi who have always helped me get the better of the Boomi platform!


## Project inspiration & Boomi to the rescue!

The inspiration for this project came due to a need for IOT testing tool, which can feature as a MQTT publisher. The nature of immediate testing was to generate randonmess of incremental lat/long/temperature data and publishing it at a periodic interval to a MQTT broker. With this pursuit, I ended up paho and experimenting with mqtt cli tools. However, the level of complexity in building an automated data set and then automating the publishing was too high. 

<br />

![image](https://user-images.githubusercontent.com/39495790/120280155-f8535c00-c2d4-11eb-9cbd-1463b19bef43.png)

<br />

While that being the case, this project got all sorts of weird ideas to finally become a small end-to-end showcase. The simulator process can now be gracefully used for any kind of data set generation and diversify it's application to any target connector supported by Boomi.

Boomi Integration service provides a rich featurette of connectors and integration logic inclusive of custom scripting, etc. I decided to take advantage of Boomi Integration to build a simulation tool instead of leveraging docker/linux/windows tools.

This helped me further as my target processes that need to be tested via simulation were deployed on Boomi itself

<br />

![image](https://user-images.githubusercontent.com/39495790/120336889-6ff2ac80-c310-11eb-8524-fac45c1a5465.png)

![image](https://user-images.githubusercontent.com/39495790/122979882-b12d2800-d3b5-11eb-9042-57aadc310783.png)

## Prequisities
* Basic working knowledge of Boomi Integration
* Docker host preferably with 4G or 8G RAM
* **Optional:** Familiarity with MQTT, Kafka, ElasticSearch, Kibana, Docker


## Process-1: IoT simulator

This process will serve as a simulator to generate mock data for IoT sensor. The process is fine tuned to generate randomness and close-to-real life emulation of incremental latitude, longitude, speeds, distances, fuel, temperature, etc. The output of this process will be sent to a MQTT broker via a connector. This how our Boomi simulator process will look like at the end.

![image](https://user-images.githubusercontent.com/39495790/122972243-8c34b700-d3ad-11eb-99ad-3b9807dd024e.png)


## Process-2: IoT processor

This process serves multiple objectives. It subscribes to the MQTT broker and listen for all GPS data published by the simulator processor. Further on, it performs a HTTP lookup to a Spring Boot API, wherein the intent is that there are parts of information such as customer ID, customer Name, driver details, etc. stored in a separate database. This data is accessible via a Spring Boot API. 

Herein, the HTTP lookup data is then mashed up with incoming MQTT messages for each GPS ID to perform a typical use-case of **data enrichment**. Lastly, the overall data is profiled in a JSON structure that will be send to KAFKA and sequentially to an update step that takes MQTT based lat/lon/fuel/distance data points and updates back the lookup database via the same Spring Boot API.

![image](https://user-images.githubusercontent.com/39495790/122973670-1c273080-d3af-11eb-8bc9-b5d1a6e37d48.png)


## Process-3: Kafka-to-ElasticSearch

This process integrates Kafka with ElasticSearch via a simple interlock. At the start a KAFKA listener consumes the messages produced to the "gps" topic by the KAFKA publisher built via the IoT processor. Since messages are received in JSON and as such do not require any sorts of transformation, they are simply relayed via a HTTP connector to the ElasticSearch engine. **NOTE** In our case, the ElasticSearch is made available via the NGINX reverse proxy due to the limitations in training account licenses. In a nutshell, the HTTP client sends the JSON data to NGINX reverse proxy that forwards it to the ElasticSearch.

**ElasticSearch** being one of the most powerful indexing database allows for all sorts of further explorations, one of them being the ability to leverage indexed data into Kibana for various inferential analysis. Kibana and ElasticSearch typically go hand-in-hand and the connections between the two are established via the docker-compose directly without going through a Boomi process.

![image](https://user-images.githubusercontent.com/39495790/122974487-0108f080-d3b0-11eb-8758-20cc82950095.png)


## In a Nutshell..

**At this stage, our real-time data is available in Kafka and ElasticSearch.** It is upon oneself if they are well versed with the possibilities to leverage these data assets into an enterprise data pipeline for other use-cases or scenarios.

## Outcomes matter

At the end of the exercise of creating a real-time data pipeline we will be able to visualize all of it in Kibana. The entirety and complexity of Kibana is huge and beyond the scope of this project. However, you will end up in visualizing and creating business intelligence views and real time maps for various data points such lat/long, fuel efficiency, distances, etc. It is upon oneself to further explore these data sets in Kibana and practically speaking you are only limited to the vast set of Kibana capabilities. 

![image](https://user-images.githubusercontent.com/39495790/122866472-9e7b0a80-d345-11eb-9970-ea0d70c39aa1.png)

Kibana also provides for cool Machine Learning models which you can explore!

![image](https://user-images.githubusercontent.com/39495790/122866642-ec900e00-d345-11eb-9c25-5fc1a4739df8.png)

## License
Real-time IoT data pipelines using Boomi, Docker and multiple data services © 2021 by Ambar Hassani <ambar.thecloudgarage@gmail.com>
