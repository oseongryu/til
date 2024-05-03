### .wslconfig

외부서버접속위해서설정: https://velog.io/@bluejoyq/wsl-%EC%84%9C%EB%B2%84-%EC%99%B8%EB%B6%80-%EC%A0%91%EC%86%8D%ED%95%98%EA%B8%B0

```
[wsl2]
memory=8GB
processors=8
swap=4GB
localhostForwarding=true
[experimental]
networkingMode=mirrored
```

## wsl setting

```bash
# https://linux.how2shout.com/how-to-install-default-ubuntu-22-04s-desktop-environment/
dism.exe /online /enable-feature /featurename:VirtualMachinePlatform /all /norestart
dism.exe /online /enable-feature /featurename:Microsoft-Windows-Subsystem-Linux /all /norestart
dism.exe /online /enable-feature /featurename:microsoft-hyper-v /all /norestart

# unregister
dism.exe /online /disable-feature /featurename:VirtualMachinePlatform
dism.exe /online /disable-feature /featurename:Microsoft-Windows-Subsystem-Linux
dism.exe /online /disable-feature /featurename:microsoft-hyper-v

# information
dism.exe /online /get-featureinfo /featurename:VirtualMachinePlatform
dism.exe /online /get-featureinfo /featurename:Microsoft-Windows-Subsystem-Linux
dism.exe /online /get-featureinfo /featurename:microsoft-hyper-v

# wsl version 설정
wsl --set-default-version 2

### wsl 삭제 후 재설치
# https://docs.microsoft.com/ko-kr/windows/wsl/install-manual
# https://ubuntu.com/tutorials/install-ubuntu-on-wsl2-on-windows-11-with-gui-support#1-overview
wsl --list --online

wsl --unregister Ubuntu-22.04
wsl --install -d Ubuntu-22.04
wsl -l -v

wsl

# enable systemd
systemd
/etc/wsl.conf
sudo vi /etc/wsl.conf
[boot]
systemd=true

wsl --shutdown
```

### default-user

```bash
ubuntu config --default-user root
# root 로그인 후 비밀번호 변경
passwd
passwd oseongryu
ubuntu config --default-user oseongryu
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
