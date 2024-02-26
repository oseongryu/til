## Github Action

- 소프트웨어 workflow 자동화 도구

1. Workflow : 여러개의 Job로 구성되는 프로세스
2. Event : Workflow를 실행하는 규칙 (특정시간 반복)
3. Job : 여러 Step을 구성해서 실행
4. Step : action을 실행 (ssh-action, scp-action 등)

## Repository에 Github Action 추가

1. Github Repository > Actions > Java With Gradle > Configure
2. root 폴더에서 /.github/workflows/gradle.yml 생성 > Start commit
   (기본 생성은 build까지 됨)
3. GitAction Flow:

- JDK Setup > Build > Upload Jar(upload-artifact) > Kill Service(ssh-action) > Download Jar(download-artifact) > Upload File to Server (scp-action) > Run Jar (ssh-action)

- JDK Setup

```
    - uses: actions/checkout@v2
    - name: Set up JDK 11
      uses: actions/setup-java@v2
      with:
        java-version: '11'
        distribution: 'adopt'
```

- Build

```
    - name: Build with Gradle
      uses: gradle/gradle-build-action@4137be6a8bf7d7133955359dbd952c0ca73b1021
      with:
        arguments: build
```

- Upload Jar(upload-artifact)

```
    - name: Upload Jar
      uses: actions/upload-artifact@v2
      with:
        name: spring-boot
        path: build/libs/spring-0.0.1-SNAPSHOT.jar
        retention-days: 1
    - run: |
        rm -f ~/.gradle/caches/modules-2/modules-2.lock
        rm -f ~/.gradle/caches/modules-2/gc.properties
      name: Cleanup Gradle Cache
```

- Kill Service(ssh-action)

```
    - uses: appleboy/ssh-action@v0.1.4
      name: Kill Spring Boot Application
      with:
        host: ${{ secrets.SERV_HOST }}
        username: ${{ secrets.SERV_USERNAME }}
        password: ${{ secrets.SERV_KEY }}
        script: |
          if [ -e "pid.file" ]; then
            kill $(cat ./pid.file)
          fi
```

- Download Jar(download-artifact)

```
      - name: Download Jar
        uses: actions/download-artifact@v2
        with:
          name: spring-boot
```

- Upload File to Server (scp-action)

```
      - name: SCP Files
        uses: appleboy/scp-action@master
        with:
          host: ${{ secrets.SERV_HOST }}
          username: ${{ secrets.SERV_USERNAME }}
          password: ${{ secrets.SERV_KEY }}
          source: "spring-0.0.1-SNAPSHOT.jar"
          target: "build"
          rm: true
```

- Run Jar (ssh-action)

```
      - uses: appleboy/ssh-action@v0.1.4
        name: Run the application
        with:
          host: ${{ secrets.SERV_HOST }}
          username: ${{ secrets.SERV_USERNAME }}
          password: ${{ secrets.SERV_KEY }}
          script: |
            nohup java -jar build/spring-0.0.1-SNAPSHOT.jar > app.out 2> app.err < /dev/null &
            nohup echo $! > ./pid.file &

```

4. secrets.SERV_HOST 등의 설정은 Github Repository > Settings > Secrets에서 추가 (workflow내에 설정이 가능하지만 보안문제가 있을 수 있음)

5. Github Repository > Settings > Actions > 액션관련 설정 (Artifact and log retention을 7 days 정도로 설정하는 등 )

## Server (Ubuntu) 설정

1. jdk 설치

```bash
sudo apt install openjdk-11-jdk
java -version
```

2. mysql 설치

```bash
sudo apt-get install mysql-server
```

3. 외부접속 기능 설정 (3306 port open)

```bash
sudo ufw allow mysql
```

4. mysql 실행

```bash
sudo systemctl start mysql
```

5. 서버 재시작시 자동 실행

```bash
sudo systemctl enable mysql
```

6. mysql 접속

```bash
sudo /usr/bin/mysql -u root -p
```

7. 비밀번호 설정

```bash
SET PASSWORD FOR 'root'@'localhost' = PASSWORD('1234');
ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY '1234';
```

8. mysql schema 추가

```
CREATE DATABASE testdb;
```

9. 서버에 인바운드 포트 활성화

10. mysql 외부접속 안될 때

```bash
netstat -ntlp | grep mysqld
sudo /usr/bin/mysql -u root -p
mysql> show variables like '%bind%';
exit
cd /etc/mysql/mysql.conf.d
sudo vi mysqld.cnf
bind-address 변경 127.0.0.1 -> 0.0.0.0
systemctl restart mysql
systemctl status mysql
```

11. mysql 제거

```bash
sudo apt-get remove --purge mysql
sudo apt-get remove --purge mysql*
dpkg -l | grep mysql

sudo apt-get remove --purge mysql-apt-config

sudo rm -rf /etc/mysql /var/lib/mysql
sudo apt-get autoremove
sudo apt-get autoclean
```
