### theme

```
Community Material Theme
Github Plus Theme
One Dark Pro
Panda Theme
```

### vscode 노트용과 개발용 분리해서 사용하기

```
vscode 와 vscode-insider를 사용
```

### vscodium

```
Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))

choco install vscodium
choco uninstall vscodium

choco install vscodium.portable
choco uninstall vscodium.portable

choco list --localonly
```

### vscode setting

```
Explorer > TIMELIE > Filter TimeLine
Local History 제외 또는 추가 (커밋내용으로만 찾고싶을경우 해제)

Source Control > Views and More Actions > View & Sort > View as Tree (Check)

```

#### vscode Format on save, Format On Type 해제

```
File > Preperences > Settings > Text Editor > Formatting > Format On Save (unChecked)
File > Preperences > Settings > Text Editor > Formatting > Format On Type (unChecked)
```

#### VSCode Show Whitespace

```
File > Preperences > Settings > Users Tab > Text Editor > Render Whitespace > all (selection)
```

#### VSCode Trim Trailing Whitespace

```
File > Preperences > Settings > Users Tab > Text Editor > Files > Trim Trailing Whitespace(Check)

```

### vscode 상단 타이틀 바에 경로 표시하기

```
File > Preperences > Settings > window.title

default: ${dirty}${activeEditorShort}${separator}${rootName}${separator}${appName}

${dirty}${rootName}${separator}${folderPath}
```

#### vscode settings.json

```
Windows Path:
./data/user-data/User (Portable)
%AppData%/Roaming/Code/User/settings.json (Excute)

Mac Path:
~/Library/Application Support/Code/User/settings.json (Excute)
```

#### Tab or Space

```
우측 하단 Tab Size, Spaces 선택 후 변경
Indent Using Spaces
Indent Using Tabs
```

#### OpenActive File in New Window

```
View > Commnad Palette > File:OpenActive File in New Window
단축키등록
```

#### vscode extension export

```
# cmd
code --list-extensions | % { "code --install-extension $_" }

# bash
code --list-extensions | xargs -L 1 echo code --install-extension

C:\Program Files\Microsoft VS Code\bin
C:\DEV\tools\VSCode-win32-x64-1.82.2\bin
```

#### vscode vue extension

```bash
# recommand
code --install-extension aethli.camelgobrr
code --install-extension alefragnani.Bookmarks
code --install-extension alefragnani.project-manager
code --install-extension dbaeumer.vscode-eslint
code --install-extension esbenp.prettier-vscode
code --install-extension hollowtree.vue-snippets
code --install-extension jasonnutter.search-node-modules
code --install-extension mhutchie.git-graph
code --install-extension octref.vetur
code --install-extension PKief.material-icon-theme
code --install-extension sdras.vue-vscode-snippets
code --install-extension shd101wyy.markdown-preview-enhanced
code --install-extension techer.open-in-browser
code --install-extension Tobermory.es6-string-html
code --install-extension Vue.volar

#### javascript, vue
code --install-extension techer.open-in-browser
code --install-extension xabikos.JavaScriptSnippets
code --install-extension esbenp.prettier-vscode
code --install-extension hollowtree.vue-snippets
code --install-extension sdras.vue-vscode-snippets
code --install-extension Tobermory.es6-string-html
code --install-extension Vue.volar
code --install-extension octref.vetur
code --install-extension dbaeumer.vscode-eslint
code --install-extension jasonnutter.search-node-modules

##### java + springboot (Extension Pack for Java, Spring Boot Extension Pack)
code --install-extension vscjava.vscode-java-pack
code --install-extension vmware.vscode-boot-dev-pack
code --install-extension vscjava.vscode-gradle
code --install-extension niko.vsc-mybatis

#### camel
code --install-extension aethli.camelgobrr

#### etc
code --install-extension codezombiech.gitignore
code --install-extension donjayamanne.git-extension-pack
code --install-extension donjayamanne.githistory
code --install-extension eamodio.gitlens
code --install-extension hollowtree.vue-snippets
code --install-extension huizhou.githd
code --install-extension ms-vsliveshare.vsliveshare
code --install-extension ziyasal.vscode-open-in-github
code --install-extension yandeu.five-server
code --install-extension adamhartford.vscode-base64
#### mac
code --install-extension smcpeak.default-keys-windows

#### note
vsnotes

```

### vscode camel

```json
{
  "camelgobrr.cases": ["kebab-case", "CamelCase", "camelCase", "Space Case", "SPACE CASE", "space case", "SNAKE_CASE", "snake_case"]
}
```

### vscode spring boot 설정

```
.\gradlew
.\gradlew bootRun

.\gradlew bootRun -PjvmArgs="-Dspring.profiles.active=local"
.\gradlew bootRun -PjvmArgs=-Dspring.profiles.active=local

bootRun {
    if ( project.hasProperty('jvmArgs') ) {
        jvmArgs project.jvmArgs.split('\\s+')
    }
}

```

### vscode shortcut

```
ctrl + d
ctrl + shift + l

```

### vscode install version to portable (windows)

```
C:\Users\osryu\.vscode\extensions\=> C:\DEV\tools\VSCode-win32-x64-1.82.2\data\extensions\

C:\Users\osryu\AppData\Roaming\Code\ => C:\DEV\tools\VSCode-win32-x64-1.82.2\data\user-data\

```

### vscode portable

```bash
# mac
cd /Applications
mkdir code-portable-data
mkdir codium-portable-data
mkdir code-insiders-portable-data

# windows
# make "data" folder in "vscode folder"
```

### vscode path

```bash
# https://code.visualstudio.com/docs/getstarted/settings

# Windows Path:
./data/user-data/User (Portable)
%AppData%/Roaming/Code/User/settings.json (Excute)

# Mac Path:
~/Library/Application Support/Code/User/settings.json (Excute)
```

### vscode Remote-SSH (Windows 10)

```bash

"C:\Windows\System32\OpenSSH\ssh.exe" -V
# OpenSSH_for_Windows_8.1p1, LibreSSL 3.0.2
"C:\Program Files\OpenSSH\ssh.exe" -V

# ssh -V
# Bad configuration option: pubkeyacceptedalgorithms
"C:\WINDOWS\System32\OpenSSH\ssh.exe" -T -D 50750 "gcp-root" bash

# 버전 업데이트 필요
https://github.com/microsoft/vscode-remote-release/issues/5851
https://github.com/PowerShell/Win32-OpenSSH/releases/
```

### vscode in mac 앱 서명 오류

```bash
#오류내용: SecCodeCheckValidity: Error Domain=NSOSStatusErrorDomain Code=-67062 "(null)" (-67062)

# vscode
codesign --force --deep --sign - "/Applications/Visual Studio Code.app/Contents/MacOS/Electron"
# vscode insider
codesign --force --deep --sign - "/Applications/Visual Studio Code - Insiders.app/Contents/MacOS/Electron"
```
