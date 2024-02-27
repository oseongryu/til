### CentOS 설치
```
docker pull centos:7.9.2009
docker run -it --name centos-jekyll -p 8088:8088 centos:7.9.2009
```
docker exec -it centos-jekyll /bin/bash


###
```bash
yum install ruby
ruby -v

```


###
```bash
yum install -y git-core zlib zlib-devel gcc-c++ patch readline readline-devel libyaml-devel libffi-devel openssl-devel make bzip2 autoconf automake libtool bison curl sqlite-devel


cd ~
git clone https://github.com/sstephenson/rbenv.git .rbenvcd
echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bash_profile
echo 'eval "$(rbenv init -)"' >> ~/.bash_profile
exec $SHELL

git clone https://github.com/sstephenson/ruby-build.git ~/.rbenv/plugins/ruby-build
echo 'export PATH="$HOME/.rbenv/plugins/ruby-build/bin:$PATH"' >> ~/.bash_profile
exec $SHELL
```


###
```bash
yum install which
curl -L https://get.rvm.io | bash -s stable --ruby
curl -L https://get.rvm.io | bash -s stable --ruby=2.6.10

curl -sSL https://rvm.io/mpapis.asc | gpg2 --import -
curl -sSL https://rvm.io/pkuczynski.asc | gpg2 --import -

source /etc/profile.d/rvm.sh
rvm reload
rvm install 2.6.10
ruby -v
```

### jekyll setup
```bash
gem install jekyll
gem install minima
gem install bundler
gem install jekyll-feed
gem install tzinfo-data
```

### jekyll init
```bash
jekyll new my-awesome-site
cd my-awesome-site
```

### jekyll exec
```bash
bundle exec jekyll serve
bundle add webrick

#!/bin/sh
bundle exec jekyll serve --host localhost --port 8088
bundle exec jekyll serve --skip-initial-build --host 0.0.0.0 --port 8088 > /dev/null 2>&1 &

#!/bin/sh
kill $(ps aux | grep '[j]ekyll' | awk '{print $2}')

yum install net-tools
netstat -tnlp
```
### docker-cp

```bash
docker cp centos-jekyll:/my-awesome-site ~/git/test
docker cp ~/git/guide centos-jekyll:/
```