### yarn berry

.yarnrc.yml

```
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

```
[install]
# set default registry as a string
registry = "https://registry.npmjs.org"
[install.scopes]
"@ustra" =  "https://repo.gsitm.com/repository/npm-private/"
```
