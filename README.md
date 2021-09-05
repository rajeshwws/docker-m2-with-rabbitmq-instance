#Docker Containers - Magento 2.3 using rabbitmq 

This Docker container is build with support to `Nginx`, `PHP 5.7` (built with PHP FPM) and `MySQL 5.7`. 

# Installation Instruction

Just clone the files into your project folder and follow the following instruction .

Just open your terminal and navigate to docker-m2-with-rabbitmq-instance.

• Configure magento2 base url by using command : export MAGENTO_BASE_URL=http://magento2.local

• After that execute : docker-compose up -d

• Sit back and relax it will take some time to build the containers and start them, after successfully up all the containers use http://magento2.local to access the installation.

Note :- Ports 80, 3306, 5672, 15672 will be used by the container for the different services, make sure on the machine they are not in use.

### Accessing the container terminal

If you need to access the container terminal, use the following commands:

•	to see which are the running containers: docker ps

•	to connect to a container as root: docker exec -it {container_name} bash

•	to connect to a container as local user (1000): docker exec -it --user local {container_name} bash

### Accessing Magento frontend

Just navigate to http://magento2.local/

### Accessing Magento backend

Just navigate to http://magento2.local/admin and access the panel with these credentials:

username: `admin`
password: `admin123`

### Accessing RabbitMQ

Just navigate to http://localhost:15672/ with credentials guest/guest to see the dashboard.
