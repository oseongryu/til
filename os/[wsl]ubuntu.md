## wsl Ubuntu-22.04 setting

```bash
# https://linux.how2shout.com/how-to-install-default-ubuntu-22-04s-desktop-environment/
dism.exe /online /enable-feature /featurename:Microsoft-Windows-Subsystem-Linux /all /norestart
dism.exe /online /enable-feature /featurename:VirtualMachinePlatform /all /norestart
dism.exe /online /enable-feature /featurename:microsoft-hyper-v /all /norestart

# unregister
dism.exe /online /disable-feature /featurename:VirtualMachinePlatform
dism.exe /online /disable-feature /featurename:Microsoft-Windows-Subsystem-Linux
dism.exe /online /disable-feature /featurename:microsoft-hyper-v /all /norestart

# information
dism.exe /online /get-featureinfo /featurename:VirtualMachinePlatform

wsl --set-default-version 2


### wsl 삭제 후 재설치
wsl --unregister Ubuntu-22.04
wsl --install -d Ubuntu-22.04
wsl -l -v

### wsl GUI
### https://guiyomi.tistory.com/113
sudo apt update && apt -y upgrade

### systemd 확인
systemd
sudo vi /etc/wsl.conf

### wsl ubuntu-desktop
sudo apt install -y ubuntu-desktop
sudo apt -y install xfce4 # gdm3, lightdm (lightdm 선택)
sudo apt -y install xrdp

### xrdp 설정 변경
sudo cp /etc/xrdp/xrdp.ini /etc/xrdp/xrdp.ini.bak
sudo sed -i 's/3389/3390/g' /etc/xrdp/xrdp.ini
sudo sed -i 's/max_bpp=32/#max_bpp=32nmax_bpp=128/g' /etc/xrdp/xrdp.ini
sudo sed -i 's/xserverbpp=24/#xserverbpp=24nxserverbpp=128/g' /etc/xrdp/xrdp.ini

### xrdp 변경 확인
vi /etc/xrdp/xrdp.ini

### xrdp 재시작
sudo /etc/init.d/xrdp start

### xrdp 상태 확인
service xrdp status

### 포트확인
sudo apt install net-tools
netstat -tnlp
```

### ubuntu wsl + docker

```bash
# https://netmarble.engineering/docker-on-wsl2-without-docker-desktop/
curl -sSL get.docker.com | sh

grep -E 'sudo|wheel' /etc/group
sudo grep -E '%sudo|%wheel' /etc/sudoers
sudo usermod -aG docker $USER

echo '' >> ~/.profile
echo '# set DOCKER_HOST for docker default context' >> ~/.profile
echo 'wsl_ip=$(ip addr show eth0 | grep -oP "(?<=inet\s)\d+(\.\d+){3}")' >> ~/.profile
echo 'export DOCKER_HOST=tcp://$wsl_ip:2375' >> ~/.profile
sudo update-alternatives --config iptables
# Press <enter> to keep the current choice[*], or type selection number: 1
wsl --shutdown

```

```bat
@REM Windows 관리자 권한으로 bat로 실행
@echo Starting dockerd in WSL ...
@echo off
if exist nohup.out del /f /q nohup.out
for /f "tokens=1" %%a in ('wsl sh -c "hostname -I"') do set wsl_ip=%%a
netsh interface portproxy add v4tov4 listenport=2375 connectport=2375 connectaddress=%wsl_ip%

wsl -d Ubuntu-22.04 -u root -e sudo systemctl stop docker.socket
wsl -d Ubuntu-22.04 -u root -e sudo systemctl stop docker.service
wsl -d Ubuntu-22.04 -u root -e nohup sh -c "dockerd -H tcp://%wsl_ip% &"
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

## wsl

```bash
# https://ubuntu.com/tutorials/install-ubuntu-on-wsl2-on-windows-11-with-gui-support#1-overview
wsl --list --online
wsl --install -d Ubuntu-20.04
wsl -l -v

sudo apt update
sudo apt full-upgrade

# enable systemd
/etc/wsl.conf

sudo nano /etc/wsl.conf
[boot]
systemd=true

wsl --shutdown
```

## ubuntu use GUI

```bash
ubuntu config --default-user root
# root 로그인 후 비밀번호 변경
passwd
passwd oseongryu
ubuntu config --default-user oseongryu


# https://guiyomi.tistory.com/113
# wsl gui
sudo apt update && apt -y upgrade
sudo apt install -y ubuntu-desktop

# xfce4 xrdp
sudo apt -y install xfce4
sudo apt -y install xrdp
sudo cp /etc/xrdp/xrdp.ini /etc/xrdp/xrdp.ini.bak
sudo sed -i 's/3389/3390/g' /etc/xrdp/xrdp.ini
sudo sed -i 's/max_bpp=32/#max_bpp=32nmax_bpp=128/g' /etc/xrdp/xrdp.ini
sudo sed -i 's/xserverbpp=24/#xserverbpp=24nxserverbpp=128/g' /etc/xrdp/xrdp.ini

# xrdp 활성화
sudo /etc/init.d/xrdp start
sudo passwd [username]

# Starting xrdp (via systemctl): xrdp.service Failed to connect to bus: Connection refused
# https://superuser.com/questions/1628546/wsl2-run-xrdp-service-from-windows
# https://askubuntu.com/questions/234856/unable-to-do-remote-desktop-using-xrdp
wsl bash -c "sudo service xrdp start |cat"
wsl sudo "/etc/init.d/xrdp start"
sudo /etc/init.d/xrdp start

# xrdp 오류해결
# echo xfce4-session > ~/.xsession
sudo update-alternatives --config x-session-manager
```

## reset 2023.12.07.

```bash

https://docs.microsoft.com/ko-kr/windows/wsl/install-manual

wsl --update

wsl --install -d Ubuntu-22.04
wsl -l -v

sudo passwd root
su root

sudo apt update && apt -y upgrade
sudo apt install -y ubuntu-desktop
sudo reboot
```

### temp

```bash
# sudo service xrdp restart

# sudo systemctl enable --now xrdp

# sudo apt insatll xfce4-session

# free -h

# wget https://www.c-nergy.be/downloads/xrdp-installer-1.2.2.zip

# unzip xrdp-installer-1.2.2.zip

# sh xrdp-installer-1.2.2.sh
```
