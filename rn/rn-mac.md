## Setting

```
xcode-select —install
brew install git
brew install watchman
npm install -g react-native-cli

cd /users/${USERS}/desktop/dev/workspace/
git clone ~~

cd {$USERS}
npm install
brew tap AdoptOpenJDK/openjdk
brew install —-cask adoptopenjdk8

예전 brew 설치로 에러 발생
rm -fr $(brew --repo homebrew/core)

/Users/${USER}/Library/Android/sdk

### export ANDROID_HOME=$HOME/Library/Android/sdk
export ANDROID_HOME=자신의 안드로이드SDK 위치/Android/sdk
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/tools
export PATH=$PATH:$ANDROID_HOME/tools/bin
export PATH=$PATH:$ANDROID_HOME/platform-tools
```

## ERESOLVE unable to resolve dependency tree

```
npm install react-project —save —legacy-peer-deps

```
## Error: spawn ./gradlew ACCESS

```
chmod 755 android/gradlew

cd /users/${USER}/desktop/dev/workspace

```

## local.properties

```
sdk.dir = /users/${USER}/Library/Android/sdk

```

## Clear

```
watchman watch-del-all
rm -rf $TMPDIR/react-native-packager-cache-_
rm -rf $TMPDIR/metro-bundler-cache-_
rm -rf node_modules/
npm cache clean --force
npm install
npm start -- --reset-cache

cd android
./gradlew cleanBuildCache

1. Clear watchman watches: watchman watch-del-all
2. Delete node_modules and run yarn install
3. Reset Metro's cache: yarn start --reset-cache
4. Remove the cache: rm -rf /tmp/metro-\*

rm -rf node_modules
watchman wathch-del-all
npm start --reset-cache

- error: Error: Unable to resolve module @babel/runtime/helpers/interopRequireDefault from ~~
  npm add @babel/runtime
```

## React-Native IOS 실기계 연결

```
- 안되는 경우 XCode에서 설정
npm install -g ios-deploy
react-native run-ios --device 'DELL의 iPhone' --configuration Release
react-native run-ios --scheme "happytoseeyou" --device 'oseongryu의 iPhone'
```

## service kill

```
lsof -i :19090
kill -9 18731
```

## vscode Prettier settings.json

```
Windows Path:
./data/user-data/User (Portable)
%AppData%/Roaming/Code/User/settings.json (Excute)

Mac Path:
~/Library/Application Support/Code/User/settings.json (Excute)

-- default
{
  "workbench.startupEditor": "none",
  "editor.minimap.enabled": false,
  "diffEditor.ignoreTrimWhitespace": false,
  "workbench.iconTheme": "material-icon-theme",
  "terminal.integrated.defaultProfile.windows": "Git Bash"
}

-- custom
{
  "workbench.colorTheme": "Material Theme Darker",
  "editor.formatOnSave": true,
  "prettier.jsxSingleQuote": true,
  "prettier.singleQuote": true,
  "javascript.preferences.quoteStyle": "single",
  "typescript.preferences.quoteStyle": "single",
  "editor.tokenColorCustomizations": {
    "comments": "#fdc1d5"
  },
  "launch": {
    "configurations": [],
    "compounds": []
  },
  "editor.defaultFormatter": "esbenp.prettier-vscode",
  "code-runner.runInTerminal": true,
  "[json]": {
    "editor.quickSuggestions": {
      "strings": true
    },
    "editor.suggest.insertMode": "replace",
    "gitlens.codeLens.scopes": ["document"]
  },
  "code-runner.executorMap": {
    "cpp": "cd $dir && clang++ -std=c++17 $fileName -o $fileNameWithoutExt && $dir$fileNameWithoutExt"
  }
}
```


###

code-insiders-portable-data
code-portable-data

sudo npm uninstall npm -g
sudo rm -rf /usr/local/lib/node 
sudo rm -rf /usr/local/lib/node_modules 
sudo rm -rf /var/db/receipts/org.nodejs.*
sudo rm -rf /usr/local/include/node 
sudo rm -rf /Users/oseongryu/.npm
sudo rm /usr/local/bin/node
sudo rm /usr/local/share/man/man1/node.1

brew uninstall node

### 2023.11.10. 재설치
```bash
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.5/install.sh | bash
wget -qO- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.5/install.sh | bash


export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

npm install --global yarn

export ANDROID_HOME=$HOME/Library/Android/sdk
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/tools
export PATH=$PATH:$ANDROID_HOME/tools/bin
export PATH=$PATH:$ANDROID_HOME/platform-tools

brew install cocoapods
npx react-native init LearnReactNative

# 백업
# export NODE_OPTIONS=--openssl-legacy-provider

# export NVM_DIR=~/.nvm
# source $(brew --prefix nvm)/nvm.sh
  
# export ANDROID_HOME="/Users/oseongryu/Library/Android/sdk"
# export PATH="$PATH:$ANDROID_HOME/platform-tools/"

# alias python=/opt/homebrew/bin/python3

# eval "$(/opt/homebrew/bin/brew shellenv)"
# [[ -d ~/.rbenv  ]] && \
# export PATH=${HOME}/.rbenv/bin:${PATH} && \
# eval "$(rbenv init -)"
# [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# /usr/libexec/java_home -V
```

### node_modules/react-native/scripts/find-node.sh

```bash
nvm unalias default
rm -rf ./Pods && pod install
npx react-native run-ios --simulator="iPhone 15 Pro"
cd ios && RCT_NEW_ARCH_ENABLED=1 pod install
RCT_NEW_ARCH_ENABLED=1 pod install
watchman watch-del '/Users/oseongryu/git/rn-shorts' ; watchman watch-project '/Users/oseongryu/git/rn-shorts'

# https://velog.io/@somangoi/React-Native-%EB%B9%8C%EB%93%9C-%EC%8B%9C-PhaseScriptExecution-%EC%97%90%EB%9F%AC-%ED%95%B4%EA%B2%B0
# Define NVM_DIR and source the nvm.sh setup script
[ -z "$NVM_DIR" ] && export NVM_DIR="$HOME/.nvm"

if [[ -s "$HOME/.nvm/nvm.sh" ]]; then
  . "$HOME/.nvm/nvm.sh"
elif [[ -x "$(command -v brew)" && -s "$(brew --prefix nvm)/nvm.sh" ]]; then
  . "$(brew --prefix nvm)/nvm.sh"
fi
```


### mac rbenv
```bash
brew install rbenv
rbenv install 2.7.6.
rbenv versions
rbenv global 2.7.6
rbenv versions
ruby --version
gem install bundler

sudo gem install ffi
sudo gem install cocoapods

```
### 2024.03.14. error

```bash
✔ Initializing Git repository

  Run instructions for Android:
    • Have an Android emulator running (quickest way to get started), or a device connected.
    • cd "/Users/oseongryu/git/rnshorts" && npx react-native run-android
  
  Run instructions for iOS:
    • cd "/Users/oseongryu/git/rnshorts/ios"
    
    • Install Cocoapods
      • bundle install # you need to run this only once in your project.
      • bundle exec pod install
      • cd ..
    
    • npx react-native run-ios
    - or -
    • Open rnshorts/ios/rnshorts.xcodeproj in Xcode or run "xed -b ios"
    • Hit the Run button
    
  Run instructions for macOS:
    • See https://aka.ms/ReactNativeGuideMacOS for the latest up-to-date instructions.
```


nvm use --delete-prefix v16.1.0
unset PREFIX

/Users/oseongryu/git/rnshorts/node_modules/.bin/launchPackager.command ; exit;
nvm is not compatible with the "PREFIX" environment variable: currently set to "/opt/homebrew"
Run `unset PREFIX` to unset it.
~ /Users/oseongryu/git/rnshorts/node_modules/.bin/launchPackager.command ; exit;
env: node: No such file or directory
Process terminated. Press <enter> to close the window



error Failed to install the app. Looks like your Android environment is not properly set. Please go to https://reactnative.dev/docs/0.73/environment-setup?os=macos&platform=android&guide=native#jdk-studio and follow the React Native CLI QuickStart guide to install the compatible version of JDK.
