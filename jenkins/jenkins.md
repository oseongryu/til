## jenkins

### jenkins setup

```bash
sudo wget -O /etc/yum.repos.d/jenkins.repo https://pkg.jenkins.io/redhat-stable/jenkins.repo --no-check-certificate
sudo rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io.key
sudo yum upgrade
# Add required dependencies for the jenkins package
sudo yum install java-11-openjdk
sudo yum install jenkins
sudo systemctl daemon-reload

sudo systemctl start jenkins
sudo systemctl status jenkins
systemctl reset-failed jenkins.service
```

### jenkins start

```bash
sudo cat /var/lib/jenkins/secrets/initialAdminPassword
```

<img width="800" src="https://raw.githubusercontent.com/oseongryu/til/refs/heads/main/public/img/99_17_jenkins/001.png"/>
<img width="500" src="https://raw.githubusercontent.com/oseongryu/til/refs/heads/main/public/img/99_17_jenkins/002.png"/>
<img width="800" src="https://raw.githubusercontent.com/oseongryu/til/refs/heads/main/public/img/99_17_jenkins/003.png"/>
<img width="800" src="https://raw.githubusercontent.com/oseongryu/til/refs/heads/main/public/img/99_17_jenkins/004.png"/>
<img width="800" src="https://raw.githubusercontent.com/oseongryu/til/refs/heads/main/public/img/99_17_jenkins/005.png"/>
<img width="800" src="https://raw.githubusercontent.com/oseongryu/til/refs/heads/main/public/img/99_17_jenkins/006.png"/>
<img width="800" src="https://raw.githubusercontent.com/oseongryu/til/refs/heads/main/public/img/99_17_jenkins/007.png"/>
<img width="800" src="https://raw.githubusercontent.com/oseongryu/til/refs/heads/main/public/img/99_17_jenkins/008.png"/>
<img width="800" src="https://raw.githubusercontent.com/oseongryu/til/refs/heads/main/public/img/99_17_jenkins/009.png"/>
<img width="800" src="https://raw.githubusercontent.com/oseongryu/til/refs/heads/main/public/img/99_17_jenkins/010.png"/>

### jenkins 에러 (젠킨스 업데이트 이후 에러가 발생해서 실행이 안됨)

```bash

# Error
# 2023-01-09 00:45:49.898+0000 [id=23690] INFO    hudson.model.Run#execute: UpdateJenkins #268 aborted
# java.lang.InterruptedException
#         at java.lang.Object.wait(Native Method)
#         at java.lang.Object.wait(Object.java:502)
#         at java.lang.UNIXProcess.waitFor(UNIXProcess.java:395)
#         at hudson.Proc$LocalProc.join(Proc.java:330)
#         at hudson.tasks.CommandInterpreter.join(CommandInterpreter.java:194)
#         at hudson.tasks.CommandInterpreter.perform(CommandInterpreter.java:144)
#         at hudson.tasks.CommandInterpreter.perform(CommandInterpreter.java:91)
#         at hudson.tasks.BuildStepMonitor$1.perform(BuildStepMonitor.java:20)
#         at hudson.model.AbstractBuild$AbstractBuildExecution.perform(AbstractBuild.java:806)
#         at hudson.model.Build$BuildExecution.build(Build.java:198)
#         at hudson.model.Build$BuildExecution.doRun(Build.java:163)
#         at hudson.model.AbstractBuild$AbstractBuildExecution.run(AbstractBuild.java:514)
#         at hudson.model.Run.execute(Run.java:1888)
#         at hudson.model.FreeStyleBuild.run(FreeStyleBuild.java:43)
#         at hudson.model.ResourceController.execute(ResourceController.java:99)
#         at hudson.model.Executor.run(Executor.java:432)

# 1. jenkins 설정정보 확인
cd /etc/rc.d/init.d/
vi jenkins

# 2. jenkins error 확인
cd /var/log/jenkins/
vi jenkins.log


# 3. 젠킨스 배포 위치 확인
cd /
find . -name "*.war"
/usr/lib/jenkins/jenkins.war

# 4. 젠킨스 실행되던 버전의 war 파일로 변경후 재실행
cp jenkins.war jenkins.war.20230109.bak
ll
rm -rf jenkins.war
cp jenkins.war.bak jenkins.war

netstat -tnlp
systemctl status jenkins
systemctl stop jenkins
systemctl start jenkins

```

## references

https://www.jenkins.io/doc/book/installing/linux/#red-hat-centos
