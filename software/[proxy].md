## bash setting
```
export http_proxy='http://192.0.0.4:10001'
export https_proxy='http://192.0.0.4:10001'

unset http_proxy
unset https_proxy
```

## .npmrc
```bash
proxy=192.0.0.4:10001
```


## proxy setting
```bash
npm config set proxy http://192.0.0.4:10001
npm config set https-proxy http://192.0.0.4:10001
npm config set strict-ssl false
npm config set registry http://registry.npmjs.org/

# confirm: ~/.npmrc
npm config list
```

## git setting
```bash
# https://stackoverflow.com/questions/783811/getting-git-to-work-with-a-proxy-server-fails-with-request-timed-out
# https://gist.github.com/ozbillwang/005bd1dfc597a2f3a00148834ad3e551
# https://publivate.tistory.com/281
# https://lunatine.net/2015/08/12/tip-ssh-github-url-with-http-proxy/
# https://stackoverflow.com/questions/70603564/windows-ssh-proxycommand-usr-bin-bash-line-0-exec-nc-not-found-on-git-bash


git -c "http.proxy=192.0.0.4:10001" clone https://github.com/oseongryu/docker-composes.git
git -c "http.proxy=192.0.0.4:10001" clone git@github.com:oseongryu/docker-composes.git

git config --global http.proxy http://192.0.0.4:10001
git config --global http.sslVerify false


# https://copyprogramming.com/howto/how-can-i-change-the-system-proxy-from-the-command-line
netsh winhttp set proxy SERVER:PORT
netsh winhttp set proxy 192.0.0.4:10001
set HTTP_PROXY=http://proxy_userid:proxy_password@proxy_ip:proxy_port
set FTP_PROXY=%HTTP_PROXY%
set HTTPS_PROXY=%HTTP_PROXY%
set HTTP_PROXY=http://192.0.0.4:10001
set FTP_PROXY=%HTTP_PROXY%
set HTTPS_PROXY=%HTTP_PROXY%

netsh winhttp set proxy proxy-server="socks=localhost:9090" bypass-list="localhost"
netsh winhttp show proxy
netsh winhttp reset proxy

netsh winhttp set proxy 192.0.0.4:10001
netsh winhttp set proxy 192.0.0.4:10001";
netsh winhttp set proxy proxy-server="http=myproxy;https=sproxy:88" bypass-list="*.foo.com"

```



### gradle.properties (~/.gradle/gradle.properties)
```bash
systemProp.http.proxyHost=192.0.0.4
systemProp.http.proxyPort=8000
systemProp.https.proxyHost=192.0.0.4
systemProp.https.proxyPort=8000



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