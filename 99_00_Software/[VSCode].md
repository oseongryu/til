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
code --list-extensions | % { "code --install-extension $_" }
```

#### vscode vue extension
```bash
code --install-extension alefragnani.Bookmarks
code --install-extension alefragnani.project-manager
code --install-extension donjayamanne.githistory
code --install-extension mhutchie.git-graph
code --install-extension PKief.material-icon-theme
code --install-extension yzane.markdown-pdf
code --install-extension yzhang.markdown-all-in-one
code --install-extension shd101wyy.markdown-preview-enhanced

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
code --install-extension redhat.java
code --install-extension VisualStudioExptTeam.intellicode-api-usage-examples
code --install-extension VisualStudioExptTeam.vscodeintellicode
code --install-extension vscjava.vscode-java-debug
code --install-extension vscjava.vscode-java-dependency
code --install-extension vscjava.vscode-java-pack
code --install-extension vscjava.vscode-java-test
code --install-extension vscjava.vscode-maven

code --install-extension Pivotal.vscode-boot-dev-pack
code --install-extension Pivotal.vscode-spring-boot
code --install-extension vscjava.vscode-spring-boot-dashboard
code --install-extension vscjava.vscode-spring-initializr

#### java gradle
code --install-extension vscjava.vscode-gradle

### camel
code --install-extension aethli.camelgobrr

##### etc
code --install-extension codezombiech.gitignore
code --install-extension donjayamanne.git-extension-pack
code --install-extension eamodio.gitlens
code --install-extension hollowtree.vue-snippets
code --install-extension huizhou.githd
code --install-extension ms-vsliveshare.vsliveshare
code --install-extension ziyasal.vscode-open-in-github
code --install-extension yandeu.five-server
code --install-extension adamhartford.vscode-base64

#### note
vsnotes

```

### vscode camel
```json
{
  "camelgobrr.cases": [
    "kebab-case",
    "CamelCase",
    "camelCase",
    "Space Case",
    "SPACE CASE",
    "space case",
    "SNAKE_CASE",
    "snake_case"
  ]
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
