## Setup
```bash
# cmd
@powershell -NoProfile -ExecutionPolicy Bypass -Command "iex ((new-object net.webclient).DownloadString('https://chocolatey.org/install.ps1'))" && SET PATH=%PATH%;%ALLUSERSPROFILE%\chocolatey\bin

# powershell
Set-ExecutionPolicy Bypass -Scope Process -Force; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))
```


## choco
```bash
choco search googlechrome -ev
choco search googlechrome -e

choco install -yf bandizip
choco install bandizip --version=6.24

choco uninstall bandizip
choco uninstall -yf bandizip

```

##  
```bash
choco install vscodium
choco install bandizip --version=6.24
```

## references
https://gyuha.github.io/post/2020-01-10-chocolatey_manual/