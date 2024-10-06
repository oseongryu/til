### 2022.12.25.

#### path

```
Windows Path:
./data/user-data/User (Portable)
%AppData%/Roaming/Code/User/settings.json (Excute)

Mac Path:
~/Library/Application Support/Code/User/settings.json (Excute)
```

https://code.visualstudio.com/docs/getstarted/settings

#### vscode settings.json

settings.json

```json
{
  "editor.formatOnType": true,
  "editor.formatOnSave": true,
  "editor.minimap.enabled": false,
  // "editor.mouseWheelZoom": true,
  "editor.renderWhitespace": "all",
  "editor.unicodeHighlight.nonBasicASCII": false,
  "editor.unicodeHighlight.invisibleCharacters": false,
  "editor.unicodeHighlight.ambiguousCharacters": false,
  "extensions.autoCheckUpdates": false,
  "extensions.autoUpdate": false,
  "extensions.ignoreRecommendations": true,
  // "files.trimTrailingWhitespace": true,
  "git.enableSmartCommit": true,
  "git.autofetch": true,
  "git.confirmSync": false,
  "security.workspace.trust.untrustedFiles": "open",
  "terminal.integrated.defaultProfile.windows": "Git Bash",
  "terminal.integrated.defaultProfile.osx": "zsh",
  "terminal.integrated.copyOnSelection": true,
  "terminal.integrated.cursorBlinking": true,
  "terminal.integrated.fontSize": 13,
  "update.enableWindowsBackgroundUpdates": false,
  "update.mode": "none",
  "window.title": "${dirty}${rootName}",
  "window.zoomLevel": -1,
  "window.commandCenter": false,
  "workbench.editor.enablePreview": false,
  "workbench.layoutControl.enabled": false,
  "workbench.startupEditor": "none",
  // "[javascript][typescript]": {
  //   "editor.maxTokenizationLineLength": 2500
  // },
  // "[json]": {
  //   "editor.defaultFormatter": "vscode.json-language-features"
  // },
  // "[jsonc]": {
  //   "editor.defaultFormatter": "vscode.json-language-features"
  // },
  // "[markdown]": {
  //   // "editor.formatOnSave": true,
  //   "editor.wordWrap": "on",
  //   "editor.renderWhitespace": "all",
  //   "editor.acceptSuggestionOnEnter": "off"
  // },
  // "[typescript]": {
  //   "editor.formatOnSave": false,
  //   "editor.formatOnPaste": false
  // },
  "npm.keybindingsChangedWarningShown": true,
  "bookmarks.keepBookmarksOnLineDelete": true,
  "volar.inlayHints.eventArgumentInInlineHandlers": false,
  "camelgobrr.cases": ["camelCase", "SNAKE_CASE"],
  "gitlens.codeLens.enabled": false,
  "gitlens.codeLens.authors.enabled": false,
  "java.configuration.runtimes": [
    {
      "name": "JavaSE-1.8",
      "path": "~/DEV/java/zulu8.78.0.19-ca-jdk8.0.412-macosx_x64"
    }
  ],
  "application.shellEnvironmentResolutionTimeout": 20,
  "editor.multiCursorLimit": 100000,
  "editor.copyWithSyntaxHighlighting": false,
  "terminal.integrated.scrollback": 9999,
  "redhat.telemetry.enabled": false,
  "spring.output.ansi.enabled": "always",
  "editor.defaultFormatter": "esbenp.prettier-vscode",
  "editor.accessibilitySupport": "off",
  "markdown-preview-enhanced.revealjsTheme": "black.css",
  "workbench.layoutControl.enabled": false,
  "editor.fontFamily": "Consolas, Menlo, Monaco, 'Courier New', monospace",
  "git.ignoreRebaseWarning": true,
  "diffEditor.ignoreTrimWhitespace": false,
  "workbench.editorAssociations": {
    "*.strings": "default"
  }
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

setting.json

```
  "workbench.colorCustomizations": {
    // 상단 타이틀 배경색
    "titleBar.activeBackground": "#0d3d95",
    "titleBar.inactiveBackground": "#0a2d6e",
    // 상단 타이틀 글자색
    "titleBar.activeForeground": "#fff",
    "titleBar.inactiveForeground": "#fff",
    // 하단 상태 배경색
    "statusBar.background": "#1558d4"
  },


  "workbench.colorCustomizations": {
    // green
    // vscdoe 전체 전경 색
    "editor.background": "#2a2c2b",
    // 맨 왼쪽 activityBar
    "activityBar.background": "#1f242b",
    // 사이드바(파일,폴더) 배경 색
    "sideBar.background": "#333635",
    // 그룹 헤더 전체 배경 색
    "editorGroupHeader.tabsBackground": "#1f242b",
    // 선택된 탭 배경색
    "tab.activeBackground": "#225348",
    "tab.activeForeground": "#06f7df",
    "tab.inactiveForeground": "#fff",
    // 비활성인 탭 배경색
    "tab.inactiveBackground": "#1f242b",
    // 상단 타이틀 배경색
    "titleBar.activeBackground": "#0b856b",
    "titleBar.inactiveBackground": "#086450",
    // 상단 타이틀 글자색
    "titleBar.activeForeground": "#fff",
    "titleBar.inactiveForeground": "#fff",
    // 하단 상태 배경색
    "statusBar.background": "#0b856b",
    // 사이드바 목록 선택 배경색 글자색
    "list.hoverBackground": "#535353",
    "list.activeSelectionBackground": "#1f242b",
    "list.activeSelectionForeground": "#06f7df"

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
```