### Nginx Setting

```bash

cd etc/yum.repos.d/
vi nginx.repo

---
[nginx]
name=nginx repo
baseurl=http://nginx.org/packages/centos/7/$basearch/
gpgcheck=0
enabled=1
---

yum install -y nginx

firewall-cmd --permanent --zone=public --add-port=80/tcp
firewall-cmd --permanent --zone=public --add-port=8080/tcp
firewall-cmd --permanent --zone=public --add-port=443/tcp
firewall-cmd --permanent --zone=public --add-port=8443/tcp
firewall-cmd --reload
firewall-cmd --list-ports
firewall-cmd --list-all

firewall-cmd --permanent --zone=public --add-forward-port=port=443:proto=tcp:toport=8443
firewall-cmd --reload
firewall-cmd --list-all

firewall-cmd --permanent --zone=public --remove-forward-port=port=443:proto=tcp:toport=8443
firewall-cmd --reload
firewall-cmd --list-all


vi /etc/nginx/conf.d/default.conf

systemctl start nginx
systemctl enable nginx

```

### Nginx SSL

```bash
1. 파일합치기
cat [도메인인증서] [체인인증서] [루트인증서] > [도메인명.pem](원하는 이름)

반드시 vi이나 vim 명령어로 강제 개행

2.
vi /etc/nginx/site-available/default

---
server {
        listen 443 ssl;
        server_name [도메인명];

        ssl on;
        ssl_certificate [세가지 인증서 합친 파일 경로];
        ssl_certificate_key [개인키 파일 경로];
        ssl_prefer_server_ciphers on;
        location / {
                proxy_pass http://127.0.0.1:3000;(노드 서버 실행을 위한 proxy_pass 설정)
        }
}

=====

upstream api {
    server 192.168.0.1:8080;
}

server {
    listen 80;
    location / {
        proxy_pass http://api;
    }
}
server {
    listen 443 ssl;
    server_name test.com;
    ssl on;
    ssl_certificate test.pem;
    ssl_certificate_key test.key;
    ssl_prefer_server_ciphers on;
    location / {
        proxy_pass http://192.168.0.1:8080;
    }
}

======
/etc/nginx/conf.d

openssl rsa -in [기존인증서파일] -out [새로운인증서파일]
---
vi /etc/nginx/conf.d/default.conf
service nginx start
systemctl stop nginx

systemctl restart nginx
systemctl stop nginx
systemctl start nginx

tail -f /var/log/nginx/error.log

* (13: Permission denied) while connecting to upstream

setsebool -P httpd_can_network_connect 1

vi /etc/nginx/nginx.conf

* fopen:Permission denied
```

### References

```
https://velog.io/@twkim8548/Nginx%EC%97%90%EC%84%9C-SSL-%EC%A0%81%EC%9A%A9%ED%95%B4%EC%84%9C-Https-%EB%A1%9C-%EC%A0%91%EC%86%8D-%EB%90%98%EA%B2%8C-%ED%95%B4%EB%B3%BC%EA%B9%8C

https://stackoverflow.com/questions/5877929/what-does-upstream-mean-in-nginx

https://cert.crosscert.com/nginx-ssl%EC%9D%B8%EC%A6%9D%EC%84%9C-%EC%84%A4%EC%B9%98-%EB%A7%A4%EB%89%B4%EC%96%BC/

```
