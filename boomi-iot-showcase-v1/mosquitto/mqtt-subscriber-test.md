Once the simulator process starts publishing messages to MQTT broker, we will use a docker based test container for mosquitto subscriber. Open a separate console to the ubuntu machine where we installed the broker and run the below command

```
sudo su
docker run -it --rm efrecon/mqtt-client sub  -h 172.31.0.100 -t "#" -v
```
This enables a subscriber that listens to all topics and if all is well, you should start to see the messages.
