FROM       debian:jessie
MAINTAINER luka <lzalewsk@gmail.com>


RUN echo "deb http://www.rabbitmq.com/debian/ testing main" > /etc/apt/sources.list.d/rabbitmq.list
RUN apt-get update
RUN apt-get install wget -y
RUN wget -O- https://www.rabbitmq.com/rabbitmq-release-signing-key.asc | apt-key add -
#RUN apt-key add rabbitmq-release-signing-key.asc

RUN apt-get update
RUN apt-get install rabbitmq-server -y
#RUN rabbitmq-plugins enable rabbitmq_web_stomp rabbitmq_stomp rabbitmq_management
RUN rabbitmq-plugins enable rabbitmq_management
RUN rabbitmq-plugins enable rabbitmq_mqtt

RUN apt-get install openssl -y
ADD ssl /ssl

ADD rabbitmq.config /etc/rabbitmq/rabbitmq.config

ADD scripts /scripts
RUN chmod +x /scripts/*.sh

VOLUME /var/lib/rabbitmq
RUN chown -R rabbitmq:rabbitmq /var/lib/rabbitmq
VOLUME /var/log/rabbitmq
RUN chown -R rabbitmq:rabbitmq /var/log/rabbitmq

# ports are:
# * SSL AMQP
# * SSL STOMP
# * Management
#EXPOSE 5671 61614 15672 15671 5672 61613
EXPOSE 5671 15672 15671 5672 1883

CMD ["/scripts/run.sh"]
