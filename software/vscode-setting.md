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
