요구사항 > 서비스 기획 > UI, UX 상세 설계 > GUI 디자인 > 퍼블리싱 > 백엔드 API 개발 > 프런트엔드 개발 > QA

night owl
material icon theme
vetur
vue vscode snippets

https://github.com/joshua1988/vue-til-server

- **버전**
  Node.js 이전 릴리즈 다운로드 페이지
  https://nodejs.org/ko/download/releases/
  OS 별로 아래 파일을 다운로드 받으시면 됩니다 :)
  윈도우 64비트 : x64-msi 파일
  윈도우 32비트 : x86-msi 파일
  맥 : pkg 파일
  리눅스 : tar 파일
  NVM 설치 진행 명령어
  https://gist.github.com/falsy/8aa42ae311a9adb50e2ca7d8702c9af1

- https://github.com/nvm-sh/nvm#installing-and-updating

  \*vscode
  terminal.integrated.shell.window

bash로 변경
사용자에 폴더에서 .bash_profile 파일추가

curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.1/install.sh | bash

nvm -v
nvm use system
vi ~/.bash_profile

export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm

source ~/.bash_profile

nvm install 12.14.0
nvm install 10.16.3


### vue click async
https://stackoverflow.com/questions/64883186/basic-async-call-on-click-event-in-template-vuejs

### vue computed
https://velog.io/@jinsu6688/vuejs-computed

### vue dx-grid row

https://stackoverflow.com/questions/5497073/how-to-differentiate-single-click-event-and-double-click-event


### vue smart editor2 image upload

https://javafactory.tistory.com/1259
http://naver.github.io/smarteditor2/user_guide/2_install/download.html
https://zero-gravity.tistory.com/171
https://github.com/naver/smarteditor2/releases/tag/v2.8.2.3
http://webprogramer.kr/blog/P000000364/post.do
http://www.todayhumor.co.kr/board/view.php?table=programmer&no=11347
https://holybell87.tistory.com/12


```js
* 사용버전 : 2.8.2.12056
1. /SE2.8.2.O12056/sample/js/plugin/hp_SE2M_AttachQuickPhoto.js
var sPopupUrl = "이미지 업로드 팝업창 표시URL"; 로 수정

2. 이미지 업로드 팝업창을 통해, 업로드 한 후
   Smart Editor에 이미지 업로드 결과를 반영하기 위해 만든 function을 호출하는 부분에서
window.opener.parent.function이름(); 요론식으로 호출해야 한다.
 

Smart Editor가 iFrame으로 생성되니...

이미지 업로드 기능을 만들어 놓지 않았다면
요기로 가면, JSP로 만들어 놓은 분이 계시다.

http://zero-gravity.tistory.com/171
```

https://lilymate.tistory.com/476


### vue grid addrow



https://js.devexpress.com/Demos/WidgetsGallery/Demo/FloatingActionButton/Overview/Vue/Light/


```js
<dx-button class="btn--input" width="68" height="34" text="추가" @click="addNewRow" />
<dx-button class="btn--input" width="68" height="34" text="완료" @click="saveGridInstance" />

  saveGridInstance() {
    console.log('aaaa')
    // debugger
    // this.grid.instance.beginUpdate()
    // this.grid.instance.closeEditCell()
    this.grid.instance.saveEditData()
    // this.grid.instance.refresh()
    console.log('bbb')
  }
```

### devextreme customstore remove
https://js.devexpress.com/Documentation/ApiReference/Data_Layer/CustomStore/


### devextreme popup
```js
    <!-- 팝업시작 -->
    <h3 class="hy-h3 required">팝업</h3>
    <div class="row-box mgt-20">
      <dx-button class="btn--input" height="34" text="팝업오픈" @click="popupOpen()" />
    </div>
    <dx-popup :visible.sync="show" width="600" title="팝업가이드">
      <div class="sub-head">
        서브 헤더 영역
      </div>
      <!-- 스크롤이 필요 없을 경우 삭제 -->
      <DxScrollView class="scrollview" ref="scrollViewWidget">
        <!-- popup -->
        <div class="hy-popup">
          팝업 콘텐츠 영역...
    
          <div class="btn-wrap center">
            <!-- 좌우 정렬 span.left 사용 -->
            <!-- <span class="left">
                              <dx-button class="btn--base" width="120" height="40" text="취소" />
                            </span> -->
            <dx-button class="btn--base" width="120" height="40" text="취소" @click="popupClose" />
            <dx-button class="btn--solid" width="120" height="40" text="승인요청" />
          </div>
        </div>
      </DxScrollView>
    </dx-popup>
    <!-- 팝업 종료 -->
  show: boolean = false

  popupOpen() {
    console.log('open')
    this.show = true
  }

  popupClose() {
    console.log('close')
    this.show = false
  }
```