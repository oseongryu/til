#### Git 사용방법

```bash
git config --global init.defaultBranch main
git --version
git config --global user.name "사용자명"
git config --global user.email "이메일"
git config --global init.defaultBranch main

git config --list

cd C:\Temp\sample
git init
git add *
git commit -m "설명"
git status

git remote add origin https://github.com/oseongryu/sample.git
git push origin main
```

### gitignore global

```bash
touch ~/.gitignore
git config --global core.excludesfile ~/.gitignore
```

#### Git Revert

```bash
git log
git reset --hard "원하는 HEAD"
git push -f origin main
```

#### Git Reset

```bash
git reset HEAD^ // 마지막 커밋 삭제
git reset --hard HEAD // 마지막 커밋 상태로 되돌림
git reset HEAD * // 스테이징을 언스테이징으로 변경
```

#### git 병합취소

```bash
git merge --abort
```

#### git config 설정시 저장 위치

```bash
System	 <git-install-root>\mingw64\etc\gitconfig	 gitconfig
Global	 C:\Users\username\.gitconfig	 .gitconfig
Local	 <git-repo>\.git\config	 config
Worktree	 <git-repo>\.git\config.worktree	 config.worktree
Portable	 C:\ProgramData\Git\config	 config

git config --global user.name "사용자명"
git config --global user.email "이메일"
git config --local user.name "사용자명"
git config --local user.email "이메일"
git config --list
```

#### git branch

```bash
git checkout -b deploy/prod
git push origin deploy/prod
git branch --set-upstream-to origin/deploy/prod

### branch 삭제
git checkout amin
git branch --delete deploy/prod
git branch -D deploy/prod
git push origin :deploy/prod
```

#### git rebase

```
git branch
git checkout develop
git push

git checkout feature/test
git rebase develop
git checkout develop
git merge feature/test --ff
```

#### git 로컬 내용 업데이트

```
git branch -r
git remote update

git branch -a
```

#### git log

```bash
git log --oneline
git log --pretty=format:"%h - %an, %ar : %s"
git log --pretty=format:"%h %cd %an %s"
git log --stat

git log --pretty=format:"%h %cd %an %s" --since="2022-11-01" --until="2022-11-30" --committer=aaaa --committer=bbbb --committer=cccc
git log --pretty=format:"%h %cd %an %s" --since="2022-12-01" --until="2022-12-31" --committer=aaaa --committer=bbbb --committer=cccc
git log --pretty=format:"%h %cd %an %s" --since="2023-01-01" --until="2023-01-31" --committer=aaaa --committer=bbbb --committer=cccc

# 파일목록 추가확인
git log --name-only --pretty=format:"%h %cd %an %s" --since="2022-11-01" --committer=aaaa

# 파일목록 정렬 및 하나로 통합
git log --name-only --pretty=format: --since="2022-02-01" --committer=aaa | sort | uniq
```

#### 리눅스 권한 문제 관련이 있을 경우 (.git의 폴더에서 확인)

```
Unable to create '/home/user/repo/.git/refs
chown -R user:usergroup file/folder
```

#### 맥에서 git 계정 2개 이상 사용 시 ssh 인증

```bash
### ssh-keygen 생성
cd ~/.ssh or mkdir ~/.ssh

ssh-keygen -t <암호화방식> -b <key크기 기본3072> -C '깃헙등록메일@메일.com'
ssh-keygen -t rsa -b 4096 -C 'myuser@email.com'
ssh-keygen -t rsa -b 4096 -C 'oseongryu@gmail.com'

Enter file in which to save the key (/Users/${USER}/.ssh/id_rsa): <id_rsa_이름지정>
Enter file in which to save the key (/Users/${USER}/.ssh/id_rsa): id_rsa_myuser
Enter file in which to save the key (/Users/${USER}/.ssh/id_rsa): id_rsa_oseongryu


eval "$(ssh-agent -s)"
ssh-add <key파일경로>
ssh-add ~/.ssh/id_rsa_myuser
ssh-add ~/.ssh/id_rsa_oseongryu

ssh-add -l

* 삭제 후 다시 만들 필요가 있는 경우
ssh-add -D

touch ~/.ssh/config
vi ~/.ssh/config

--- 해당 내용 추가
# Git myuser
Host github.com-myuser
    HostName github.com
    IdentityFile ~/.ssh/id_rsa_myuser
    User myuser
# Git oseongryu
Host github.com-oseongryu
    HostName github.com
    IdentityFile ~/.ssh/id_rsa_oseongryu
    User oseongryu

### github > settings > SSH and GPG keys >> New SSH Key
pbcopy < ~/.ssh/id_rsa_f5074.pub

### 테스트
ssh -T git@github.com-myuser

### 사용
git remote add origin git@github.com-oseongryu:oseongryu/til.git
git remote set-url origin git@github.com-oseongryu:oseongryu/til.git
```

#### 다른 맥으로 .ssh설정 옮기기

```

다른 맥에서 .ssh 파일만 옮겨올 경우 아래와 같은 에러가 나타날 수 있음
private key의 permissions이 많이 되어 있어서 생기는 문제였음
옮겨온 파일의 권한을 변경해서 처리

chmod 700 ~/.ssh
chmod 600 ~/.ssh/id_rsa
chmod 644 ~/.ssh/id_rsa.pub
chmod 644 ~/.ssh/authorized_keys
chmod 644 ~/.ssh/known_hosts


---
Warning: Permanently added 'github.com,64:ff9b::344e:e76c' (RSA) to the list of known hosts.
@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
@         WARNING: UNPROTECTED PRIVATE KEY FILE!          @
@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
Permissions 0644 for '/Users/oseongryu/.ssh/id_rsa_oseongryu' are too open.
It is required that your private key files are NOT accessible by others.
This private key will be ignored.
Load key "/Users/oseongryu/.ssh/id_rsa_oseongryu": bad permissions
---

```

#### 원격에서 ssh설정시

```bash
chown $USER ~/.ssh/config
chmod 644 ~/.ssh/config
```

#### git Commit Message Structure

```
feat : 새로운 기능 추가
fix : 버그 수정
docs : 문서 수정
style : 코드 포맷팅, 세미콜론 누락, 코드 변경이 없는 경우
refactor : 코드 리펙토링
test : 테스트 코드, 리펙토링 테스트 코드 추가
chore : 빌드 업무 수정, 패키지 매니저 수정

feat: (new feature for the user, not a new feature for build script)
fix: (bug fix for the user, not a fix to a build script)
docs: (changes to the documentation)
style: (formatting, missing semi colons, etc; no production code change)
refactor: (refactoring production code, eg. renaming a variable)
test: (adding missing tests, refactoring tests; no production code change)
chore: (updating grunt tasks etc; no production code change)
```

#### git local pull request

```bash
#### local get pull request
git config --add remote.origin.fetch "+refs/pull/*/head:refs/remotes/origin/pr/*"
git fetch origin
git checkout -t origin/pr/35

s#### config 추가
git config --add remote.origin.fetch "+refs/heads/*:refs/remotes/origin/*"

#### config 삭제
git config --unset --local remote.origin.fetch
git config --unset-all --local remote.origin.fetch
git config --add remote.origin.fetch "+refs/heads/*:refs/remotes/origin/*"

```

#### fetch github pr to local

```
git pull origin pull/35/head



-- git config에 설정
[alias]
  pr  = "!f() { git fetch -fu ${2:-origin} refs/pull/$1/head:pr/$1 && git checkout pr/$1; }; f"
  pr-clean = "!git for-each-ref refs/heads/pr/* --format='%(refname)' | while read ref ; do branch=${ref#refs/heads/} ; git branch -D $branch ; done"

 git pr 35
 git pr-clean

```

#### SSL certificate problem: self signed certificate in certificate chain

```
git config --global http.sslVerify false

```

#### git remote origin

```bash
# 1
git config --local --list
git remote add origin git@github.com:oseongryu/til.git

git remote remove origin
git config --local --list

git remote add origin git@github.com:oseongryu/til.git
git push -u origin main

# 2
git remote set-url origin git@github.com:oseongryu/til.git
```

#### git merge option

```bash
git merge [branch] --strategy-option ours
git merge [branch] --strategy-option theirs

#### fast-forward 관계에 있으면 commit을 생성하지 않고 현재 브랜치의 참조 값 만 변경(default)
git merge --ff [branch]

#### fast-forward 관계에 있어도 merged commit 생성
git merge --no-ff [branch]

#### fast-forward 관계에 있어도 merged commit 생성, merging 브랜치 정보 생략
git merge --squash [branch]

```

#### git remove specific file on all commit

```bash
git filter-branch --force --index-filter 'git rm --cached --ignore-unmatch 파일명' --prune-empty --tag-name-filter cat -- --all
git filter-branch --force --index-filter 'git rm -r --cached --ignore-unmatch 99_00_Software/[IntelliJ].md' --prune-empty --tag-name-filter cat -- --all
```

#### git stage to unstage

```bash
git reset HEAD -- .
```

### git discard change

```bash
git restore .
git reset --hard
```

#### git Directory 계정설정

```bash
git config --list --show-origin

.gitconfig(제외)
---
[user]
    email = oseongryu@gmail.com
    name = oseongryu
---

.gitconfig(추가)
---
[includeIf "gitdir:~/git/personal/"]
    path = .gitconfig-personal
[includeIf "gitdir:~/git/professional/"]
    path = .gitconfig-professional
---

.gitconfig-personal(추가)
---
[user]
    email = oseongryu@gmail.com
    name = oseongryu
---

.gitconfig-professional(추가)
---
[user]
    email = osryu@gmail.com
    name = osryu
---

```

#### 리모트 브랜치 참조 업데이트

```bash
# 리모트 브랜치의 더 이상 유효하지 않은 참조를 깨끗이 지우는 명령어
git remote prune origin
git remote update --prune

# 로컬 저장소를 최신 정보로 갱신(리모트 저장소와 동기화)하며 자동적으로 더이상 유효하지 않은 참조를 제거
git fetch -p
```

#### 실수로 삭제한 브랜치 복구하기

```bash
git reflog
git checkout -b 'temp' HEAD@{1}
```

#### 원격 브랜치 삭제

```bash
git push origin --delete feature/oseongryu
```

#### git 커밋이 잘못되어 복구하는 방법

```js
// 1. 방법
1. 로그로 특정 부분 헤더 확인
git log --pretty=format:"%h %cd %an %s" --since="2022-11-01" --until="2022-11-30" --committer=aaaa --committer=bbbb --committer=cccc
git log --pretty=format:"%h %cd %an %s" --since="2022-12-01" --until="2022-12-31" --committer=aaaa --committer=bbbb --committer=cccc
git log --pretty=format:"%h %cd %an %s" --since="2023-01-01" --until="2023-01-31" --committer=aaaa --committer=bbbb --committer=cccc
2. cherry-pick를 사용해서 통합

// 2. 간편 방법
최초 돌릴 부분으로 git reset --soft [HEAD명] 으로 돌린후
git status로 수정한 파일에서 자신이 수정한 파일목록 확인
```

#### ssh config (github, gitblit, gitlab)

```bash
# 2022.09.23. github oseongryu
Host github.com
    HostName github.com
    Port 22
    IdentityFile ~/.ssh/id_rsa_oseongryu
    User oseongryu

# 2022.09.23. gitlab osryu
Host corporation.gitlab.com
    HostName corporation.gitlab.com
    # Port 22
    IdentityFile ~/.ssh/id_rsa
    User osryu

# 2022.09.23. gitblit osryu
Host corporation.gitblit.com
    HostName corp.gitblit.com
    Port 29418
    IdentityFile ~/.ssh/id_rsa
    User osryu
    PubkeyAcceptedAlgorithms +ssh-rsa
    HostKeyAlgorithms +ssh-rsa
```

#### git stash

```
git stash
git stash save

git stash list

git stash apply
git stash apply stash@{0}

git stash drop stash@{0}

git stash pop

```

#### gitlab

```
데이터이관
https://trytoso.tistory.com/1313

일부 파일만 Merge
git checkout -p [가져올 파일이 있는 branch명] [가져올 파일의 경로]
# 현재 작업중인(checkout) 브랜치는 feature/devMain으로 가정
$ git checkout -p feature/pubMain \client\components\pages\common\NavTab.vue

y - stage this hunk → 페이지 단위 승인
n - do not stage this hunk
q - quit; do not stage this hunk nor any of the remaining ones
a - stage this hunk and all later hunks in the file → 일괄 승인
d - do not stage this hunk nor any of the later hunks in the file
g - select a hunk to go to
/ - search for a hunk matching the given regex
j - leave this hunk undecided, see next undecided hunk
J - leave this hunk undecided, see next hunk
k - leave this hunk undecided, see previous undecided hunk
K - leave this hunk undecided, see previous hunk
s - split the current hunk into smaller hunks
e - manually edit the current hunk
? - print help

Origin/main의 소스로 강제 적용
# 아무것도 병합하거나 리베이스 하지 않고 원격지에서 최신 커밋 정보를 다운로드
$ git fetch --all
# 현재 작업중인 것을 백업 브랜치로 분기(필요시)
$ git branch backup-main
# 강제로 내려받고자 하는 브랜치로 리셋
# --hard 옵션은 로컬에 충돌 가능한 수정사항이 있어도 무시하고 내려받음
$ git reset --hard origin/main
$ git reset --hard origin/<branch_name>

```

### git submodules

```
git submodule add git@github.com:oseongryu/corp-script.git
git submodule add git@github.com:oseongryu/corp-script.git 00_corp_script

### remove
To remove a submodule you need to:

1. Delete the relevant section from the .gitmodules file.
2. Stage the .gitmodules changes:
git add .gitmodules
3. Delete the relevant section from .git/config.
4. Remove the submodule files from the working tree and index:
git rm --cached path_to_submodule (no trailing slash).
5. Remove the submodule's .git directory:
rm -rf .git/modules/path_to_submodule
6. Commit the changes:
git commit -m "Removed submodule <name>"
7. Delete the now untracked submodule files:
rm -rf path_to_submodule

git submodule init
git submodule update
git submodule foreach git checkout main

```

### git bash zip

C:\Program Files\Git\mingw64\bin
https://stackoverflow.com/questions/38782928/how-to-add-man-and-zip-to-git-bash-installation-on-windows

1. [Navigate to this sourceforge page](https://sourceforge.net/projects/gnuwin32/files/zip/3.0/)
2. Download zip-3.0-bin.zip
3. In the zipped file, in the bin folder, find the file zip.exe.
4. Extract the file zip.exe to your mingw64 bin folder (for me: C:\Program Files\Git\mingw64\bin)
5. [Navigate to to this sourceforge page](https://sourceforge.net/projects/gnuwin32/files/bzip2/1.0.5/)
6. Download bzip2-1.0.5-bin.zip
7. In the zipped file, in the bin folder, find the file bzip2.dll
8. Extract bzip2.dll to your mingw64\bin folder (same folder as above: C:\Program Files\Git\mingw64\bin)

### git status filename oneline

```
git status --porcelain | sed s/^...//
git status -s | cut -c4-

git diff --name-only
git diff --name-only --staged
git diff --name-only HEAD
```

### git add 취소하기(unstage로 변경)

```bash
git add .

# 전체 되돌리기
git reset HEAD
# 특정파일 되돌리기
git restore --staged filename
```

### git 특정 커밋 이미지 파일이 사라지지 않는 경우

```
특정 커밋 이미지 파일이 깃으로 삭제가 계속 남는 경우
.git > config 파일에 해당 내용이 사라짐
[core]
	repositoryformatversion = 0
	filemode = false
	bare = false
	logallrefupdates = true
	ignorecase = true
```

### git 특정 파일의 수정사항 무시

```bash
# 특정 파일의 수정사항 무시하기
git update-index --assume-unchanged [file path]
# 특정 파일의 수정사항 무시 취소하기
git update-index --no-assume-unchanged [file path]
# 수정사항 무시 파일 조회
git ls-files -v|grep '^h'
```

### git lcoal에서만 적용

```bash
# 1
vim .git/info/exclude

git update-index --skip-worktree .vscode/launch.json
git update-index --no-skip-worktree .vscode/launch.json

# 2
git update-index --assume-unchanged .vscode/launch.json
git update-index --no-assume-unchanged .vscode/launch.json
git ls-files -v | grep '^[[:lower:]]'
```

### git push 하지 않은 목록 확인

```bash
git log --branches --not --remotes
git log --branches --not --remotes --oneline --graph --decorate
```

### git log clear

```bash
git reflog expire --expire=now --all
git gc --aggressive --prune=all
```

### git alias

```bash
# https://hannut91.github.io/blogs/git/config
git config --global alias.cm commit
git config --global alias.co checkout

# 머지된 브랜치 일괄삭제 (.gitconfig)
[alias]
    cleanbranch = "!git branch -d $(git branch --merged | grep -v '\\<master\\>')"
```

### git .gitattributes

```bash
# https://git-scm.com/book/ko/v2/Git맞춤-Git-Attributes
* text eol=lf
*.png binary
*.gif binary
*.woff binary
*.woff2 binary
*.otf binary
*.zip binary


* linguist-vendored
*.py linguist-vendored=false

# *.js linguist-detectable=false
# *.html linguist-detectable=false
# *.css linguist-detectable=false
# *.scss linguist-detectable=false
```

### git proxy (ssh, http)

```bash
# 1.ssh (git clone git@github.com:kubernetes/kubernetes.git)
# add ProxyCommand in ~/.ssh/config
 Host github.com
    HostName github.com
    Port 22
    IdentityFile ~/.ssh/id_rsa
    User oseongryu
    ProxyCommand nc -x 192.0.0.4:8000 -X connect %h %p #mac
    # ProxyCommand connect -S 192.0.0.4:8000 %h %p # ServerAliveInterval 10 #Windows

# only cli
git -c "http.proxy=192.0.0.4:8000" clone git@github.com:oseongryu/docker-composes.git



# 2.http (git clone https://github.com/kubernetes/kubernetes.git)
# add config in "~/.gitconfig"
git config --global http.proxy http://192.0.0.4:8000
git config --global https.proxy https://192.0.0.4:8000

git config --global http.proxy 'socks5://192.0.0.4:8000'
git config --global https.proxy 'socks5://192.0.0.4:8000'
```

#### References

```
Git Portable Location
https://www.theserverside.com/blog/Coffee-Talk-Java-News-Stories-and-Opinions/Where-system-global-and-local-Windows-Git-config-files-are-saved
https://trustyoo86.github.io/git/2017/11/28/git-remote-branch-create.html

https://velog.io/@hwang-eunji/github-2%EA%B0%9C-%EA%B3%84%EC%A0%95-%EC%82%AC%EC%9A%A9%ED%95%98%EA%B8%B0


https://trustyoo86.github.io/git/2017/11/28/git-remote-branch-create.html
https://beomseok95.tistory.com/167#google_vignette
git rebase: https://junlab.tistory.com/m/203
https://doublesprogramming.tistory.com/256
git local pull request: https://blog.outsider.ne.kr/1204
git cherry-pick: https://gitbetter.substack.com/p/how-to-use-git-cherry-pick-effectively
git submodule: https://pinedance.github.io/blog/2019/05/28/Git-Submodule
```
