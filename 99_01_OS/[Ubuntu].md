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
apt install net-tools
sudo apt install net-tools
netstat -tnlp

```



##

```bash
# https://medium.com/@selvamraju007/install-and-launch-ubuntu-22-04-desktop-on-google-cloud-1fba8c0f9585
wget https://dl.google.com/linux/direct/chrome-remote-desktop_current_amd64.deb
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

## python
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
https://stackoverflow.com/questions/40658095/how-to-open-ubuntu-gui-inside-a-docker-image


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


# sudo apt update
# sudo apt install x11-apps
# xeyes &
# xcalc

# https://guiyomi.tistory.com/113
# wsl gui
sudo apt update && apt -y upgrade
sudo apt install -y ubuntu-desktop

# xfce4 xrdp
sudo apt -y install xfce4
sudo apt-get install xrdp
sudo cp /etc/xrdp/xrdp.ini /etc/xrdp/xrdp.ini.bak
sudo sed -i 's/3389/3390/g' /etc/xrdp/xrdp.ini
sudo sed -i 's/max_bpp=32/#max_bpp=32nmax_bpp=128/g' /etc/xrdp/xrdp.ini
sudo sed -i 's/xserverbpp=24/#xserverbpp=24nxserverbpp=128/g' /etc/xrdp/xrdp.ini

# xrdp 활성화
sudo /etc/init.d/xrdp start
sudo passwd [username]

# xrdp 오류해결
# echo xfce4-session > ~/.xsession
sudo update-alternatives --config x-session-manager
```

## reset 2023.12.07.
```bash
# https://linux.how2shout.com/how-to-install-default-ubuntu-22-04s-desktop-environment/
dism.exe /online /enable-feature /featurename:Microsoft-Windows-Subsystem-Linux /all /norestart
dism.exe /online /enable-feature /featurename:VirtualMachinePlatform /all /norestart
wsl --set-default-version 2

https://docs.microsoft.com/ko-kr/windows/wsl/install-manual

wsl --update

wsl --install -d Ubuntu-22.04
wsl -l -v
wsl -v -v

sudo passwd root
su root

sudo apt update && apt -y upgrade
sudo apt install -y ubuntu-desktop
sudo reboot
```