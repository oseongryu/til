### yarn berry

```
YARN_IGNORE_NODE=1 yarn set version berry
YARN_IGNORE_NODE=1 yarn install
YARN_IGNORE_NODE=1 yarn run dev
# vscode
YARN_IGNORE_NODE=1 yarn dlx @yarnpkg/sdks vscode
```

.yarnrc.yml

```json
# https://yarnpkg.com/configuration/yarnrc
nodeLinker: node-modules

npmRegistryServer: "https://registry.npmjs.org"

npmScopes: {
  "ustra": {
    npmRegistryServer: "https://repo.gsitm.com/repository/npm-private/",
  }
}

yarnPath: .yarn/releases/yarn-4.3.0.cjs
```

### bun

bunfig.toml

```yml
[install]
# set default registry as a string
registry = "https://registry.npmjs.org"
[install.scopes]
"@ustra" =  "https://repo.gsitm.com/repository/npm-private/"
```
