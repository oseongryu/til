### settings.json

```json
{
  "application.shellEnvironmentResolutionTimeout": 20,
  "bookmarks.keepBookmarksOnLineDelete": true,
  "diffEditor.ignoreTrimWhitespace": true,
  "editor.copyWithSyntaxHighlighting": false,
  "editor.formatOnType": true,
  "editor.formatOnSave": true,
  "editor.formatOnPaste": true,
  "editor.minimap.enabled": false,
  "editor.renderWhitespace": "all",
  "editor.multiCursorLimit": 100000,
  "editor.unicodeHighlight.nonBasicASCII": false,
  "editor.unicodeHighlight.invisibleCharacters": false,
  "editor.unicodeHighlight.ambiguousCharacters": false,
  "extensions.autoCheckUpdates": false,
  "extensions.autoUpdate": false,
  "extensions.ignoreRecommendations": true,
  "git.enableSmartCommit": true,
  "git.autofetch": true,
  "git.openRepositoryInParentFolders": "never",
  "git.confirmSync": false,
  "git.ignoreRebaseWarning": true,
  "git.replaceTagsWhenPull": true,
  "liveServer.settings.donotVerifyTags": true,
  "security.workspace.trust.untrustedFiles": "open",
  "terminal.integrated.defaultProfile.windows": "Git Bash",
  "terminal.integrated.defaultProfile.osx": "zsh",
  "terminal.integrated.copyOnSelection": true,
  "terminal.integrated.cursorBlinking": true,
  "terminal.integrated.fontSize": 13,
  "terminal.integrated.scrollback": 9999,
  "update.mode": "none",
  "window.commandCenter": false,
  "window.title": "${dirty}${rootName}",
  "window.zoomLevel": -1,
  "workbench.editor.enablePreview": false,
  "workbench.startupEditor": "none",
  "workbench.colorCustomizations": {
    // 상단 타이틀 배경색
    "titleBar.activeBackground": "#0d3d95",
    "titleBar.inactiveBackground": "#0a2d6e",
    // 하단 상태 배경색
    "statusBar.background": "#1558d4"
  },
  "java.configuration.runtimes": {
    "name": "JavaSE-1.8",
    "path": "/app/tools/java/zulu8.78.0.19-ca-jdk8.0.412-macosx_x64"
  }
}
```

### color

```json

    "workbench.colorCustomizations": {
      // green
      // vscdoe 전체 전경 색
      "editor.background": "#000000",
      // 맨 왼쪽 activityBar
      "activityBar.background": "#14322c",
      // 사이드바(파일,폴더) 배경 색
      "sideBar.background": "#25292f",
      // 그룹 헤더 전체 배경 색
      "editorGroupHeader.tabsBackground": "#1f242b",

      // 사이드바 목록 선택 배경색 글자색
      "list.hoverBackground": "#535353",
      "list.activeSelectionBackground": "#065458",
      "list.activeSelectionForeground": "#06f7df",
      "list.inactiveSelectionBackground": "#225957",
      "list.inactiveSelectionForeground": "#ffffff",

      // 선택된 탭 배경색
      "tab.activeBackground": "#225348",
      "tab.activeForeground": "#06f7df",
      // 비활성인 탭 배경색
      "tab.inactiveBackground": "#1f242b",
      "tab.inactiveForeground": "#ffffff",

      // 상단 타이틀 배경색
      "titleBar.activeBackground": "#0b856b",
      "titleBar.inactiveBackground": "#086450",
      // 상단 타이틀 글자색
      "titleBar.activeForeground": "#ffffff",
      "titleBar.inactiveForeground": "#ffffff",
      // 하단 상태 배경색
      "statusBar.background": "#0b856b",
      // 하단 Terminal, Problems 배경색
      "panel.background": "#021e18",

      // blue
      // vscdoe 전체 전경 색
      "editor.background": "#000000",
      // 맨 왼쪽 activityBar
      "activityBar.background": "#071f4a",
      // 사이드바(파일,폴더) 배경 색
      "sideBar.background": "#25292f",
      // 그룹 헤더 전체 배경 색
      "editorGroupHeader.tabsBackground": "#1f242b",

      // 사이드바 목록 선택 배경색 글자색
      "list.hoverBackground": "#535353",
      "list.activeSelectionBackground": "#09569d",
      "list.activeSelectionForeground": "#ffffff",
      "list.inactiveSelectionBackground": "#3a6a97",
      "list.inactiveSelectionForeground": "#ffffff",

      // 선택된 탭 배경색
      "tab.activeBackground": "#044d91",
      "tab.activeForeground": "#ffffff",
      // 비활성인 탭 배경색
      "tab.inactiveBackground": "#1f242b",
      "tab.inactiveForeground": "#ffffff",

      // 상단 타이틀 배경색
      "titleBar.activeBackground": "#0d3d95",
      "titleBar.inactiveBackground": "#0a2d6e",
      // 상단 타이틀 글자색
      "titleBar.activeForeground": "#ffffff",
      "titleBar.inactiveForeground": "#ffffff",
      // 하단 상태 배경색
      "statusBar.background": "#1558d4",
      // 하단 Terminal, Problems 배경색
      "panel.background": "#06132c",
    },
```

### keybindings.json

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
