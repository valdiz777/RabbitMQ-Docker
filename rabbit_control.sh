#!/bin/bash
#################################
# Author: Valentine C. Nwachukwu
# Email: valdiz777@gmail.com
# Info: Builds and Runs the rabbit Dockerfile
# DESC: This is a Rabbit Docker setup script for rabbitMQ

######### Build ######
docker build -t rabbit_docker .

######### Run ########
docker run -d -p 5672:5672 -p 15672:15672 -p 4369:4369 --name dermalink_rabbitmq_container rabbit_docker
