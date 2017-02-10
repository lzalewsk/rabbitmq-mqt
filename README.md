docker-rabbitmq-mqtt
=========================

RabbitMQ Docker image with SSL enabled

# Usage

Build:

```
$ docker build --rm -t rabbitmq-mqtt .
```

Run (any of the -p statements can be omitted if not needed):

```
docker run -d -p :5672 -p :5671 -p :15672 -p :1883 rabbitmq-mqtt:latest
```

# SSL

Prepare for manual configuration. TBD.
