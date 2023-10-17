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
  "editor.formatOnType": false,
  "editor.minimap.enabled": false,
  "editor.renderWhitespace": "all",
  "editor.unicodeHighlight.nonBasicASCII": false,
  "editor.unicodeHighlight.invisibleCharacters": false,
  "editor.unicodeHighlight.ambiguousCharacters": false,
  "extensions.autoCheckUpdates": false,
  "extensions.ignoreRecommendations": true,
  // "files.trimTrailingWhitespace": true,
  "git.enableSmartCommit": true,
  "security.workspace.trust.untrustedFiles": "open",
  "terminal.integrated.defaultProfile.windows": "Git Bash",
  "update.enableWindowsBackgroundUpdates": false,
  "update.mode": "none",
  "window.title": "${dirty}${rootName}",
  "window.zoomLevel": -1,
  "window.commandCenter": false,
  "workbench.layoutControl.enabled": false,
  "workbench.startupEditor": "none",
  "[javascript][typescript]": {
    "editor.maxTokenizationLineLength": 2500
  },
  "[json]": {
    "editor.defaultFormatter": "vscode.json-language-features"
  },
  "[jsonc]": {
    "editor.defaultFormatter": "vscode.json-language-features"
  },
  "[markdown]": {
    // "editor.formatOnSave": true,
    "editor.wordWrap": "on",
    "editor.renderWhitespace": "all",
    "editor.acceptSuggestionOnEnter": "off"
  },
  "[typescript]": {
    "editor.formatOnSave": false,
    "editor.formatOnPaste": false
  },
  "npm.keybindingsChangedWarningShown": true,
  "bookmarks.keepBookmarksOnLineDelete": true,
  "volar.inlayHints.eventArgumentInInlineHandlers": false,
  "camelgobrr.cases": [
    "camelCase",
    "SNAKE_CASE"
  ],
  "gitlens.codeLens.enabled": false,
  "gitlens.codeLens.authors.enabled": false,
  "workbench.colorCustomizations": {
    // 상단 타이틀 배경색
    "titleBar.activeBackground": "#0b856b",
    "titleBar.inactiveBackground": "#0a2d6e",
    // 상단 타이틀 글자색
    "titleBar.activeForeground": "#fff",
    "titleBar.inactiveForeground": "#fff",
    // 하단 상태 배경색
    "statusBar.background": "#0b856b"

    // // green
    // // vscdoe 전체 전경 색
    // "editor.background": "#1f242b",
    // // 맨 왼쪽 activityBar
    // "activityBar.background": "#1f242b",
    // // 사이드바(파일,폴더) 배경 색
    // "sideBar.background": "#1f242b",
    // // 그룹 헤더 전체 배경 색
    // "editorGroupHeader.tabsBackground": "#1f242b",
    // // 선택된 탭 배경색
    // "tab.activeBackground": "#225348",
    // "tab.activeForeground": "#06f7df",
    // "tab.inactiveForeground": "#fff",
    // // 비활성인 탭 배경색
    // "tab.inactiveBackground": "#1f242b",
    // // 상단 타이틀 배경색
    // "titleBar.activeBackground": "#0b856b",
    // "titleBar.inactiveBackground": "#086450",
    // // 상단 타이틀 글자색
    // "titleBar.activeForeground": "#fff",
    // "titleBar.inactiveForeground": "#fff",
    // // 하단 상태 배경색
    // "statusBar.background": "#0b856b",
    // // 사이드바 목록 선택 배경색 글자색
    // "list.hoverBackground": "#535353",
    // "list.activeSelectionBackground": "#1f242b",
    // "list.activeSelectionForeground": "#06f7df",

    // // blue
    // // vscdoe 전체 전경 색
    // "editor.background": "#1f242b",
    // // 맨 왼쪽 activityBar
    // "activityBar.background": "#1f242b",
    // // 사이드바(파일,폴더) 배경 색
    // "sideBar.background": "#1f242b",
    // // 그룹 헤더 전체 배경 색
    // "editorGroupHeader.tabsBackground": "#1f242b",
    // // 선택된 탭 배경색
    // "tab.activeBackground": "#09569d",
    // "tab.inactiveForeground": "#fff",
    // // 비활성인 탭 배경색
    // "tab.activeForeground": "#e7e8ed",
    // "tab.inactiveBackground": "#1f242b",
    // // 상단 타이틀 배경색
    // "titleBar.activeBackground": "#0d3d95",
    // "titleBar.inactiveBackground": "#0a2d6e",
    // // 상단 타이틀 글자색
    // "titleBar.activeForeground": "#fff",
    // "titleBar.inactiveForeground": "#fff",
    // // 하단 상태 배경색
    // "statusBar.background": "#1558d4",
    // // 사이드바 목록 선택 배경색 글자색
    // "list.hoverBackground": "#535353",
    // "list.activeSelectionBackground": "#1f242b",
    // "list.activeSelectionForeground": "#1558d4",
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
  },
  {
    "key": "ctrl+shift+alt+8",
    "command": "casegobrr.caseChange",
    "when": "editorTextFocus"
  },
  {
    "key": "ctrl+alt+g",
    "command": "-casegobrr.caseChange",
    "when": "editorTextFocus"
  },
  {
    "key": "ctrl+shift+alt+9",
    "command": "casegobrr.repeatCaseChange",
    "when": "editorTextFocus"
  },
  {
    "key": "ctrl+shift+g",
    "command": "-casegobrr.repeatCaseChange",
    "when": "editorTextFocus"
  },
  {
    "key": "ctrl+shift+8",
    "command": "workbench.action.terminal.sendSequence",
    "when": "terminalFocus"
  },
  {
    "key": "ctrl+alt+g",
    "command": "-workbench.action.terminal.sendSequence",
    "when": "terminalFocus"
  },
  {
    "key": "ctrl+shift+alt+u",
    "command": "editor.action.transformToUppercase"
  },
  {
    "key": "ctrl+shift+alt+l",
    "command": "editor.action.transformToSnakecase"
  }
]

```