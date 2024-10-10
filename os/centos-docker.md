### centos docker

```
docker cp centos-jekyll:/root/guide ~/git-personal

docker cp ~/git-personal/template-jekyll centos-jekyll:/root

docker cp ~/git-personal/template-jekyll centos-jekyll:/root

docker cp -R "~/git-personal/template-jekyll" `ls "~/git-personal/template-jekyll" | grep -v ".git"` centos-jekyll:/root


sudo docker images
sudo docker run -it -d --name centos-jekyll -p 8088:8088 oseongryu/centos-jekyll:0.0.1
sudo docker container ls -as

sudo docker start centos-jekyll
sudo docker restart centos-jekyll

sudo docker exec -it centos-jekyll /bin/bash


netstat -tnlp
sudo docker exec -it centos-jekyll /bin/bash


bundle exec jekyll serve --ssl-key ssl/localhost.key --ssl-cert ssl/localhost.crt
```
