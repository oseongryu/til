### setting
```bash
# Docker 설치
# https://docs.docker.com/engine/install/centos/ 사이트 자료를 참고하여 설치한다.
sudo yum -y update
sudo yum install -y yum-utils

# Docker repository 시스템에 추가
sudo yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo
sudo yum-config-manager --enable docker-ce-nightly

# 최신버전의 Docker 설치(Install Docker Engine)
sudo yum -y install docker-ce docker-ce-cli containerd.io

# Docker 데몬 시작 및 부팅 시 Docker 데몬 자동 시작
sudo systemctl start docker
sudo systemctl enable docker

# Docker 실행중인지 확인
sudo systemctl status docker

```

### references
https://link2me.tistory.com/2088