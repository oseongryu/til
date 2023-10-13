## ubuntu 선택후 설치
```
비밀번호는 App에서 확인
```

## 
```bash
sudo apt upgrade
sudo apt update
sudo apt net-tools
```

## ssh 설정
```bash
sudo apt install openssh-server -y
sudo systemctl enable ssh

sudo apt install vim -y
sudo vi /etc/ssh/sshd_config

# 1. Port 주석해제 및 포트변경 
# - '#Port 22' => 'Port 10022'
# - 시스템 포트 0 ~ 1023 번은 사용이 불가능
# 2. ListenAddress 값 주석 해제  
# - '#ListenAddress 0.0.0.0' => 'ListenAddress 0.0.0.0'
# 3. PasswordAuthentication 값 주석 해제
# - '#PasswordAuthentication yes' => 'PasswordAuthentication yes'

sudo service ssh start

sudo ufw allow 10022/tcp

/usr/lib/openssh/sftp-server
```

## sftp 설정
```bash

sudo vi /etc/ssh/sshd_config


Match LocalPort 10022
      X11Forwarding no
      AllowTcpForwarding no
      PermitTTY no
      ForceCommand cvs server


      X11Forwarding no
      AllowTcpForwarding no
      PermitTTY no
      ForceCommand cvs server

Subsystem       sftp    /usr/lib/openssh/sftp-server
```

## sftp 설정2
```bash
sudo apt install openssh-sftp-server

```