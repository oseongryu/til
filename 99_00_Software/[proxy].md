## proxy setting
```bash
npm config set proxy http://192.0.0.4:10001
npm config set https-proxy http://192.0.0.4:10001
npm config set strict-ssl false
npm config set registry http://registry.npmjs.org/

# confirm: ~/.npmrc
npm config list
```

### gradle.properties
```
# https://sharplee7.tistory.com/12
systemProp.http.proxyHost=192.0.0.4
systemProp.http.proxyPort=10001

# systemProp.http.proxyUser=[userid]
# systemProp.http.proxyPassword=[password]
# systemProp.http.nonProxyHosts=[*.exclusiveurl.com|localhost]

systemProp.https.proxyHost=192.0.0.4
systemProp.https.proxyPort=10001
# systemProp.https.proxyUser=[userid]
# systemProp.https.proxyPassword=[password]
# systemProp.https.nonProxyHosts=[*.exclusiveurl.com|localhost]
```