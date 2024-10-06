### init
```bash
npx react-native init movieviewer --template react-native-template-typescript@6.12.6
```

### hermes setting (false)


nvm install 18.19.1
nvm use 18.19.1

ios > Podfile > 
hermes_enable => false

cd ios
pod install

android > app > build.gradle >
enableHermes: false,

### package 변경
open a project
ios > .xcworkspace 

app > Signing & capabilities > bundle Identifier > 'io.github.movieviewer.app'


android > app > src > java > MainActivity 
전부 일괄변경 com.movieviewer > io.github.movieviewer.app


### 실행시 split terminal
yarn run start
yarn run ios
yarn run android

### vscode 
eslint
prettier

#### eslint

const test = 2
test = 2

yarn run eslint example.js

=> 자동으로 확인
