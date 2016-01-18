#
# RabbitMQ Dockerfile
#
# https://github.com/docker-library/rabbitmq
#

# Pull base image.
FROM ubuntu:14.04

MAINTAINER Valentine Nwachukwu "valdiz777@gmail.com"

ENV DEBIAN_FRONTEND noninteractive

# Add script to create default users / vhosts
ADD init.sh /init.sh

# Set correct executable permissions
RUN chmod +x /init.sh

RUN \
    apt-get install -y wget && \
    wget -qO - https://www.rabbitmq.com/rabbitmq-signing-key-public.asc | apt-key add - && \
    echo "deb http://www.rabbitmq.com/debian/ testing main" > /etc/apt/sources.list.d/rabbitmq.list && \
    apt-get -qq update > /dev/null && \
    apt-get -qq -y install rabbitmq-server > /dev/null && \
    /usr/sbin/rabbitmq-plugins enable rabbitmq_management

# Expose Ports.
EXPOSE 15672
EXPOSE 4369
EXPOSE 5672

# Define default command
CMD ["/init.sh"]
