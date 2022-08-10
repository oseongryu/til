### CentOS 설치
```
docker pull centos:7.9.2009
docker run -it --name centos-jekyll -p 8080:8080 -p 8081:8081 centos:7.9.2009
```
docker exec -it centos-jekyll /bin/bash


### 
```bash
yum install ruby
ruby -v

```


### 
yum install -y git-core zlib zlib-devel gcc-c++ patch readline readline-devel libyaml-devel libffi-devel openssl-devel make bzip2 autoconf automake libtool bison curl sqlite-devel


cd
git clone https://github.com/sstephenson/rbenv.git .rbenvcd 
echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bash_profile
echo 'eval "$(rbenv init -)"' >> ~/.bash_profile
exec $SHELL

git clone https://github.com/sstephenson/ruby-build.git ~/.rbenv/plugins/ruby-build
echo 'export PATH="$HOME/.rbenv/plugins/ruby-build/bin:$PATH"' >> ~/.bash_profile
exec $SHELL


###
yum install which
curl -L https://get.rvm.io | bash -s stable --ruby
curl -L https://get.rvm.io | bash -s stable --ruby=2.6.10

source /etc/profile.d/rvm.sh
rvm reload
rvm install 2.6.10
ruby -v


### jekyll setup
```bash
gem install jekyll
gem install minima
gem install bundler
gem install jekyll-feed
gem install tzinfo-data
```

### jekyll init
jekyll new my-awesome-site
cd my-awesome-site

### jekyll exec
bundle exec jekyll serve
bundle add webrick

bundle exec jekyll serve --host localhost --port 8080
bundle exec jekyll serve --skip-initial-build --host 0.0.0.0 --port 8080 > /dev/null 2>&1 &

kill $(ps aux | grep '[j]ekyll' | awk '{print $2}')

yum install net-tools 
netstat -tnlp

### docker-cp

docker cp centos-jekyll:/my-awesome-site ~/git/test

docker cp ~/git/guide centos-jekyll:/
