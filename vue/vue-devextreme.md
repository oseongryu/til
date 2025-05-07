##

```bash
// Generate a Vue 2 application
npx devextreme-cli new vue-app app-name

// Generate a Vue 3 application
npx devextreme-cli new vue-app app-name --version=3

cd app-name
npm run serve


devextreme add devextreme-vue
```

##

```bash
npx -p devextreme-cli devextreme add devextreme-vue
npm install devextreme@22.2 devextreme-vue@22.2 --save --save-exact
```

## devextreme 가이드

```
https://js.devexpress.com/Documentation/ApiReference/UI_Components/dxDataGrid/

검색을 사용해서 찾기
```

<img width="700" src="https://raw.githubusercontent.com/oseongryu/til/refs/heads/main/public/img/devextreme/001.png"/>

## grid checkbox

https://js.devexpress.com/Demos/WidgetsGallery/Demo/DataGrid/MultipleRecordSelectionModes/Vue/Light/
https://js.devexpress.com/Documentation/ApiReference/UI_Components/dxDataGrid/Configuration/selection/
https://js.devexpress.com/Documentation/ApiReference/UI_Components/dxDataGrid/Configuration/selection/#mode
https://codesandbox.io/s/rj5zzy

    <dx-data-grid ref="grid" :data-source="gridData" width="100%" height="100%"
        :selection="{ mode: 'multiple', showCheckBoxesMode: 'onClick' }"
        @selection-changed="onListSelectionChanged"

        >
        <dx-column alignment="center" width="100%" data-field="postId" caption="번호" />
        <dx-column alignment="center" width="100%" data-field="regUsrId" caption="작성ID" />
        <dx-column alignment="center" width="100%" data-field="regDttm" caption="작성일" :calculate-cell-value="data => formatters.datetime(data.regDttm)" />
        <dx-column alignment="center" width="100%" data-field="updUsrId" caption="수정ID" />
        <dx-column alignment="center" width="100%" data-field="updDttm" caption="수정일" :calculate-cell-value="data => formatters.datetime(data.regDttm)" />
    </dx-data-grid>

onListSelectionChanged(e) {
alert('temp')
if (e.selectedRowsData && e.selectedRowsData.length > 0) {
// this.disableRemoveButton = false
} else {
// this.disableRemoveButton = true
}
}

## devextreme grid cell change

https://js.devexpress.com/Demos/WidgetsGallery/Demo/DataGrid/ColumnCustomization/Vue/Light/

### grid cell edit

https://js.devexpress.com/Demos/WidgetsGallery/Demo/DataGrid/BatchEditing/Vue/Light/

```js
<template>
  <dx-data-grid
    ref="grid"
    :data-source="gridData" width="100%" height="600"
    :selected-row-keys="selectedItemKeys"
    :show-borders="true"
    @selection-changed="selectionChanged"
    >
    <dx-column width="80" alignment="center" caption="선택" cell-template="cellTemplate01" />
    <dx-column alignment="center" width="100%" data-field="postId" caption="번호" />
    <dx-column alignment="center" width="100%" data-field="regUsrId" caption="작성ID" >
      <DxLookup :data-source="names" value-expr="code" display-expr="name" />
    </dx-column>
    <dx-column alignment="center" width="100%" data-field="regDttm" caption="작성일" data-type="date" />
    <dx-column alignment="center" width="100%" data-field="updUsrId" caption="수정ID" />
    <dx-column alignment="center" width="100%" data-field="updDttm" caption="수정일" data-type="date" />
    <dx-selection mode="multiple" show-check-boxes-mode="always" select-all-mode="page" />
      <DxEditing
        :allow-updating="true"
        :allow-adding="true"
        :select-text-on-edit-start="true"
        start-edit-action="click"
        mode="form"
      />
  <dx-toolbar>
    <dx-item location="after" template="btnWrap" />
  </dx-toolbar>
    <template #cellTemplate01>
      <dx-check-box :value="false" />
      <!-- <dx-selection mode="multiple" show-check-boxes-mode="always" select-all-mode="page" /> -->
    </template>

              <template #btnWrap>
                <div>
                  <dx-button class="btn--input" :height="34" text="add" icon="exportxlsx" @click="add" />
                  <dx-button class="btn--input" :height="34" text="remove" icon="exportxlsx" @click="del" />
                  <dx-button class="btn--input" :height="34" text="저장" @click="save" />
                </div>
              </template>
  </dx-data-grid>
</template>

<script lang="ts">
import { Component, Ref, Prop, Emit, Watch, Model } from 'vue-property-decorator'
import { DxToolbar, DxItem, DxSelection, DxSorting, DxEditing, DxDataGrid, DxFilterRow, DxColumn, DxPaging, DxLookup } from 'devextreme-vue/data-grid'
import { DxButton as DxTextBoxButton } from 'devextreme-vue/text-box'
import { DxScrollView } from 'devextreme-vue/scroll-view'
import DxButtonGroup from 'devextreme-vue/button-group'
import DataSource from 'devextreme/data/data_source'
import CustomStore from 'devextreme/data/custom_store'
import DxSelectBox from 'devextreme-vue/select-box'


@Component({
  components: {
    DxScrollView,
    DxToolbar,
    DxItem,
    DxTextBoxButton,
    DxButtonGroup,
    DxSelection,
    DxSorting,
    DxEditing,
    DxDataGrid,
    DxColumn,
    DxPaging,
    DxLookup,
    DxSelectBox,
  },
})
export default class {
  @Ref() readonly grid: DxDataGrid
  names: any[] = [{ code: 'admin', name: 'admin' }, { code: 'adminb', name: 'adminb' }, { code: 'adminc', name: 'adminc' }]
  gridData: SampleGrid[] = []
  selectTextOnEditStart: true
  startEditAction: 'click'
  selectedItemKeys: [] = []


  selectionChanged(data) {
    this.selectedItemKeys = data.selectedRowKeys;
    console.log('selectionChanged')
  }
```

### grid summary

summary type - "sum","min","max","avg","count","custom"
https://js.devexpress.com/Demos/WidgetsGallery/Demo/DataGrid/RecalculateWhileEditing/jQuery/Light/
https://js.devexpress.com/Documentation/ApiReference/UI_Components/dxDataGrid/Configuration/summary/totalItems/#summaryType

```js
$(() => {
  $('#gridContainer').dxDataGrid({
    summary: {
      recalculateWhileEditing: true,
      totalItems: [
        {
          column: 'OrderNumber',
          summaryType: 'count',
        },
        {
          column: 'SaleAmount',
          summaryType: 'avg',
          valueFormat: 'currency',
        },
      ],
    },
  })
})
```

### button

```js
<template>
  <dx-button type="success" class="btn--etc--ct06" icon="search" :height="34" text="상품검색" @click="showProductPopup = true" id="product-sch-btn" />
</template>
<style scoped>
#product-sch-btn {
  color: white;
  background-color: #004b29;
}

#product-sch-btn.dx-state-hover {
  background-color: #004b29;
  color: white;
}

#product-sch-btn.dx-state-active {
  background-color: #004b29;
  color: white;
}
</style>
```
