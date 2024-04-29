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
wsl --unregister Ubuntu-22.04
wsl --install -d Ubuntu-22.04
wsl -l -v

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
