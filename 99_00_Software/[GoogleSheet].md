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
