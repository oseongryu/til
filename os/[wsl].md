### .wslconfig

외부서버접속위해서설정:
https://velog.io/@bluejoyq/wsl-%EC%84%9C%EB%B2%84-%EC%99%B8%EB%B6%80-%EC%A0%91%EC%86%8D%ED%95%98%EA%B8%B0

```
[wsl2]
memory=16GB
processors=8
swap=4GB
localhostForwarding=true
```

## wsl setting

```powershell
# cmd 관리자 권한으로 진행
# https://linux.how2shout.com/how-to-install-default-ubuntu-22-04s-desktop-environment/
dism.exe /online /enable-feature /featurename:VirtualMachinePlatform /all /norestart
dism.exe /online /enable-feature /featurename:Microsoft-Windows-Subsystem-Linux /all /norestart
# dism.exe /online /enable-feature /featurename:microsoft-hyper-v /all /norestart

# information
dism.exe /online /get-featureinfo /featurename:VirtualMachinePlatform
dism.exe /online /get-featureinfo /featurename:Microsoft-Windows-Subsystem-Linux
# dism.exe /online /get-featureinfo /featurename:microsoft-hyper-v-all

# unregister
dism.exe /online /disable-feature /featurename:VirtualMachinePlatform
dism.exe /online /disable-feature /featurename:Microsoft-Windows-Subsystem-Linux
# dism.exe /online /disable-feature /featurename:microsoft-hyper-v-all

# linux kernel setting
https://docs.microsoft.com/ko-KR/windows/wsl/wsl2-kernel

# wsl version 설정
wsl --set-default-version 2

### wsl 삭제 후 재설치
# https://docs.microsoft.com/ko-kr/windows/wsl/install-manual
# https://ubuntu.com/tutorials/install-ubuntu-on-wsl2-on-windows-11-with-gui-support#1-overview

# list
wsl --list --online
# install
wsl --install -d Ubuntu-20.04

# version, install list
wsl -l -v

wsl

# version 선택
wsl --set-default Ubuntu-20.04

# remove
wsl --unregister Ubuntu-20.04

# enable systemd
systemd
/etc/wsl.conf
sudo vi /etc/wsl.conf
[boot]
systemd=true

wsl --shutdown
```

### default-user (ubuntu20.04는 ubuntu2004)

```bash
ubuntu config --default-user root
# root 로그인 후 비밀번호 변경
passwd
passwd oseongryu
ubuntu config --default-user oseongryu
```

### docker

```bash
# https://netmarble.engineering/docker-on-wsl2-without-docker-desktop/
curl -sSL get.docker.com | sh
docker --version

# sudo 권한설정
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

### docker setting

```bash
[Environment]::GetEnvironmentVariable('DOCKER_HOST', 'Machine')
[Environment]::SetEnvironmentVariable('DOCKER_HOST', 'tcp://localhost:2375', 'Machine')

docker 실행프로그램 연결

sudo vi /etc/docker/daemon.json

---/etc/docker/daemon.json
{
    "hosts": [
        "fd://",
        "unix:///var/run/docker.sock",
        "tcp://0.0.0.0:2375"
    ]
}
---

sudo vi /lib/systemd/system/docker.service

---/lib/systemd/system/docker.service
#ExecStart=/usr/bin/dockerd -H fd:// --containerd=/run/containerd/containerd.sock
ExecStart=/usr/bin/dockerd --containerd=/run/containerd/containerd.sock
---

sudo systemctl daemon-reload
sudo systemctl restart docker.service
```

#### wsl 백그라운드 실행 + docker mapping (작업 스케줄러에 추가하는 방식도 가능)

```bat
@REM Windows 관리자 권한으로 bat로 실행
@REM wsl 백그라운드에서 계속 실행중이어야 함
@echo Starting dockerd in WSL ...
@echo off
for /f "tokens=1" %%a in ('wsl -d Ubuntu sh -c "hostname -I"') do set wsl_ip=%%a
netsh interface portproxy add v4tov4 listenport=2375 connectport=2375 connectaddress=%wsl_ip%
powershell.exe -Command "start-process wsl.exe -WindowStyle Hidden"
```

#### wsl 실행 확인 프로세스종료

```bash
Get-Process | Where-Object { $_.Name -like '*wsl*' }
Stop-Process -ID 9488
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
