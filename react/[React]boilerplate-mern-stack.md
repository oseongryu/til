# 따라하며 배우는 노드, 리액트 시리즈

## 강의 목록
강의 소개
전체적인 틀 만들고 Mongo DB 연결
Boiler Plate 강의
비디오 업로드 FORM 만들기 (1)
비디오 업로드 FORM 만들기 (2)
Multer로 노드 서버에 비디오 저장하기
ffmpeg로 비디오 썸네일 생성하기
비디오 업로드 하기
랜딩 페이지에 비디오들 나타나게 하기
비디오 디테일 페이지 만들기
디테일 비디오 페이지에 Side 비디오 생성
구독 기능 (1)
구독 기능 (2)
구독 비디오 페이지
댓글 기능 생성 (1) 구조 설명
댓글 기능 생성 (2) Comment.js
댓글 기능 생성 (3) SingleComment
댓글 기능 생성 (4) ReplyComment
좋아요 싫어요 기능 생성 (1) 구조 설명
좋아요 싫어요 기능 (2) 템플릿, 데이터 가져오기
좋아요 싫어요 기능 (3) 클릭시 기능들
도표 자료


### 강의 소개



### 전체적인 틀 만들고 Mongo DB 연결
GIT REPOSITORY  - MERN STACK : 
https://github.com/jaewonhimnae/boilerplate-mern-stack

이건 완성본 소스 입니다  ^ ^ ~
https://github.com/jaewonhimnae/react-youtube-clone


1. 소스 다운로드 
git clone https://github.com/jaewonhimnae/boilerplate-mern-stack

2. 개발환경 설정
Visual Studio 2017, Python, Node.js가 설치되어 있어야 함

3. git 다운받은 위치에서 실행
node -v
npm install

cd client
npm install

4. server > config > key.js 에서 prod, dev로 나눠짐
dev.js파일 설정 후 MongoDB 설정


*  Windows 환경에서 Error (msvs_version not set from command line or npm config)
npm install --global node-gyp
npm install --global --production windows-build-tools

* Windows 환경에서 Error(msvs_version not set from command line or npm config)
npm config set msvs_version 2017

5. mongodb.com에 접속해서 Cluster 
클러스터 생성 

Connect Your Application > Copy

6. DataBase Access
User

7. Network Access
IP

8. DataBase > Connect > Connect Your Application

mongodb+srv://1234:<password>@cluster0.2l3sv.mongodb.net/myFirstDatabase?retryWrites=true&w=majority

### Boiler Plate 강의

* Boiler  Plate에 관한 강의
https://youtu.be/fgoMqmNKE18?list=PL9a7QRYt5fqkZC9jc7jntD1WuAogjo_9T


### 비디오 업로드 FORM 만들기 (1)
1. Upload page 만들기
2. Upload Page Route 만들기
3. Upload Page Header Tab 만들기
4. Form Template 만들기
5. 파일을 올리는 Template 만들기 위해 Drop-zone 다운받기
npm install react-dropzone --save
6. onChange func 만들기


npm run dev
pkill node 5000


### 비디오 업로드 FORM 만들기 (2)
### Multer로 노드 서버에 비디오 저장하기
### ffmpeg로 비디오 썸네일 생성하기
### 비디오 업로드 하기
### 랜딩 페이지에 비디오들 나타나게 하기
### 비디오 디테일 페이지 만들기
### 디테일 비디오 페이지에 Side 비디오 생성
### 구독 기능 (1)
### 구독 기능 (2)
### 구독 비디오 페이지
### 댓글 기능 생성 (1) 구조 설명
### 댓글 기능 생성 (2) Comment.js
### 댓글 기능 생성 (3) SingleComment
### 댓글 기능 생성 (4) ReplyComment
### 좋아요 싫어요 기능 생성 (1) 구조 설명
### 좋아요 싫어요 기능 (2) 템플릿, 데이터 가져오기
### 좋아요 싫어요 기능 (3) 클릭시 기능들
### 도표 자료