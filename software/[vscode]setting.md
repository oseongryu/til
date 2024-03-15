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
  "editor.formatOnType": false,
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
  "workbench.colorCustomizations": {
    // 상단 타이틀 배경색
    "titleBar.activeBackground": "#0d3d95",
    "titleBar.inactiveBackground": "#0a2d6e",
    // vscdoe 전체 전경 색
    "editor.background": "#000000",
    // 상단 타이틀 글자색
    "titleBar.activeForeground": "#fff",
    "titleBar.inactiveForeground": "#fff",
    // 하단 상태 배경색
    "statusBar.background": "#1558d4",

    // // 상단 타이틀 배경색
    // "titleBar.activeBackground": "#0b856b",
    // "titleBar.inactiveBackground": "#086450",
    // // vscdoe 전체 전경 색
    // "editor.background": "#000000",
    // // 상단 타이틀 글자색
    // "titleBar.activeForeground": "#fff",
    // "titleBar.inactiveForeground": "#fff",
    // // 하단 상태 배경색
    // "statusBar.background": "#0b856b",
  },
  "diffEditor.ignoreTrimWhitespace": false,
  "application.shellEnvironmentResolutionTimeout": 20,
  "editor.multiCursorLimit": 100000
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