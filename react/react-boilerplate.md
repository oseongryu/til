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
```bash
npm install react-dropzone --save
```
6. onChange func 만들기
```bash
npm run dev
pkill node 5000
```

### 비디오 업로드 FORM 만들기 (2)

### Multer로 노드 서버에 비디오 저장하기
1. 노드 서버에 파일을 저장하기위해 Dependency를 먼저 다운로드 npm install multer --save in Server directory
2. 비디오 파일을 서버로 보내기
3. 받은 비디오 파일을 서버에서 저장
4. 파일 저장 경로를 클라이언트로 전달해 주기

### ffmpeg로 비디오 썸네일 생성하기
1. 썸네일 생성을 위한 Dependency를 다운 받기
2. 서버에 저장된 비디오를 이용한 썸네일 생성
3. 생성된 썸네일을 서버에 저장
4. 썸네일 이미지 파일 경로 정보를 클라이언트에 보내기
5. 썸네일 이미지를 화면에 표시

### 비디오 업로드 하기
1. 비디오 Collection을 만든다
2. onSubmit Function 을 만든다.
3. 요청할 데이터들을 서버로 보낸다.
4. 보낸 데이터들을 MongoDB에 저장 한다.

### 랜딩 페이지에 비디오들 나타나게 하기
1. 빈 랜딩 페이지 생성
2. 비디오 카드 Template 만들기
3. 몽고 DB에서 모든 비디오 데이터 가져오기
4. 가져온 비디오 데이터들을 스크린에 출력하기 

### 비디오 디테일 페이지 만들기
1. 비어있는 비디오 디테일 페이지 생성
2. 비디오 디테일 페이지를 위한 Route 만들기
3. 비디오 디테일 페이지 Template 만들기
4. MongoDB에서 비디오 데이터 가져오기
5. 가져온 데이터 들을 스크린에 출력한다

### 디테일 비디오 페이지에 Side 비디오 생성
1. Side Video 부분 Layout template 만들기
2. 한개의 카드 template 만들기
3. DB에서 모든 비디오 데이터를 불러오기
4. 불러온 데이터 화면에 출력하기

### 구독 기능 (1)
1. Subscriber Model 만들기
2. Subscribe Button UI 만들기
3. 데이터베이스에서 얼마나 많은 사람이 비디오 업로드 한 유저를 구독하는지 정보 가져오기
4. 내가 이 비디오 업로드 한 유저를 구독하는지 정보 가져오기
5. 가져온 정보들 화면에 출력

### 구독 기능 (2)
1. 구독하기 기능 만들기
2. 구독 취소하기 기능 만들기

### 구독 비디오 페이지
1. 빈 Subscription 페이지 생성
2. Subscription Page를 위한 Route 만들기
3. Template 만들기
4. 내가 구독한 유저의 비디오들만 서버에서 가져오기
5. 가져온 비디오 데이터들을 화면에 출력하기

### 댓글 기능 생성 (1) 구조 설명
1. 댓글 부분 구조 설명
2. Comment model 생성
3. 디테일 비디오 페이지에 Comment Component 만들기


### 댓글 기능 생성 (2) Comment.js
1. Comment.js를 위한 template 만들기
2. handleChange func 만들기
3. OnSubmit func 만들기
4. 저장된 댓글 데이터를 Parent Component 로 업데이트 하기
5. 콘솔창에서 댓글 리스트들 확인.


### 댓글 기능 생성 (3) SingleComment
1. Comment.js 에다가 SingleComment Component를 생성
2. Single Comment를 위한 Template 생성
3. Open Reply func와 handleChange func 만들기
4. OnSubmit func 만들기
4. 모든 Comment 정보들을 데이터 베이스에서 가져오기
5. 저장된 댓글을 Parent Component에다가 업데이트


### 댓글 기능 생성 (4) ReplyComment
1. ReplyComment Component를 Comment.js 에 만들기
2. Reply Comment템플릿을 만들기
3. 자식 코멘트 수를 구하기
4. Complete Comment System

### 좋아요 싫어요 기능 생성 (1) 구조 설명
1. Like & DisLike Model 만들기
2. 구조 설명

### 좋아요 싫어요 기능 (2) 템플릿, 데이터 가져오기
1. AntD을 이용하여 Like & DisLike 버튼 만들기
2. 현재 좋아요 싫어요 에 대한 정보를 DB 가져오기

(1) 좋아요 싫어요 숫자
(2) 내가 좋아요나 싫어요 둘중 하나를 이미 눌렀는지


### 좋아요 싫어요 기능 (3) 클릭시 기능들
1.onLike func 만들기
2.onDisLike func 만들기




### 도표 자료