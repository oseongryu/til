### docker

```bash
#!/bin/sh
docker cp ~/git/hy-fredit-web centos-env-vue:/root
docker exec -it centos-env-vue bash

docker commit centos-env-vue oseongryu/centos-env-vue:0.0.3
docker push oseongryu/centos-env-vue:0.0.3

docker pull oseongryu/centos-env-vue:0.0.1
docker run -it -d --name centos-env-vue -p 9551:9551 -p 9552:9552 oseongryu/centos-env-vue:0.0.3 /sbin/init
docker run -it -d -p 9551:9551 -p 9552:9552 --privileged --restart=always --name centos-env-vue oseongryu/centos-env-vue:0.0.1 /sbin/init

docker exec -it centos-env-vue bash

```

### centos 설정

```bash
yum update

# Error: Failed to download metadata for repo 'appstream': Cannot prepare internal mirrorlist: No URLs in mirrorlist
cd /etc/yum.repos.d/
sed -i 's/mirrorlist/#mirrorlist/g' /etc/yum.repos.d/CentOS-*
sed -i 's|#baseurl=http://mirror.centos.org|baseurl=http://vault.centos.org|g' /etc/yum.repos.d/CentOS-*

# node 설치
## node 16.17.1
yum install -y wget
cd /home
wget https://nodejs.org/dist/v16.17.1/node-v16.17.1-linux-x64.tar.gz
tar xvzf node-v16.17.1-linux-x64.tar.gz
mv node-v16.17.1-linux-x64 nodejs

## 실행파일 PATH 지정하기
vi /etc/profile
# pathmunge 윗 줄에 아래 2행 추가
export NODE_HOME=/home/nodejs
export PATH=$PATH:$NODE_HOME/bin
:wq

## 작성한 PATH 적용 시키기
source /etc/profile


## nodejs 버전 확인
node -v
npm -v

## yarn 설치
# https://gist.github.com/teocci/5ac7c3b59e255f414185b677717e620b
curl --silent --location https://rpm.nodesource.com/setup_16.x | sudo bash -
sudo yum install nodejs
curl --silent --location https://dl.yarnpkg.com/rpm/yarn.repo | sudo tee /etc/yum.repos.d/yarn.repo
sudo rpm --import https://dl.yarnpkg.com/rpm/pubkey.gpg
sudo yum install yarn
yarn --version

## nvm 설치
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.1/install.sh | bash
nvm -v
nvm use system
vi ~/.bash_profile

export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm

source ~/.bash_profile
nvm install 16.17.1
nvm use 16.17.1
nvm alias default 16.17.1

# yarn 설치
npm i -g yarn
```

### docker offline image

```bash
docker save -o centos-env-vue-0.0.2.tar oseongryu/centos-env-vue:0.0.2
docker load -i centos-env-vue-0.0.2.tar
```

### references

```
https://imksh.com/93
```
