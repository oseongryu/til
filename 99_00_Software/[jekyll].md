# 사용법

## 1. 루비설치
```bash
yum install ruby
ruby -v

* ruby update
yum install curl gcc gcc-c++, readline-devel, zlib-devel, libyaml-devel, libffi-devel, openssl-devel, autoconf, automake, libtool, bison
curl -L https://get.rvm.io | bash -s stable --ruby
curl -L https://get.rvm.io | bash -s stable --ruby=2.6.10

source /etc/profile.d/rvm.sh
rvm reload
rvm install 2.6.10
ruby -v
```
## rbenv
```bash
# rbenv 설치
yum install rbenv ruby-build
# rbenv 설치 확인
rbenv versions
# 버전
rbenv install -l

rbenv install 2.2.4
rbenv global 2.6.10
ruby -v

yum install -y libssl-dev

```


## 2. 지킬 (Jekyll) 설치하기
```bash
gem install jekyll
gem install minima
gem install bundler
gem install jekyll-feed
gem install tzinfo-data
```

## 3. 로컬에서 블로그 생성하기
```bash
jekyll new my-awesome-site
cd my-awesome-site
bundle exec jekyll serve
bundle add webrick

## 블로그 저장 폴더로 이동한다.
## 인코딩 에러 발생시 다음의 코드를 실행한다.
chcp 65001

# 지킬 실행
jekyll serve

bundle exec jekyll serve --host 0.0.0.0 --port 4000 > /dev/null 2>&1 &

kill $(ps aux | grep '[j]ekyll' | awk '{print $2}')

# 테마변경

gem install just-the-docs
bundle show just-the-docs

## 1. Gemfile 에 다음을 추가
gem "just-the-docs"

## 2. _config.yml 파일에 다음을 추가
theme: just-the-docs

## 3. 터미널에서 다음을 실행
bundle install


# Azure에서 Jekyll을 bat로 실행하기
Azure에 Jekyll 설정을 완료하고, 원격에서 실행하려면 host를 0.0.0.0로 세팅해야 하지만,
Azure의 가상환경의 경우 DNS주소로 host를 설정할 수 없을 때, _site는 DNS주소로 생성하고
실행 시에는 원격에서 실행하는 형태로하고 build를 하지 않도록 해서 처리함  


cd C:\DEV\workspace\f5074.github.io
:start cmd /c bundle exec jekyll serve --host f5074.koreacentral.cloudapp.azure.com --port 4000
:timeout /t 10
:bundle exec jekyll serve --skip-initial-build --host 0.0.0.0 --port 4000

cmd /c bundle exec jekyll serve --host f5074.koreacentral.cloudapp.azure.com --port 4000
IF "%ERRORLEVEL%" == "0" goto ERROR
ELSE goto EXEC

:EXEC
bundle exec jekyll serve --skip-initial-build --host 0.0.0.0 --port 4000

:ERROR
echo error
pause
```

### CentOS 방화벽
```bash
#### 방화벽 상태 확인
firewall-cmd --state

#### 방화벽 설치
sudo yum install firewalld 
sudo systemctl enable firewalld 
sudo systemctl start firewalld

#### 서비스로 방화벽 해제 / 제거
sudo firewall-cmd --permanent --add-service=http 
sudo firewall-cmd --permanent --add-service=https

sudo firewall-cmd --permanent --remove-service=http 
sudo firewall-cmd --permanent --remove-service=http

#### 특정 포트 방화벽 해제
sudo firewall-cmd --permanent --add-port=8080/tcp
sudo firewall-cmd --permanent --remove-port=8080/tcp

#### 방화벽설정이후 reload 필요
sudo firewall-cmd --reload
firewall-cmd --list-all

systemctl stop firewalld
systemctl start firewalld
systemctl status firewalld
```

### reference
```
https://shryu8902.github.io/_posts/2018-06-22-jekyll-on-windows/
https://min9nim.github.io/2018/07/jekyll-theme/
백그라운드실행: https://taewooblog.tistory.com/152
방화벽해제: https://ux.stories.pe.kr/162
```

