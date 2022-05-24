### Docker Setting

```bash
### hub에서 이미지 검색
docker search centos
### hub에서 이미지 다운로드
docker pull centos
### 로컬 이미지 목록
docker images

docker run -it --name hello centos /bin/bash

### 실행 중인 컨테이너 목록 + 중지목록 추가
docker ps -a

### 정지된 컨테이너 실행
docker start hadoop-base

### 컨테이너 접속
docker attach hadoop-base

### 컨테이너 정지
docker stop hadoop-base

### 컨테이너 삭제
docker rm hadoop-base

### docker 이미지 삭제
docker rmi centos

```

### OS Setting 

```bash
docker -it --name hadoop-base centos
yum update
yum install wget -y
yum install vim -y
yum install java-1.8.0-openjdk-devel.x86_64 -y

java -version

which java
readlink -f "/usr/bin/java"

vi ~/.bashrc


### ~/.bashrc
export JAVA_HOME=/usr/lib/jvm/java-1.8.0-openjdk-1.8.0.312.b07-2.el8_5.x86_64
export PATH=$PATH:$JAVA_HOME/bin
export JAVA_OPTS="-Dfile.encoding=UTF-8"
export CLASSPATH="."

source ~/.bashrc

* Cannot prepare internal mirrorlist: No URLs in mirrorlist
sudo sed -i -e "s|mirrorlist=|#mirrorlist=|g" /etc/yum.repos.d/CentOS-*
sudo sed -i -e "s|#baseurl=http://mirror.centos.org|baseurl=http://vault.centos.org|g" /etc/yum.repos.d/CentOS-*

```

### Haddop Setting
```bash
### hadoop 홈 디렉토리로 쓸 디렉토리 생성
mkdir /hadoop_home
cd /hadoop_home
# hadoop 다운로드 후 압축풀기
wget https://mirrors.sonic.net/apache/hadoop/common/hadoop-3.3.1/hadoop-3.3.1.tar.gz
tar xvzf hadoop-3.3.1.tar.gz

vim ~/.bashrc

### ~/.bashrc
export HADOOP_HOME=/hadoop_home/hadoop-3.3.1
export HADOOP_CONFIG_HOME=$HADOOP_HOME/etc/hadoop
export PATH=$PATH:$HADOOP_HOME/bin:$HADOOP_HOME/sbin

source ~/.bashrc

hadoop version

hadoop jar $HADOOP_HOME/share/hadoop/mapreduce/hadoop-mapreduce-examples-3.3.1.jar wordcount $HADOOP_HOME/LICENSE.txt wordcount_output
hadoop jar share/hadoop/mapreduce/hadoop-mapreduce-examples-3.3.1.jar wordcount /test /test_out


```

### Docker Setting
### 새로운 터미널에서
```bash
yum install openssh-server openssh-clients openssh-askpass -y
ssh-keygen -f /etc/ssh/ssh_host_rsa_key -t rsa -N ""
ssh-keygen -f /etc/ssh/ssh_host_ecdsa_key -t ecdsa -N ""
ssh-keygen -f /etc/ssh/ssh_host_ed25519_key -t ed25519 -N ""

vim ~/.bashrc

### ~/.bashrc
/usr/sbin/sshd

source ~/.bashrc

ssh-keygen -t rsa -P '' -f ~/.ssh/id_dsa
cat ~/.ssh/id_dsa.pub >> ~/.ssh/authorized_keys
ssh localhost


### 하둡 설정 파일들이 있는 디렉토리로 이동
cd $HADOOP_CONFIG_HOME
### hadoop-env.sh 열기
vim hadoop-env.sh

export JAVA_HOME=/usr/lib/jvm/java-1.8.0-openjdk-1.8.0.312.b07-2.el8_5.x86_64
export HDFS_NAMENODE_USER="root"
export HDFS_DATANODE_USER="root"
export HDFS_SECONDARYNAMENODE_USER="root"
export YARN_RESOURCEMANAGER_USER="root"
export YARN_NODEMANAGER_USER="root"


mkdir /opt/hadoop_home/temp
mkdir /opt/hadoop_home/namenode
mkdir /opt/hadoop_home/datanode

### 1. core-site.xml: HDFS와 MapReduce에서 공통적으로 사용할 환경정보
### 2. hdfs-site.xml: HDFS에서 사용할 환경정보
### 3. mapred-site.xml: MapReduce에서 사용할 환경정보
cd $HADOOP_CONFIG_HOME

vim core-site.xml
<configuration>
    <property>
        <name>hadoop.tmp.dir</name>
        <value>/opt/hadoop_home/temp</value>
    </property>

    <property>
        <name>fs.default.name</name>
        <value>hdfs://localhost:9000</value>
        <final>true</final>
    </property>
</configuration>


vim hdfs-site.xml
<configuration>
    <property>
        <name>dfs.replication</name>
        <value>1</value>
        <final>true</final>
    </property>

    <property>
        <name>dfs.namenode.name.dir</name>
        <value>/opt/hadoop_home/namenode_home</value>
        <final>true</final>
    </property>

    <property>
        <name>dfs.datanode.data.dir</name>
        <value>/opt/hadoop_home/datanode_home</value>
        <final>true</final>
    </property>
</configuration>


vim mapred-site.xml
<configuration>
    <property>
        <name>mapred.job.tracker</name>
        <value>localhost:9001</value>
    </property>
</configuration>

hadoop namenode -format

docker commit hadoop-base centos:hadoop


start-all.sh
jps

docker run -it --name hadoop-base -p 9870:9870 centos:hadoop



```

### HUE Setting
```bash
yum -y install python2-devel sqlite-devel libxml2-devel libxslt-devel libffi-devel openssl-devel openldap-devel gmp-devel gcc gcc-c++

```


### HUE 사용

```
1. Query Editor : Sql 실행가능
2. Table Browser : Table 내역 조회
3. Workflows : Batch 구성요소 관리
    - Workflows > 대시보드 : Batch 등록 내역 조회
    - Workflows > 편집기 : Batch 등록 내역 편집
    - Workflows > 편집기 > Workflow : Batch 구성 요소 관리, 배치 재실행 
    - Workflows > 편집기 > Coordinator : Batch 수행 주기/시간 관리
4. 파일브라우저 : Batch 에서 실행될 sql 확인 및 편집
5. Job Browser : Batch 실행 log 확인
```

### References

https://taaewoo.tistory.com/22?category=862614
https://mungiyo.tistory.com/16
https://blog.acronym.co.kr/329?category=398102