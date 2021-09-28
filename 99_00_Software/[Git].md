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

## References
Git Portable Location
https://www.theserverside.com/blog/Coffee-Talk-Java-News-Stories-and-Opinions/Where-system-global-and-local-Windows-Git-config-files-are-saved
https://trustyoo86.github.io/git/2017/11/28/git-remote-branch-create.html

https://velog.io/@hwang-eunji/github-2%EA%B0%9C-%EA%B3%84%EC%A0%95-%EC%82%AC%EC%9A%A9%ED%95%98%EA%B8%B0


https://trustyoo86.github.io/git/2017/11/28/git-remote-branch-create.html
