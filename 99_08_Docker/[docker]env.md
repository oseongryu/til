## docker

```bash
#!/bin/sh
docker cp ~/git/hy-fredit-web centos-env-vue:/root
docker exec -it centos-env-vue bash

docker commit centos-env-vue oseongryu/centos-env-vue:0.0.1
docker pull 
docker run -it -d --name centos-env-vue -p 9551:9551 -p 9552:9552 centos:latest
```

# centos 설정

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
# curl --silent --location https://rpm.nodesource.com/setup_16.x | sudo bash -
# sudo yum install nodejs
curl --silent --location https://dl.yarnpkg.com/rpm/yarn.repo | sudo tee /etc/yum.repos.d/yarn.repo
sudo rpm --import https://dl.yarnpkg.com/rpm/pubkey.gpg
sudo yum install -y yarn
yarn --version

## nvm 설치
yum install wget
wget -qO- https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.2/install.sh | bash
source ~/.bashrc

nano ~/bashrc
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion" 
```

