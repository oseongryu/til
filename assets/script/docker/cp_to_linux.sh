#!/bin/sh
docker cp ~/git/hy-fredit-web centos-env-vue:/root

docker commit centos-env-vue oseongryu/centos-env-vue:0.0.1
docker push oseongryu/centos-env-vue:0.0.1

docker pull oseongryu/centos-env-vue:0.0.1
docker run -it -d --name centos-env-vue -p 9551:9551 -p 9552:9552 oseongryu/centos-env-vue:0.0.1
docker exec -it centos-env-vue bash

