## Repository에 Github Action 추가

1. Github Repository > Actions > Java With Gradle > Configure
2. root 폴더에서 /.github/workflows/gradle.yml 생성 > Start commit
   (기본 생성은 build까지 됨)
3. GitAction Flow:

- JDK Setup > Build > Upload Jar(upload-artifact) > Kill Service(ssh-action) > Download Jar(download-artifact) > Upload File to Server (scp-action) > Run Jar (ssh-action)

4. secrets.SERV_HOST 등의 설정은 Github Repository > Settings > Secrets에서 추가 (workflow내에 설정이 가능하지만 보안문제가 있을 수 있음)

5. Github Repository > Settings > Actions > 액션관련 설정 (Artifact and log retention을 7 days 정도로 설정하는 등 )

## Server (Ubuntu) 설정

1. jdk 설치
   sudo apt install openjdk-11-jdk
   java -version

2. mysql 설치

sudo apt-get install mysql-server

3. 외부접속 기능 설정 (3306 port open)

sudo ufw allow mysql

4. mysql 실행

sudo systemctl start mysql

5. 서버 재시작시 자동 실행

sudo systemctl enable mysql

6. mysql 접속

sudo /usr/bin/mysql -u root -p

7. 비밀번호 설정
   SET PASSWORD FOR 'root'@'localhost' = PASSWORD('1234');
   ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY '1234';

8. mysql schema 추가
   CREATE DATABASE testdb;

9. 서버에 인바운드 포트 활성화
