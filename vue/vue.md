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


### vue grid edit
https://js.devexpress.com/Documentation/Guide/UI_Components/DataGrid/Editing/#User_Interaction/Row_Mode
https://js.devexpress.com/Demos/WidgetsGallery/Demo/DataGrid/RowEditingAndEditingEvents/Vue/Light/

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
    <h3 class="hy-h3 required">팝업</h3>
    <div class="row-box mgt-20">
      <dx-button class="btn--input" height="34" text="팝업오픈" @click="popupOpen()" />
    </div>
    <!-- 팝업시작 -->
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

### devextreme textbox showclearbutton
```js
<dx-text-box v-model="searchCondition.id" :show-clear-button="true" />
```

https://js.devexpress.com/Documentation/ApiReference/UI_Components/dxTextBox/Configuration/#showClearButton

### vue style 적용
```js
<div v-show="!!text4" :style="{ display: !!text4? 'inline-block' :'none' }"> </div>
```

### devextreme excel upload
```js
  <u-file-upload-box
    v-model="result2"
    file-grp-id="file4"
    select-button-text="엑셀파일 업로드"
    upload-type="convert"
    converted-file-type="excel"
    model-class-name="com.test.FileExcelSampleModel"
    :stop-on-error="true"
    :saveable="false"
    :editable="true"
  />
```

### devextreme image upload
```js

https://codesandbox.io/s/jgpcd2?file=/App.vue
https://codesandbox.io/s/jgpcd2?file=/App.vue:334-345
```

### vue import alias
```js
import { DxToolbar, DxItem, DxSelection, DxEditing, DxDataGrid } from 'devextreme-vue/data-grid'
import { DxToolbar as DxToolbar2, DxItem as DxItem2, DxSelection as DxSelection2, DxEditing as DxEditing2, DxDataGrid as DxDataGrid2 } from 'devextreme-vue/data-grid'
```

### vue error
```
https://nodejs.org/download/release/v16.17.1/


internal/modules/cjs/loader.js:818
  throw err;
  ^
Error: Cannot find module 'node:fs'


node_modules/rc9/dist/index.cjs
rc9/dist/index.cjs

https://cocoon1787.tistory.com/851
https://cocoon1787.tistory.com/851
https://medium.com/@su_bak/cannot-find-module-fs-promises-%E1%84%8B%E1%85%A6%E1%84%85%E1%85%A5-%E1%84%92%E1%85%A2%E1%84%80%E1%85%A7%E1%86%AF-%E1%84%87%E1%85%A1%E1%86%BC%E1%84%87%E1%85%A5%E1%86%B8-a344921bd430
```

### vue prop
prop설정후에는 f5 진행후 하기

  // @Prop({ default: '' }) fileId: string
  @Prop() fileId: string = '' (x)
Avoid mutating a prop directly since the value will be overwritten whenever the parent component re-renders. Instead, use a data or computed property based on the prop's value. Prop being mutated: "fileId"


### devextreme grid link
https://js.devexpress.com/Documentation/ApiReference/UI_Components/dxDataGrid/Configuration/columns/#cellTemplate

### vue grid focused-row-changing
```js
      <dx-data-grid ref="grid" :data-source="gridData" width="100%" height="100%" @focused-row-changing="onFocusedRowChanging" @focused-row-enabled="true" key-expr="regDttm">
        <dx-column alignment="center" width="100%" data-field="rownum" caption="번호" />
        <dx-column alignment="center" width="100%" data-field="regUsrId" caption="작성ID" />
        <dx-column alignment="center" width="100%" data-field="regDttm" caption="작성일" :calculate-cell-value="data => formatters.datetime(data.regDttm)" />
        <dx-column alignment="center" width="100%" data-field="updUsrId" caption="수정ID" />
        <dx-column alignment="center" width="100%" data-field="updDttm" caption="수정일" :calculate-cell-value="data => formatters.datetime(data.regDttm)" />
      </dx-data-grid>

// onSelectionChanged({ selectedRowsData }) {
  //   debugger
  //   const data = selectedRowsData[0]
  //   alert('ss')
  // }

  clickTimer: any
  lastRowCLickedId: any
  onFocusedRowChanging(e) {
    //OBTAIN YOUR GRID DATA HERE
    console.log('test')
    if (this.clickTimer && this.lastRowCLickedId === e.rowIndex) {
      console.log('aaaa')
      clearTimeout(this.clickTimer)
      this.clickTimer = null
      this.lastRowCLickedId = e.rowIndex

      const key = e.event && e.event.key
      if (e.event.detail === 2) {
        // alert('test')
      }
      //YOUR DOUBLE CLICK EVENT HERE
      // if (typeof dblClickFunc == 'function') {
      // }
    } else {
      this.clickTimer = setTimeout(function () {}, 250)
    }
    this.lastRowCLickedId = e.rowIndex
  }

  // const pageSize = e.component.pageSize()
  // const pageIndex = e.component.pageIndex()
  // const isLoading = e.component.getController('data').isLoading()
  // const key = e.event && e.event.key
  // if (!isLoading) {
  //   if (key && e.prevRowIndex === e.newRowIndex) {
  //     if (e.newRowIndex === pageSize - 1) {
  //       e.component.pageIndex(pageIndex + 1).done(() => {
  //         e.component.option('focusedRowIndex', 0)
  //       })
  //     } else if (e.newRowIndex === 0) {
  //       e.component.pageIndex(pageIndex - 1).done(() => {
  //         e.component.option('focusedRowIndex', pageSize - 1)
  //       })
  //     }
  //   }
  // }
  // }
```

###
#### 방법1 node 재설치
1. node 12버전 삭제 
2. 재설치
https://nodejs.org/download/release/v16.17.1/

#### 방법2 nvm 사용시
1. nvm install 16.17.1
2. nvm use 16.17.1
3. nvm alias default 16.17.1

### vue grid
```js
    this.gridDataSource = new DataSource({
      store: new CustomStore({
        load: async loadOptions => {
          const paginationRequest = createPagingParameter(loadOptions)
          const result = await orderConsignmentListService.getOrderConsignmentList(paginationRequest.header, this.params)
          this.gridData = result.body
          this.totalCount = result.header.totalRecords
          return {
            data: this.gridData,
            totalCount: result.header.totalRecords,
          }
        },
      }),
    })


    this.gridDataSource = new DataSource({
      store: this.gridData
    });

```

#### databindiing
https://js.devexpress.com/Documentation/Guide/UI_Components/PivotGrid/Data_Binding/

##### CustomStore
https://supportcenter.devexpress.com/ticket/details/t428982/customstore-how-to-process-load-options-provided-by-dxdatagrid

### vue grid paging
https://js.devexpress.com/Demos/WidgetsGallery/Demo/DataGrid/RecordPaging/Vue/Light/

```js
<dx-scrolling 
  mode="standard"
  column-rendering-mode="virtual"
  :use-native="false"
  />
<dx-paging
  :enabled="true"
  :page-size="10"
  :page-index="0" />
<dx-pager 
  :show-page-size-selector="true"
  :show-info="true"
  info-text="현재 페이지 {0}. 전체항목: {2}개" />
```

```js
<DxScrolling row-rendering-mode="virtual"/>
<DxPaging :page-size="10"/>
<DxPager
  :visible="true"
  :allowed-page-sizes="pageSizes"
  :display-mode="displayMode"
  :show-page-size-selector="showPageSizeSelector"
  :show-info="showInfo"
  :show-navigation-buttons="showNavButtons"
/>
```

```js
  displayMode:string =  'full'
  pageSizes: any[] = [5, 10, 'all']
  showPageSizeSelector: boolean =true
  showInfo: boolean=true
  showNavButtons: boolean=  true
```

### vue style

style="visibility: hidden"
style="display: none"


### vue dx-list

```js
<div class="col">
  <strong>대분류</strong>
  <dx-list
    v-model="fstCtgValue"
    :data-source="fstCtgIds" 
    display-expr="codeNm"
    :height="175"
    selection-mode="single"
    page-load-mode="scrollBottom"
    :search-enabled="true"
    search-mode="contains"
    search-expr="codeNm"
    @selection-changed=selectionChangedFirst($event)
    />
</div>
<div class="col">
  <strong>중분류</strong>
  <dx-list 
    v-model="scdCtgValue"
    :data-source="scdCtgIds"
    :height="175"
    selection-mode="single"
    page-load-mode="scrollBottom"
    :search-enabled="true"
    search-mode="contains"
    search-expr="codeNm"
    @selection-changed=selectionChangedSecond($event)
    >
    <template #item="{ data: data, index: index }">
      {{ data.codeNm}}
    </template>  
  </dx-list>

</div>


<dx-list 
  v-model="scdCtgValue"
  :data-source="scdCtgIds"
  :height="175"
  selection-mode="single"
  @selection-changed=selectionChangedSecond($event)
>
  <template #item="{ data: row, index: index }">
    <!-- <ul class="temp" style='display: none'> -->
    <ul class="temp" v-if='index== 2'>
      <li>
          {{ index }}
          {{ row.code}}
      </li> 
    </ul>
  </template>  
</dx-list>
```

### vue dom 사용

https://bono915.tistory.com/entry/VueJS-refs%EC%9C%BC%EB%A1%9C-Dom%EC%97%90-%EC%A0%91%EA%B7%BC%ED%95%98%EB%8A%94-%EB%B0%A9%EB%B2%95


### vue for
```js
    <template v-for="(item, index) in fileInfo" >
      <template>
        <dd class="hy-attch" v-bind:key="item.fileName" >
            <a href= "javascript:;" @click="()=>{download(item.fileGrpId, item.fileId, item.fileNo, '', 1)}">{{ item.orgName }}</a>
        </dd>
      </template>
    </template>
```

### File chooser dialog can only be shown with a user activation.
```js

```

### vue emit and model
```js
// parent -emit 방식
<editor-product-regist @value="changeDatass"/>
  changeDatass(data: string) {
    console.log('my!!!', data)
  }

// parent - 모델방식
<editor-product-regist v-model="changeData"/>

  changeData: string = ''

  @Watch('changeData')
  changeData() {
    console.log(this.changeData)
  }

// child

  @Model('value', { default: null }) readonly value

  @Watch('content', { immediate: true })
  changeContent() {
    this.$emit('value', this.content)
  }

```

### vue paging
```js
<dx-scrolling 
  mode="standard"
  column-rendering-mode="virtual"
  :use-native="false"
  />
<dx-paging
  :enabled="true"
  :page-size="10"
  :page-index="0" />
<dx-pager 
  :visible="true"
  :show-page-size-selector="true"
  :show-info="true"
  info-text="현재 페이지 {0}. 전체항목: {2}개" 
  />

  @Ref() readonly grid: DxDataGrid
  gridData: OrderConsignmentList[] = []
  loadParam: any

  async loadData() {
    this.loadParam = {
      "currentPage": 1,
      "pageSize": 10,
      "orders": []
    }
    const paginationRequest = createPagingParameter(this.loadParam)
    const result = await testService.getSelect(paginationRequest.header, this.params)
    this.gridData = result.body
    this.totalCount = result.header.totalRecords
  }

  async search(params) {
    this.params = params
    this.loadData()
  }

```

### vue promise
```js
.catch(error => alert(error.message));

.then(response => response.json())
```



### vue devextreme grid insert
```js
this.gridDataSource = this.grid.instance.getDataSource()
this.gridDataSource.store().push([{ type: 'insert', data: newDeliveryFee }])
```

### vue devextreme grid checkbox
```js
:selection="{ mode: 'multiple', showCheckBoxesMode: 'onClick' }"
      @selection-changed="onListSelectionChanged"

onListSelectionChanged(e) {
    alert('temp')
    if (e.selectedRowsData && e.selectedRowsData.length > 0) {
      // this.disableRemoveButton = false
    } else {
      // this.disableRemoveButton = true
    }
  }
```

### vue devextreme theme
```js
https://js.devexpress.com/Documentation/Guide/Themes_and_Styles/Icons/
https://js.devexpress.com/Demos/WidgetsGallery/Demo/Button/Icons/Vue/Light/
```

### vue se2
```js
https://junesker.tistory.com/16
https://m.blog.naver.com/hiizero/221639344451
http://naver.github.io/smarteditor2/user_guide/4_photouploader/intro.html
http://naver.github.io/smarteditor2/user_guide/
```

### vue devextreme data-period-box
```js
<dx-date-period-box v-model="dateInput5" :width="150" mode="datetime" />
```

### vue window postmessgae
    http://guide.ustraframework.kro.kr/ref-doc/03/5wtYKOTfWycqrQuucpyn


### vue grid option
```js
<dx-data-grid
  :data-source="gridDataSource"
  :show-borders="true"
  :allowColumnReordering="true"       // <===== 그리드 컬럼 위치 변경 가능 여부
  :allowColumnResizing="true"
  :row-alternation-enabled="false"
  :show-row-lines="true"
  :column-min-width="80"
>
:allowColumnReordering="true"       // <===== 그리드 컬럼 위치 변경 가능 여부
:allowColumnResizing="true"         // <===== 그리그 컬럼 사이즈 변경 가능 여부
<dx-selection mode="single" /> // <==== multiple 체크박스, single 선택한 라인 보이기, none 아무것도 없음
<pager.infoText>
{0} - 현재 선택한 페이지 (shows the current page number.)
{1} - 전체 페이지 (shows the total page count.)
{2} - 전체 행 개수 (shows the total row count.)
```

### vue devextreme grid template
```js
<dx-data-grid ref="grid" :data-source="gridData" width="100%" height="100%">
   <dx-column alignment="center" width="100%" data-field="postId" caption="번호" />
   <dx-column :width="100" :allow-sorting="false" data-field="Picture" cell-template="cellTemplate"/>
   <template #cellTemplate>
      <img src="http://localhost/image.png">
   </template>
</dx-data-grid>
https://codesandbox.io/s/ixjl38?file=/App.vue
https://supportcenter.devexpress.com/ticket/details/t657515/how-to-show-an-image-in-datagrid-column
https://js.devexpress.com/Documentation/Guide/UI_Components/DataGrid/Columns/Customize_Cells/#Customize_the_Appearance
https://js.devexpress.com/Demos/WidgetsGallery/Demo/DataGrid/ColumnTemplate/Knockout/Light/
```


### vue addEvent
```
https://stackoverflow.com/questions/55067565/vue-js-add-event-listener-inside-instance
```

### vue devextreme exprot xlsx, pdf
```
https://shiftkey.tistory.com/28
https://js.devexpress.com/Documentation/ApiReference/UI_Components/dxDataGrid/Configuration/export/
https://js.devexpress.com/Demos/WidgetsGallery/Demo/DataGrid/ExcelJSOverview/Vue/Light/
```

### vue devextreme grid cell change
```js
  <dx-data-grid id="sampleGrid" ref="grid" :data-source="gridData" width="100%" height="600"
    :selected-row-keys="selectedItemKeys" :show-borders="true" @editorPreparing="onEditorPreparing"
    @editingStart="onEditingStart($event)">

  onEditingStart(e) {
    // e.column.allowEditing = true
    // console.dir(e.column.name)
    // // debugger
    // console.dir(e.key.postId == 43)
    // if (e.column.name == "isChecked") {
    //   if (e.key.isChecked == true) {
    //     e.cancel = true;

    //     console.log('testa')
    //   }
    // }

    // }
    // console.dir()
    // if (info.key == 2) {
    // info.cancel = true;
    // }
  }

  onEditorPreparing(e) {
    // console.dir(e.row.isSelected)
    // console.log('onEditorPreparing')
    if (e.parentType === 'dataRow' && e.dataField === 'isChecked' && e.row.isSelected == true) {
      console.log('test')

      e.row.isSelected = true
      // e.editorOptions.disabled = true
    }
  }    
```

### vue model add
```js
import { ProofFile } from '@/models/data-model'

getUploadList() {
  var fileIdList = [{ etpsCd: 'a100', fileId: 'aaaaa', fileTpCd: 'F100' }, { etpsCd: 'b100', fileId: 'bbbbb', fileTpCd: 'F200' }]
  var updateList = []
  fileIdList.map(row => {
    let proofFile: ProofFile = {
      fileId: row.fileId,
      etpsCd: row.etpsCd,
      fileTpCd: row.fileTpCd,
      fileNo: 1,
    }
    updateList.push(proofFile)
  })
}

```

### vue refs 사용
```js
<file-upload-product-regist fileGrpId="default-file-group" ref = "refFileUpload" />
  getFileList() {
    const val = (this.$refs['refFileUpload'] as FileUpload).getUploadList()
    val.map(test => { console.dir(test) })
  }

```

### vue typeof 와 instanceof의 차이, 타입 또는 클래스 구분하기

https://unikys.tistory.com/260

### vue arr인지 확인
```
Array.isArray()

https://hianna.tistory.com/402
```

### vue tap index
```js
<dx-tab-panel :selected-index.sync="tabIndex2" :data-source="tab2" height="100%" :width:="500"
  @selection-changed="tab2IndexChanged">
  <template #title="{ data }">
    <span>{{ data.name }}</span>
  </template>
  <template #tab1>
    <!-- <sub-tab ref="grid1" /> -->
  </template>
  <template #tab2>
    <!-- <sub-tab ref="grid2" /> -->
  </template>
  <template #tab3>
    <!-- <sub-tab ref="grid3" /> -->
  </template>
</dx-tab-panel>

  tabIndex2 = 0

  tab2 = [
    { name: '결제건수', template: 'tab1', disabled: false },
    { name: '결제자수', template: 'tab2', disabled: false },
    { name: '결제금액', template: 'tab3', disabled: false },
  ]

  tab2IndexChanged() {
    if (this.tabIndex2 === 0) {
      // @ts-ignore
      // this.$refs.grid1.loadData()
    } else if (this.tabIndex2 === 1) {
      // @ts-ignore
      // this.$refs.grid2.loadData()
    } else if (this.tabIndex2 === 2) {
      // @ts-ignore
      // this.$refs.grid3.loadData()
    }
  }
```

### vue config, querystring
```js
@Component({
  config: {
    auth: {
      required: false
    }
  },
})

  created() {
    console.log('created')
    console.dir(this.$route.query)
  }

```

### vue notion
```js
https://www.npmjs.com/package/vue-notion?activeTab=readme

```

### vue querystring

```js
  funcQueryString(data: any) {
    var keys = []
    for (var number in data) {
      if (data.hasOwnProperty(number)) keys.push(number)
    }
    var querysting = ''
    keys.map((row, index) => {
      if (index == 0) querysting += `?${row}=${data[row]}`
      else querysting += `&${row}=${data[row]}`
    })
    return querysting
  }
```

### vue devextreme floating action button
```js

    <DxSpeedDialAction :index="1" icon="" label="전체 탭 닫기" :on-click="() => success= true" />


import config from 'devextreme/core/config';
import FloatingActionButtonDirection from 'devextreme/core/config';
import repaintFloatingActionButton from 'devextreme/ui/speed_dial_action/repaint_floating_action_button';~~~~
import DxSpeedDialAction from 'devextreme-vue/speed-dial-action';

    config({
      floatingActionButtonConfig: {
        icon: 'rowfield',
        shading: true,
        direction: 'down',
        position: {
          of: '.dx-datagrid-rowsview',
          my: 'right top',
          at: 'right top',
          offset: '-20 90',
        },
      },
    });

    repaintFloatingActionButton();

https://js.devexpress.com/Demos/WidgetsGallery/Demo/FloatingActionButton/Overview/Vue/Light/
```

### vue devextreme icon
```js
<dx-button icon="deletetable" v-if="menu.text == 'Home'" @click="clickCloseAllTab()" />

https://js.devexpress.com/Documentation/Guide/Themes_and_Styles/Icons/
```

### vue devextreme validator
```js
https://js.devexpress.com/Documentation/ApiReference/UI_Components/dxValidator/Validation_Rules/PatternRule/
https://js.devexpress.com/Demos/WidgetsGallery/Demo/Validation/Overview/Vue/Light/
```

### vue devextreme textbox mode 오류
```js
// dx-text-box가 password를 누른 상태에서 다른 텍스트 박스를 누를경우 모드가 기존에 클릭한 mode로 되는 현상
<dx-text-box ref="refTextBox" class="side-search-input" v-model="searchText" mode="search"
        placeholder="입력" value-change-event="input" :readOnly="!isFocused" @focusIn="focusIn()"
        @focusOut="focusOut()" />

@Ref() refTextBox: DxTextBox
  focusIn() {
    this.isFocused = true
    this.refTextBox.mode = "text"
  }
  focusOut() {
    this.isFocused = false
    this.refTextBox.mode = "text"
  }


```

### vue file upload download
```js
https://stackoverflow.com/questions/41803925/download-octet-stream-via-jquery
https://kyounghwan01.github.io/blog/JS/JSbasic/Blob-url/
https://stackoverflow.com/questions/37510801/convert-octet-stream-to-image


```
### nuxt gitlab [error] Couldn't find any versions for
```js
원인: gitlab에서 nexus에 패키지의 특정 버전이 삭제되면서 발생한 오류

점검1: gitlab에서 빌드를 진행하는 cd /app/gitlab-runner/builds/aaa/0/aaa
=> .npmrc 확인, yarn install 가능한지 확인, yarn관련 파일 삭제후 진행 등

점검2: gitlab-ci.yml
=> 스크립트 확인

점검3: nexus 이동후 점검 Browser
=> 해당 패키지또는 라이브러리 확인

git-runner 
.npmrc


Run yarn again.
Run yarn --force.
If it still does not help, you can wipe yarn.lock and run yarn again.
```


### vue security
```
import VueSanitize from "vue-sanitize";
Vue.use(VueSanitize);

https://dev.grapecity.co.kr/bbs/board.php?bo_table=Insight&wr_id=118
```

### vue cell color change
```js

vm.statusData = [];
vm.statusData = [
    {
        "iStatus": 1,
        "sName": "No Work",
        "sDesc": "No Work Done",
        "dPercentComplete": 0,
        "sColor": "Red"
    },
    {
        "iStatus": 2,
        "sName": "WIP",
        "sDesc": "Work In Progress",
        "dPercentComplete": 50,
        "sColor": "Yellow"
    },
    {
        "iStatus": 3,
        "sName": "Complete",
        "sDesc": "Work Complete",
        "dPercentComplete": 100,
        "sColor": "Green"
    }
];

onCellPrepared: function(e) {
  if (e.rowType != "data" || e.columnIndex != 1)
    return;
  
  // debugger;  
  var color = e.column.lookup.items[e.value - 1].sColor  
  e.cellElement.css('backgroundColor', color);

},

https://supportcenter.devexpress.com/ticket/details/t571121/dxdatagrid-how-to-set-a-custom-cell-color-based-on-a-lookup-value
https://plnkr.co/edit/Cr8UZvI1hxRY60CBDxX3?p=preview&preview

```

### volar
```
"volar.inlayHints.eventArgumentInInlineHandlers": true
```

### security
```js
"><script>alert("XSS")</script>
"><script>alert("XSS")</script>

" onclick=alert(1)//<button ' onclick=alert(1)//> 
" onclick=alert(1)//<button ' onclick=alert(1)//> */ alert(1)//


"><marquee/onstart=confirm(String.fromCharCode(88,
"><marquee/onstart=confirm(String.fromCharCode(88,83,83))>//


<html>
  <body onload="document.forms[0].submit()">
    <form action="https://testsite.com/logout">
    </form>
  </body>
</html>
```

### 중복체크
```js
// 확인할 값
const checkedList = this.refProductDxDataGrid.instance.getSelectedRowsData()

this.gridData.map(row => { if (row.testId.lastIndexOf(checkedList[0].testId) > -1) flag = true })

this.gridData.some(row => row.testId === checkedList[0].testId)
```

### isEmpty
```js
isEmpty(val) {
  var result = false
  if (val != null && val != 'undefined' && val != '') {
    result = true
  }
  return result
}
```

### references
https://junior-datalist.tistory.com/236

