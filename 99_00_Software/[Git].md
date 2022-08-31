## Git 사용방법

```bash
git --version
git config --global user.name "사용자명"
git config --global user.email "이메일"
git config --list

cd C:\Temp\sample
git init
git add *
git commit -m "설명"
git status

git remote add origin https://github.com/f5074/sample.git
git push origin master
```

## Git Revert

```bash
git log
git reset --hard "원하는 HEAD"
git push -f origin master
```

## Git Reset

```bash
git reset HEAD^ // 마지막 커밋 삭제
git reset --hard HEAD // 마지막 커밋 상태로 되돌림
git reset HEAD * // 스테이징을 언스테이징으로 변경
```

## git 병합취소

```bash
git merge --abort
```

## git config 설정시 저장 위치

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

## git branch

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

## git rebase

```
git branch
git checkout develop
git push

git checkout feature/test
git rebase develop
git checkout develop
git merge feature/test --ff
```

## git 로컬 내용 업데이트

```
git branch -r
git remote update

git branch -a
```

## git log

```
git log --oneline
git log --pretty=format:"%h - %an, %ar : %s"
git log --pretty=format:"%h %cd %an %s"
git log --stat
```

## 리눅스 권한 문제 관련이 있을 경우 (.git의 폴더에서 확인)

```
Unable to create '/home/user/repo/.git/refs
chown -R user:usergroup file/folder
```

## 맥에서 git 계정 2개 이상 사용 시 ssh 인증

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

## 다른 맥으로 .ssh설정 옮기기

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

## git Commit Message Structure

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

### git local pull request

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

### fetch github pr to local

```
git pull origin pull/35/head



-- git config에 설정
[alias]
  pr  = "!f() { git fetch -fu ${2:-origin} refs/pull/$1/head:pr/$1 && git checkout pr/$1; }; f"
  pr-clean = "!git for-each-ref refs/heads/pr/* --format='%(refname)' | while read ref ; do branch=${ref#refs/heads/} ; git branch -D $branch ; done"

 git pr 35
 git pr-clean

```

### SSL certificate problem: self signed certificate in certificate chain

```
git config --global http.sslVerify false

```


### git remote origin 
```bash
git config --local --list
git remote add origin git@github.com:oseongryu/til.git

git remote remove origin
git config --local --list

git remote add origin git@github.com:oseongryu/til.git
git push -u origin master

```

### git merge option
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

### git remove specific file on all commit 
```bash
git filter-branch --force --index-filter 'git rm --cached --ignore-unmatch 파일명' --prune-empty --tag-name-filter cat -- --all
git filter-branch --force --index-filter 'git rm -r --cached --ignore-unmatch 99_00_Software/[IntelliJ].md' --prune-empty --tag-name-filter cat -- --all
```

### References
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

```
