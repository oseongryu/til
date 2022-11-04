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