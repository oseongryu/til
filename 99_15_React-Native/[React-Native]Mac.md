## Setting

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

# export ANDROID_HOME=$HOME/Library/Android/sdk
export ANDROID_HOME=자신의 안드로이드SDK 위치/Android/sdk
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/tools
export PATH=$PATH:$ANDROID_HOME/tools/bin
export PATH=$PATH:$ANDROID_HOME/platform-tools

## ERESOLVE unable to resolve dependency tree
npm install react-project —save —legacy-peer-deps

## Error: spawn ./gradlew ACCESS
chmod 755 android/gradlew 

cd /users/${USER}/desktop/dev/workspace

## local.properties
sdk.dir = /users/${USER}/Library/Android/sdk


## Clear

watchman watch-del-all
rm -rf $TMPDIR/react-native-packager-cache-*
rm -rf $TMPDIR/metro-bundler-cache-*
rm -rf node_modules/
npm cache clean --force
npm install
npm start -- --reset-cache

cd android
./gradlew cleanBuildCache

1. Clear watchman watches: watchman watch-del-all
2. Delete node_modules and run yarn install
3. Reset Metro's cache: yarn start --reset-cache
4. Remove the cache: rm -rf /tmp/metro-*

rm -rf node_modules
watchman wathch-del-all
npm start --reset-cache

* error: Error: Unable to resolve module @babel/runtime/helpers/interopRequireDefault from ~~
npm add @babel/runtime

## service kill
lsof -i :19090
kill -9 18731
