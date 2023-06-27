### 월별 스프레드시트 일괄 숨기기
```js
/** @OnlyCurrentDoc */

function myFunction() {
  // var spreadsheet = SpreadsheetApp.getActive();
  // spreadsheet.getRange('P163:NP163').activate();
  // spreadsheet.getRange('P163').copyTo(spreadsheet.getActiveRange(), SpreadsheetApp.CopyPasteType.PASTE_NORMAL, false);

  var activeSpreadSheet = SpreadsheetApp.getActiveSpreadsheet();

  var sheetArr = ['상품', '전시', '캠페인', '주문', '회원','물류/정산', '외부연동']
  for (var arrIndex = 0; arrIndex < sheetArr.length; arrIndex++){
    var spreadsheet = activeSpreadSheet.getSheetByName(sheetArr[arrIndex]);
    // Logger.log(spreadsheet.getMaxColumns())
    // 1월 숨기기
    var range = spreadsheet.getRange("P:AT");
    spreadsheet.hideColumn(range);
    // 2월 숨기기
    var range = spreadsheet.getRange("AU:BV");
    spreadsheet.hideColumn(range);
    // 3월 숨기기
    var range = spreadsheet.getRange("BW:DA");
    spreadsheet.hideColumn(range);
    // 4월 숨기기
    var range = spreadsheet.getRange("DB:EE");
    spreadsheet.hideColumn(range);
    // 5월 숨기기
    var range = spreadsheet.getRange("EF:FJ");
    spreadsheet.hideColumn(range);
    // // 6월 전반기 숨기기
    // var range = spreadsheet.getRange("FK:GB");
    // spreadsheet.hideColumn(range);
  }
};
```

```js
/** @OnlyCurrentDoc */

function myFunction() {
  // var spreadsheet = SpreadsheetApp.getActive();
  // spreadsheet.getRange('P163:NP163').activate();
  // spreadsheet.getRange('P163').copyTo(spreadsheet.getActiveRange(), SpreadsheetApp.CopyPasteType.PASTE_NORMAL, false);

  var activeSpreadSheet = SpreadsheetApp.getActiveSpreadsheet();
  var arrSheetName = ['상품', '전시', '캠페인', '주문', '회원','물류/정산', '외부연동']

  // // 0.Sheet 전체 컬럼 추가
  // for (var arrIndex = 0; arrIndex < arrSheetName.length; arrIndex++){
  //   var spreadsheet = activeSpreadSheet.getSheetByName(arrSheetName[arrIndex]);
  //   Logger.log(spreadsheet.getMaxColumns());
  //   if(spreadsheet.getMaxColumns() == 381) {
  //     break;
  //   }
  //   for(var columnIndex = 0; columnIndex <= 380; columnIndex++) {
  //     if(spreadsheet.getMaxColumns() < 381){
  //       spreadsheet.insertColumns(1);
  //     }
  //   }
  // }

  // 1. Sheet 전체 사이즈 조정
  var arrColumnWidth = [23, 42, 77, 77, 77, 465, 65, 65, 65, 60, 60, 60, 60, 60, 128]
  for (var arrIndex = 0; arrIndex < arrSheetName.length; arrIndex++){
    var spreadsheet = activeSpreadSheet.getSheetByName(arrSheetName[arrIndex]);
    // Logger.log(spreadsheet.getMaxColumns());

    for(var columnIndex = 0; columnIndex < arrColumnWidth.length; columnIndex++) {
      spreadsheet.setColumnWidth(columnIndex + 1, arrColumnWidth[columnIndex]);
    }
    spreadsheet.setColumnWidths(arrColumnWidth.length + 1, 380 - arrColumnWidth.length, 18);
  }

  // 2. Sheet 숨기기
  for (var arrIndex = 0; arrIndex < arrSheetName.length; arrIndex++){
    var spreadsheet = activeSpreadSheet.getSheetByName(arrSheetName[arrIndex]);
    // 1월 숨기기
    var range = spreadsheet.getRange("P:AT");
    spreadsheet.hideColumn(range);
    // 2월 숨기기
    var range = spreadsheet.getRange("AU:BV");
    spreadsheet.hideColumn(range);
    // 3월 숨기기
    var range = spreadsheet.getRange("BW:DA");
    spreadsheet.hideColumn(range);
    // 4월 숨기기
    var range = spreadsheet.getRange("DB:EE");
    spreadsheet.hideColumn(range);
    // 5월 숨기기
    var range = spreadsheet.getRange("EF:FJ");
    spreadsheet.hideColumn(range);
  }
};


```