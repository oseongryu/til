### 2022.12.25.
settings.json
```json
{
  "workbench.startupEditor": "none",
  "extensions.ignoreRecommendations": true,
  "terminal.integrated.defaultProfile.windows": "Git Bash",
  "npm.keybindingsChangedWarningShown": true,
  "editor.minimap.enabled": false,
  "bookmarks.saveBookmarksInProject": true,
  "bookmarks.keepBookmarksOnLineDelete": true,
  "window.zoomLevel": -1,
  "editor.formatOnPaste": true,
  "camelgobrr.cases": [
    "camelCase",
    "SNAKE_CASE"
  ]
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