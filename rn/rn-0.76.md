# 기존 react-native 제거

npm uninstall -g react-native-cli @react-native-community/cli

# 새로운 버전 설치

npx @react-native-community/cli@latest init rnshorts --version 0.76.0

cd rnshorts

npm start


# 라이브러리 재설치

```bash
npm install babel-plugin-module-resolver
npm install babel-plugin-root-import --save-dev
npm install @react-navigation/native
npm i react-native-worklets
npm install react-native-reanimated react-native-gesture-handler react-native-screens react-native-safe-area-context @react-native-community/masked-view
npm install @react-navigation/stack
npm i react-native-dotenv
npm i axios
npm i react-redux
npm i redux
npm i redux-thunk
npm i @types/react-redux
npm i react-native-webview
npm i iconv-lite
npm i buffer
npm i react-native-youtube
npm i react-native-webview
npm i react-native-youtube-iframe
npm i @react-native-community/hooks
npm install babel-plugin-root-import --save-dev
npm install  react-native-google-mobile-ads
npm i @react-navigation/drawer
npm i react-native-gesture-handler react-native-reanimated
npm i @react-navigation/material-top-tabs react-native-tab-view
npm i react-native-pager-view
npm i react-native-swipe-gestures
```


# https://adjh54.tistory.com/321

``
Execution failed for task ':app:createBundleReleaseJsAndAssets'.
> A problem occurred starting process 'command 'node''
``

