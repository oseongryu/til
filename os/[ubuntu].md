### ubuntu GUI

```bash
# https://guiyomi.tistory.com/113
# https://hermeslog.tistory.com/498
# https://mungiyo.tistory.com/22

# wsl gui
sudo apt update && sudo apt -y upgrade
sudo apt install -y ubuntu-desktop


### systemd 확인
systemd
sudo vi /etc/wsl.conf

# xfce4 xrdp
sudo apt -y install xfce4 # gdm3, lightdm (lightdm 선택)
#area: 6, 69, display mamger: lightdm

sudo apt -y install xrdp

sudo cp /etc/xrdp/xrdp.ini /etc/xrdp/xrdp.ini.bak
sudo sed -i 's/3389/13389/g' /etc/xrdp/xrdp.ini
sudo sed -i 's/max_bpp=32/#max_bpp=32nmax_bpp=128/g' /etc/xrdp/xrdp.ini
sudo sed -i 's/xserverbpp=24/#xserverbpp=24nxserverbpp=128/g' /etc/xrdp/xrdp.ini

# xrdp 변경 확인
vi /etc/xrdp/xrdp.ini


# xrdp 활성화
sudo /etc/init.d/xrdp start
sudo passwd [username]

sudo reboot

# xrdp 상태 확인
service xrdp status


# xrdp 오류 해결
sudo vi /etc/xrdp/startwm.sh

unset DBUS_SESSION_BUS_ADDRESS
unset XDG_RUNTIME_DIR

sudo systemctl restart xrdp

# 환경설정

echo "xfce4-session" > ~/.xsession
cat ~/.xsession # 정상변경여부 확인


# # Starting xrdp (via systemctl): xrdp.service Failed to connect to bus: Connection refused
# # https://superuser.com/questions/1628546/wsl2-run-xrdp-service-from-windows
# # https://askubuntu.com/questions/234856/unable-to-do-remote-desktop-using-xrdp
# wsl bash -c "sudo service xrdp start |cat"
# wsl sudo "/etc/init.d/xrdp start"
# sudo /etc/init.d/xrdp start

# # xrdp 오류해결
# # echo xfce4-session > ~/.xsession
# sudo update-alternatives --config x-session-manager
```

#### wsl portainer

```bash
# https://docs.docksal.io/use-cases/portainer/
# install
docker volume create portainer_data
docker run --name portainer -d -v /var/run/docker.sock:/var/run/docker.sock -v portainer_data:/data --label='io.docksal.virtual-host=portainer.*' --label=io.docksal.virtual-port=9000 portainer/portainer -H unix:///var/run/docker.sock

# use
# http://portainer.docksal

#uninstall
docker rm -vf portainer
docker volume rm -f portainer_data
```

### google cloud ubuntu 20.04

```bash
sudo apt update
sudo apt upgrade
# sudo apt install -y ubuntu-desktop
# sudo apt install slim
# sudo reboot
# sudo service slim start
# sudo cp /etc/xrdp/xrdp.ini /etc/xrdp/xrdp.ini.bak
# sudo apt-get install xrdp
# sudo cp /etc/xrdp/xrdp.ini /etc/xrdp/xrdp.ini.bak
# sudo sed -i 's/3389/3389/g' /etc/xrdp/xrdp.ini
# sudo sed -i 's/max_bpp=32/#max_bpp=32nmax_bpp=128/g' /etc/xrdp/xrdp.ini
# sudo sed -i 's/xserverbpp=24/#xserverbpp=24nxserverbpp=128/g' /etc/xrdp/xrdp.ini
# sudo /etc/init.d/xrdp start
sudo passwd oseongryu
sudo passwd ubuntu
sudo passwd root
sudo apt install net-tools
netstat -tnlp
```

## ubuntu chrome-remote-desktop

```bash
# https://medium.com/@selvamraju007/install-and-launch-ubuntu-22-04-desktop-on-google-cloud-1fba8c0f9585
wget https://dl.google.com/linux/direct/chrome-remote-desktop_current_amd64.deb
sudo apt-get install --assume-yes ./chrome-remote-desktop_current_amd64.deb
sudo apt update && sudo apt upgrade
sudo apt install slim
sudo apt install ubuntu-desktop
sudo reboot
sudo service slim start

sudo passwd

# 3389 설정
# sudo apt update
# sudo apt install xrdp -y

# sudo systemctl status xrdp

# sudo nano /etc/xrdp/xrdp.ini
# port=49952
# sudo systemctl restart xrdp

# sudo ufw status
# sudo ufw enable
# sudo ufw allow 49952/tcp
# sudo ufw reload
```

##

```bash
scp -P 22 ~/.ssh/id_rsa gcp-root:/home/oseongryu/.ssh
scp -P 22 ~/.ssh/id_rsa.pub gcp-root:/home/oseongryu/.ssh
scp -P 22 ~/.ssh/drawing-app.war gcp-root:/home/oseongryu/.ssh
nohup java -jar /home/oseongryu/.ssh/drawing-app.war 1>/dev/null 2>&1

```

## ubuntu python setting

```bash
sudo apt-get update
sudo apt-get upgrade python3

sudo apt install python3-pip

sudo apt install python3-tk python3-dev
pip install selenium
pip install webdriver_manager
pip install pyautogui
# error The confidence keyword argument is only available if OpenCV is installed
pip install opencv-python

pip install -r requirements.txt

# https://stackoverflow.com/questions/73830524/attributeerror-module-lib-has-no-attribute-x509-v-flag-cb-issuer-check
sudo apt remove python3-pip
wget https://bootstrap.pypa.io/get-pip.py
sudo python3 get-pip.py
sudo reboot
pip install pyopenssl --upgrade

pip install python-xlib
sudo apt install python-tk

# ubuntu cli에서 pyautogui 사용방법
# https://linuxhint.com/install-xvfb-ubuntu/
sudo apt install xvfb
sudo apt install scrot

sudo apt-get install fonts-indic
sudo apt-get install font-noto
sudo apt-get install fonts-noto-cjk

sudo timedatectl set-timezone Asia/Seoul
```

## ubuntu java gradle setting

```bash
sudo apt-get install openjdk-8-jdk
chmod +x gradlew
./gradlew bootWar
```

## ubuntu setting

```bash
# GUI
Ctrl + h
```

## ubuntu chrome

```bash
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo apt install ./google-chrome-stable_current_amd64.deb
/usr/bin/google-chrome-stable
```

### chrome update

```bash
cat /etc/apt/sources.list.d/google-chrome.list
# ### THIS FILE IS AUTOMATICALLY CONFIGURED ###
# # You may comment out this entry, but any other modifications may be lost.
# deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main
```

## ubuntu vscode

```bash
sudo snap install --classic code
code --version


# sudo apt update
# wget -q https://packages.microsoft.com/keys/microsoft.asc -O- | sudo apt-key add -
# sudo add-apt-repository "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main"
# sudo apt install code


# https://code-designer.tistory.com/8
# https://code.visualstudio.com/

# cd Downloads
# sudo apt install ./code_1.84.2-1699528352_amd64.deb

# sudo apt remove code

# # 사용자 환경 폴더
# Windows %APPDATA%\Code
# macOS $HOME/Library/Application Support/Code
# Linux $HOME/.config/Code
# # 확장팩이 설치된 폴더의 위치는 다음과 같습니다.
# Windows %USERPROFILE%\.vscode\extensions
# macOS ~/.vscode/extensions
# Linux ~/.vscode/extensions

# # https://rottk.tistory.com/entry/VSCode-%EC%84%A4%EC%B9%98%EB%90%9C-VSCode-Portable-%EB%B2%84%EC%A0%84%EC%9C%BC%EB%A1%9C-%EC%A0%84%ED%99%98%ED%95%98%EA%B8%B0
# cd ~
# wget https://update.code.visualstudio.com/1.56.2/linux-x64/stable -O code-stable-x64-1620838810.tar.gz

# tar -xvf code-stable-x64-1620838810.tar.gz
# rm code-stable-x64-1620838810.tar.gz

# cd VSCode-linux-x64
# mkdir data

# # 사용자 설정 파일을 복사합니다.
# sudo cp ~/.config/Code ./data -r
# mv data/Code ./data/user-data

# # 설치했던 확장팩을 복사합니다.
# sudo cp ~/.vscode/extensions/ ./data -r

# # 생성한 폴더의 사용권한을 부여합니다.
# sudo chmod o+wx data
# sudo chown -R osryu:google-sudoers data
# sudo snap install --classic code
```

## ubuntu docker

```bash
# https://stackoverflow.com/questions/40658095/how-to-open-ubuntu-gui-inside-a-docker-image
# https://shanepark.tistory.com/237

sudo apt-get install \
 ca-certificates \
 curl \
 gnupg \
 lsb-release

curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg

echo \
 "deb [arch=amd64 signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu \
 $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
```

#### ubuntu docker-compose

```ps1
# windows
# https://docs.docker.com/compose/install/standalone/
Start-BitsTransfer -Source "https://github.com/docker/compose/releases/download/v2.26.1/docker-compose-windows-x86_64.exe" -Destination $Env:ProgramFiles\Docker\docker-compose.exe

# wsl ubuntu
sudo curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo apt install -y docker-compose
sudo chmod +x /usr/local/bin/docker-compose
docker-compose --version
```

## customize dock panel

```bash
sudo apt install dconf-editor

# https://linuxconfig.org/how-to-customize-dock-panel-on-ubuntu-20-04-focal-fossa-linux
gsettings set org.gnome.shell.extensions.dash-to-dock extend-height false
gsettings set org.gnome.shell.extensions.dash-to-dock dock-position BOTTOM
gsettings set org.gnome.shell.extensions.dash-to-dock transparency-mode FIXED
gsettings set org.gnome.shell.extensions.dash-to-dock dash-max-icon-size 64
gsettings set org.gnome.shell.extensions.dash-to-dock unity-backlit-items true
```

### mac

```bash
docker pull ubuntu:20.04
docker run -it -p 8089:8089 --privileged --restart=always --name my-ubuntu ubuntu:20.04
docker run -it -p 8081:8089 --platform linux/amd64 --privileged --restart=always --name my-ubuntu ubuntu:20.04
docker run -it -p 8082:8089 --privileged --restart=always --name my-ubuntu2 ubuntu:20.04

docker exec -it my-ubuntu bash

sudo docker cp /Users/oseongryu/.ssh/id_rsa my-ubuntu:/root/.ssh/
sudo docker cp /Users/oseongryu/.ssh/id_rsa.pub my-ubuntu:/root/.ssh/

apt install chromium-browser
apt-get install chromium-chromedriver
apt-get update
apt-get upgrade -y
apt-get install build-essential gdb
apt install chromium-shell
snap install chromium

systemctl unmask snapd.service
systemctl enable snapd.service
systemctl start snapd.service
/usr/lib/snapd/snapd &

apt-get update

apt-get upgrade python3
apt install python3-pip
apt install python3-tk python3-dev
pip install selenium
pip install webdriver_manager
pip install pyautogui
pip install opencv-python
apt remove python3-pip
wget https://bootstrap.pypa.io/get-pip.py
python3 get-pip.py
reboot
pip install pyopenssl --upgrade
pip install python-xlib

# https://codetryout.com/google-chrome-following-packages-have-unmet-dependencies/
apt install wget
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
apt install ./google-chrome-stable_current_amd64.deb


apt install python-tk
apt install xvfb
apt install scrot

python3 /root/git/python-selenium/selenium/service.py 0
```

## ssl (with springboot)

```bash
# https://velog.io/@jiwon615/Spring-Boot%EC%97%90-Lets-Encrypt-SSL-%EC%A0%81%EC%9A%A9%EA%B8%B0
sudo apt-get install certbot
sudo certbot certonly --standalone
sudo certbot certonly --standalone --register-unsafely-without-email

# /etc/letsencrypt/live/도메인/ (fullchain.pem, privkey.pen)

sudo openssl pkcs12 -export -in fullchain.pem -inkey privkey.pem -out keystore.p12 -name ttp -CAfile chain.pem -caname root

# 배포 후 root 권한으로 실행하는게 아니면 RFC 규약에 의하여 1024미만 포트는 root만 가능하므로 리다이렉션처리 (nginx 설치후 리다이렉트를 진행하는 방식 추천)
sudo iptables -t nat -A PREROUTING -p tcp --dport 443 -j REDIRECT --to-port 8089

# 목록
sudo iptables -t nat -L PREROUTING --line-numbers
# iptables 삭제 번호
sudo iptables -t nat -D PREROUTING 3


# 인증서 자동갱신
# Crontab 보기
sudo crontab -l
# Crontab 편집
sudo crontab -e
0 2 1 * * /usr/bin/certbot renew

sudo certbot certificates
sudo certbot renew --dry-run

```

## ssl (with nginx)

```bash
# https://velog.io/@gudcks0305/%EC%9A%B0%EB%B6%84%ED%88%AC%EC%97%90%EC%84%9C-Nginx%EB%A1%9C-Reverse-Proxy-%EC%84%A4%EC%A0%95%ED%95%98%EA%B8%B0
upstream backend {
    server 127.0.0.1:8089;
}

# server {
#     listen 80;
#     server_name gptinfo.co.kr;
#     location / {
#         proxy_pass http://backend/;
#     }
# }

server {
    listen 80;
    server_name gptinfo.co.kr;
    if ($host = gptinfo.co.kr) {
        return 301 https://$host$request_uri;
    }
    return 404;
}

server {
    listen 443 ssl;
    server_name gptinfo.co.kr;
    ssl on;
    ssl_certificate /etc/letsencrypt/live/gptinfo.co.kr/fullchain.pem;
    ssl_certificate_key /etc/letsencrypt/live/gptinfo.co.kr/privkey.pem;
    location / {
        proxy_pass http://backend/;
        proxy_set_header HOST $http_host;
        proxy_set_header X-Real-IP $remote_addr;
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
        proxy_set_header X-Forwarded-Proto $scheme;
        proxy_redirect off;
        charset utf-8;
    }
}

```

### temp

```bash
# apt install slim
# cat /etc/X11/default-display-manager
# apt install lightdm
# apt install ubuntu-desktop
# reboot
# # delete GUI diplay manager
# apt remove slim lxde
# # 불필요한 종속성제외
# apt autoremove
# service slim start
# /etc/init.d/xrdp stop
# /etc/init.d/xrdp start
```
