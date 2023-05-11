### 2022.12.25.

#### vscode settings.json
```
Windows Path:
./data/user-data/User (Portable)
%AppData%/Roaming/Code/User/settings.json (Excute)

Mac Path:
~/Library/Application Support/Code/User/settings.json (Excute)
```

https://code.visualstudio.com/docs/getstarted/settings

settings.json
```json
{
  "workbench.startupEditor": "none",
  "terminal.integrated.defaultProfile.windows": "Git Bash",
  "extensions.ignoreRecommendations": true,
  "npm.keybindingsChangedWarningShown": true,
  "bookmarks.saveBookmarksInProject": true,
  "bookmarks.keepBookmarksOnLineDelete": true,
  "editor.formatOnPaste": true,
  "editor.formatOnSave": false,
  "editor.formatOnType": false,
  "editor.minimap.enabled": false,
  "editor.renderWhitespace": "all",
  "files.trimTrailingWhitespace": true,
  "window.title": "${dirty}${rootName}",
  "window.zoomLevel": -1,
  "camelgobrr.cases": [
    "camelCase",
    "SNAKE_CASE"
  ],
  "[typescript]": {
    "editor.formatOnSave": true,
    "editor.formatOnPaste": true
  },
  "[markdown]": {
    "editor.formatOnSave": true,
    "editor.wordWrap": "on",
    "editor.renderWhitespace": "all",
    "editor.acceptSuggestionOnEnter": "off"
  },
  "[javascript][typescript]": {
    "editor.maxTokenizationLineLength": 2500
  },
  "gitlens.codeLens.enabled": false,
  "gitlens.codeLens.authors.enabled": false,
  "workbench.colorCustomizations": {
    // vscdoe 전체 전경 색
    "editor.background": "#1f242b",
    // 맨 왼쪽 activityBar
    "activityBar.background": "#1f242b",
    // 사이드바(파일,폴더) 배경 색
    "sideBar.background": "#1f242b",
    // 그룹 헤더 전체 배경 색
    "editorGroupHeader.tabsBackground": "#1f242b",
    // 선택된 탭 배경색
    "tab.activeBackground": "#225348",
    "tab.activeForeground": "#06f7df",
    "tab.inactiveForeground": "#fff",
    // 비활성인 탭 배경색
    "tab.inactiveBackground": "#1f242b",
    // 상단 타이틀 배경색
    "titleBar.activeBackground": "#23433c",
    // 상단 타이틀 글자색
    "titleBar.activeForeground": "#fff",
    // 하단 상태 배경색
    "statusBar.background": "#23433c",
    // 사이드바 목록 선택 배경색 글자색
    "list.hoverBackground": "#535353",
    "list.activeSelectionBackground": "#1f242b",
    "list.activeSelectionForeground": "#06f7df",
  },
}
```

keybindings.json
```json
// Place your key bindings in this file to override the defaultsauto[]
[
  {
    "key": "ctrl+shift+9",
    "command": "workbench.action.files.showOpenedFileInNewWindow",
    "when": "emptyWorkspaceSupport"
  },
  {
    "key": "ctrl+k o",
    "command": "-workbench.action.files.showOpenedFileInNewWindow",
    "when": "emptyWorkspaceSupport"
  }
]
```


settings.json
```
  "workbench.colorCustomizations": {
    // vscdoe 전체 전경 색
    "editor.background": "#1f242b",
    // 맨 왼쪽 activityBar
    "activityBar.background": "#1f242b",
    // 사이드바(파일,폴더) 배경 색
    "sideBar.background": "#1f242b",
    // 그룹 헤더 전체 배경 색
    "editorGroupHeader.tabsBackground": "#1f242b",
    // 선택된 탭 배경색
    "tab.activeBackground": "#225348",
    "tab.activeForeground": "#06f7df",
    "tab.inactiveForeground": "#fff",
    // 비활성인 탭 배경색
    "tab.inactiveBackground": "#1f242b",
    // 상단 타이틀 배경색
    "titleBar.activeBackground": "#23433c",
    // 상단 타이틀 글자색
    "titleBar.activeForeground": "#fff",
    // 하단 상태 배경색
    "statusBar.background": "#23433c",
    // 사이드바 목록 선택 배경색 글자색
    "list.hoverBackground": "#535353",
    "list.activeSelectionBackground": "#1f242b",
    "list.activeSelectionForeground": "#06f7df",
  },
```