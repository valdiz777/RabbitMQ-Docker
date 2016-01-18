#!/bin/sh
#################################
# Author: Valentine C. Nwachukwu
# Email: valdiz777@gmail.com
# DESC: Adds user to rabbitmq manager


# Create Default RabbitMQ setup
( sleep 10 ; \

# Delete guest users
rabbitmqctl delete_user guest

# Create users
# rabbitmqctl add_user <username> <password>
rabbitmqctl add_user zadenadmin zaden ; \

# Set user rights
# rabbitmqctl set_user_tags <username> <tag>
rabbitmqctl set_user_tags zadenadmin administrator ; \

# Create vhosts
# rabbitmqctl add_vhost <vhostname>
rabbitmqctl add_vhost dermalink_rabbitmq_container ; \

# Set vhost permissions
# rabbitmqctl set_permissions -p <vhostname> <username> ".*" ".*" ".*"
rabbitmqctl set_permissions -p dermalink_rabbitmq_container zadenadmin ".*" ".*" ".*" ; \
) &    
rabbitmq-server $@
