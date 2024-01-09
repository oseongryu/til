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
  // var arrColumnWidth = [23, 42, 77, 77, 77, 465, 65, 65, 65, 60, 60, 60, 60, 60, 128]
  var arrColumnWidth = [23, 42, 77, 77, 77, 400, 60, 60, 60, 60, 60, 60, 60, 60, 60]

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

```js
/** @OnlyCurrentDoc */

function myFunction() {
  // var spreadsheet = SpreadsheetApp.getActive();
  // spreadsheet.getRange('P163:NP163').activate();
  // spreadsheet.getRange('P163').copyTo(spreadsheet.getActiveRange(), SpreadsheetApp.CopyPasteType.PASTE_NORMAL, false);

  var activeSpreadSheet = SpreadsheetApp.getActiveSpreadsheet();
  var DAY_28 = 28, DAY_30 = 30, DAY_31 = 31;
  var monthDayArr = [DAY_31, DAY_28, DAY_31, DAY_30, DAY_31, DAY_30, DAY_31, DAY_31, DAY_30, DAY_31, DAY_30, DAY_31]
  var monthIndex = 0;
  var sheetArr = ['상품', '전시', '캠페인', '주문', '회원','물류/정산', '외부연동']

  for (var arrIndex = 0; arrIndex < sheetArr.length; arrIndex++){
    var spreadsheet = activeSpreadSheet.getSheetByName(sheetArr[arrIndex]);
    // 1월 숨기기/보이기
    monthIndex = 16;
    spreadsheet.hideColumns(monthIndex, monthDayArr[0]);
    // spreadsheet.showColumns(monthIndex, monthDayArr[0]);

    // 2월 숨기기/보이기
    monthIndex = monthDayArr.slice(0,1).reduce((a,b) => (a+b)) + 16;
    spreadsheet.hideColumns(monthIndex, monthDayArr[1]);
    // spreadsheet.showColumns(monthIndex, monthDayArr[1]);

    // 3월 숨기기/보이기
    monthIndex = monthDayArr.slice(0,2).reduce((a,b) => (a+b)) + 16;
    spreadsheet.hideColumns(monthIndex, monthDayArr[2]);
    // spreadsheet.showColumns(monthIndex, monthDayArr[2]);

    // 4월 숨기기/보이기
    monthIndex = monthDayArr.slice(0,3).reduce((a,b) => (a+b)) + 16;
    spreadsheet.hideColumns(monthIndex, monthDayArr[3]);
    // spreadsheet.showColumns(monthIndex, monthDayArr[3]);

    // 5월 숨기기/보이기
    monthIndex = monthDayArr.slice(0,4).reduce((a,b) => (a+b)) + 16;
    spreadsheet.hideColumns(monthIndex, monthDayArr[4]);
    // spreadsheet.showColumns(monthIndex, monthDayArr[4]);

    // 6월 숨기기/보이기
    monthIndex = monthDayArr.slice(0,5).reduce((a,b) => (a+b)) + 16;
    spreadsheet.hideColumns(monthIndex, monthDayArr[5]);
    // spreadsheet.showColumns(monthIndex, monthDayArr[5]);

    // 7월 숨기기/보이기
    monthIndex = monthDayArr.slice(0,6).reduce((a,b) => (a+b)) + 16;
    spreadsheet.hideColumns(monthIndex, monthDayArr[6]);
    // spreadsheet.showColumns(monthIndex, monthDayArr[6]);

    // 8월 숨기기/보이기
    monthIndex = monthDayArr.slice(0,7).reduce((a,b) => (a+b)) + 16;
    spreadsheet.hideColumns(monthIndex, monthDayArr[7]);
    spreadsheet.showColumns(monthIndex, monthDayArr[7]);

    // 9월 숨기기/보이기
    monthIndex = monthDayArr.slice(0,8).reduce((a,b) => (a+b)) + 16;
    spreadsheet.hideColumns(monthIndex, monthDayArr[8]);
    spreadsheet.showColumns(monthIndex, monthDayArr[8]);

    // 10월 숨기기/보이기
    monthIndex = monthDayArr.slice(0,9).reduce((a,b) => (a+b)) + 16;
    spreadsheet.hideColumns(monthIndex, monthDayArr[9]);
    spreadsheet.showColumns(monthIndex, monthDayArr[9]);

    // 11월 숨기기/보이기
    monthIndex = monthDayArr.slice(0,10).reduce((a,b) => (a+b)) + 16;
    spreadsheet.hideColumns(monthIndex, monthDayArr[10]);
    spreadsheet.showColumns(monthIndex, monthDayArr[10]);

    // 12월 숨기기/보이기
    monthIndex = monthDayArr.slice(0,11).reduce((a,b) => (a+b)) + 16;
    spreadsheet.hideColumns(monthIndex, monthDayArr[11]);
    spreadsheet.showColumns(monthIndex, monthDayArr[11]);
  }

  // for (var arrIndex = 0; arrIndex < sheetArr.length; arrIndex++){
  //   var spreadsheet = activeSpreadSheet.getSheetByName(sheetArr[arrIndex]);
  //   var monthIndex = 16;
  //   var DAY_28 = 28, DAY_30 = 30, DAY_31 = 31;
  //   var monthDayArr = [DAY_31, DAY_28, DAY_31, DAY_30, DAY_31, DAY_30, DAY_31, DAY_31, DAY_30, DAY_31, DAY_30, DAY_31]
    

  //   // // 1월 보이기
  //   // spreadsheet.showColumns(monthIndex, DAY_31);
  //   // monthIndex += DAY_31
  //   // // 2월 보이기
  //   // spreadsheet.showColumns(monthIndex, DAY_28);
  //   // monthIndex += DAY_28
  //   // // 3월 보이기
  //   // spreadsheet.showColumns(monthIndex, DAY_31);
  //   // monthIndex += DAY_31
  //   // // 4월 보이기
  //   // spreadsheet.showColumns(monthIndex, DAY_30);
  //   // monthIndex += DAY_30
  //   // // 5월 보이기
  //   // spreadsheet.showColumns(monthIndex, DAY_31);
  //   // monthIndex += DAY_31
  //   // // 6월 보이기
  //   // spreadsheet.showColumns(monthIndex, DAY_30);
  //   // monthIndex += DAY_30
  //   // // 7월 보이기
  //   // spreadsheet.showColumns(monthIndex, DAY_31);
  //   // monthIndex += DAY_31
  //   // // 8월 보이기
  //   // spreadsheet.showColumns(monthIndex, DAY_31);
  //   // monthIndex += DAY_31
  // }
};
```

### function 사용
```js
/** @OnlyCurrentDoc */

function myFunction() {
  // var spreadsheet = SpreadsheetApp.getActive();
  // spreadsheet.getRange('P163:NP163').activate();
  // spreadsheet.getRange('P163').copyTo(spreadsheet.getActiveRange(), SpreadsheetApp.CopyPasteType.PASTE_NORMAL, false);

  var activeSpreadSheet = SpreadsheetApp.getActiveSpreadsheet();
  var DAY_28 = 28, DAY_30 = 30, DAY_31 = 31;
  var monthDayArr = [DAY_31, DAY_28, DAY_31, DAY_30, DAY_31, DAY_30, DAY_31, DAY_31, DAY_30, DAY_31, DAY_30, DAY_31]
  var sheetArr = ['상품', '전시', '캠페인', '주문', '회원','물류/정산', '외부연동']


  for (var arrIndex = 0; arrIndex < sheetArr.length; arrIndex++){
    // Logger.log(spreadsheet.getMaxColumns());
    var spreadsheet = activeSpreadSheet.getSheetByName(sheetArr[arrIndex]);
    // 1월 숨기기/보이기
    monthIndex = 16;
    spreadsheet.hideColumns(calcIndex(0), monthDayArr[0]);
    // spreadsheet.showColumns(calcIndex(0), monthDayArr[0]);

    // 2월 숨기기/보이기
    spreadsheet.hideColumns(calcIndex(1), monthDayArr[1]);
    // spreadsheet.showColumns(calcIndex(1), monthDayArr[1]);

    // 3월 숨기기/보이기
    spreadsheet.hideColumns(calcIndex(2), monthDayArr[2]);
    // spreadsheet.showColumns(calcIndex(2), monthDayArr[2]);

    // 4월 숨기기/보이기
    spreadsheet.hideColumns(calcIndex(3), monthDayArr[3]);
    // spreadsheet.showColumns(calcIndex(3), monthDayArr[3]);

    // 5월 숨기기/보이기
    spreadsheet.hideColumns(calcIndex(4), monthDayArr[4]);
    // spreadsheet.showColumns(calcIndex(4), monthDayArr[4]);

    // 6월 숨기기/보이기
    spreadsheet.hideColumns(calcIndex(5), monthDayArr[5]);
    // spreadsheet.showColumns(calcIndex(5), monthDayArr[5]);

    // 7월 숨기기/보이기
    spreadsheet.hideColumns(calcIndex(6), monthDayArr[6]);
    // spreadsheet.showColumns(calcIndex(6), monthDayArr[6]);

    // 8월 숨기기/보이기
    spreadsheet.hideColumns(calcIndex(7), monthDayArr[7]);
    spreadsheet.showColumns(calcIndex(7), monthDayArr[7]);

    // 9월 숨기기/보이기
    spreadsheet.hideColumns(calcIndex(8), monthDayArr[8]);
    spreadsheet.showColumns(calcIndex(8), monthDayArr[8]);

    // 10월 숨기기/보이기
    spreadsheet.hideColumns(calcIndex(9), monthDayArr[9]);
    spreadsheet.showColumns(calcIndex(9), monthDayArr[9]);

    // 11월 숨기기/보이기
    spreadsheet.hideColumns(calcIndex(10), monthDayArr[10]);
    spreadsheet.showColumns(calcIndex(10), monthDayArr[10]);

    // 12월 숨기기/보이기
    spreadsheet.hideColumns(calcIndex(11), monthDayArr[11]);
    spreadsheet.showColumns(calcIndex(11), monthDayArr[11]);
  }
};

function calcIndex(param){
  var startIndex = 16;
  var DAY_28 = 28, DAY_30 = 30, DAY_31 = 31;
  var monthDayArr = [DAY_31, DAY_28, DAY_31, DAY_30, DAY_31, DAY_30, DAY_31, DAY_31, DAY_30, DAY_31, DAY_30, DAY_31]
  return param ==0 ? startIndex : monthDayArr.slice(0, param).reduce((a,b) => (a+b)) + startIndex;
}
```

```js
/** @OnlyCurrentDoc */

function myFunction() {
  // var spreadsheet = SpreadsheetApp.getActive();
  // spreadsheet.getRange('P163:NP163').activate();
  // spreadsheet.getRange('P163').copyTo(spreadsheet.getActiveRange(), SpreadsheetApp.CopyPasteType.PASTE_NORMAL, false);

  var activeSpreadSheet = SpreadsheetApp.getActiveSpreadsheet();
  var DAY_28 = 28, DAY_29 = 29, DAY_30 = 30, DAY_31 = 31;
  var monthDayArr = [DAY_31, DAY_28, DAY_31, DAY_30, DAY_31, DAY_30, DAY_31, DAY_31, DAY_30, DAY_31, DAY_30, DAY_31]
  // 윤년 체크
  if (isLeapYear()) monthDayArr[1] = DAY_29;

  var sheetArr = ['상품', '전시', '캠페인', '주문', '회원','물류/정산', '외부연동']

  // 1. 컬럼 사이즈 조정
  var arrColumnWidth = [20, 40, 60, 70, 70, 400, 60, 60, 60, 60, 60, 60, 60, 60, 60]
  for (var arrIndex = 0; arrIndex < sheetArr.length; arrIndex++){
    var spreadsheet = activeSpreadSheet.getSheetByName(sheetArr[arrIndex]);
    // Logger.log(spreadsheet.getMaxColumns());

    for(var columnIndex = 0; columnIndex < arrColumnWidth.length; columnIndex++) {
      spreadsheet.setColumnWidth(columnIndex + 1, arrColumnWidth[columnIndex]);
    }
    spreadsheet.setColumnWidths(arrColumnWidth.length + 1, 380 - arrColumnWidth.length, 18);
  }

  // 2. 월별 날짜 숨기기
  for (var arrIndex = 0; arrIndex < sheetArr.length; arrIndex++){
    // Logger.log(spreadsheet.getMaxColumns());
    var spreadsheet = activeSpreadSheet.getSheetByName(sheetArr[arrIndex]);
    // 1월 숨기기/보이기
    spreadsheet.hideColumns(calcIndex(0), monthDayArr[0]);
    spreadsheet.showColumns(calcIndex(0), monthDayArr[0]);

    // 2월 숨기기/보이기
    spreadsheet.hideColumns(calcIndex(1), monthDayArr[1]);
    spreadsheet.showColumns(calcIndex(1), monthDayArr[1]);

    // 3월 숨기기/보이기
    spreadsheet.hideColumns(calcIndex(2), monthDayArr[2]);
    spreadsheet.showColumns(calcIndex(2), monthDayArr[2]);

    // 4월 숨기기/보이기
    spreadsheet.hideColumns(calcIndex(3), monthDayArr[3]);
    spreadsheet.showColumns(calcIndex(3), monthDayArr[3]);

    // 5월 숨기기/보이기
    spreadsheet.hideColumns(calcIndex(4), monthDayArr[4]);
    spreadsheet.showColumns(calcIndex(4), monthDayArr[4]);

    // 6월 숨기기/보이기
    spreadsheet.hideColumns(calcIndex(5), monthDayArr[5]);
    spreadsheet.showColumns(calcIndex(5), monthDayArr[5]);

    // 7월 숨기기/보이기
    spreadsheet.hideColumns(calcIndex(6), monthDayArr[6]);
    spreadsheet.showColumns(calcIndex(6), monthDayArr[6]);

    // 8월 숨기기/보이기
    spreadsheet.hideColumns(calcIndex(7), monthDayArr[7]);
    spreadsheet.showColumns(calcIndex(7), monthDayArr[7]);

    // 9월 숨기기/보이기
    spreadsheet.hideColumns(calcIndex(8), monthDayArr[8]);
    spreadsheet.showColumns(calcIndex(8), monthDayArr[8]);

    // 10월 숨기기/보이기
    spreadsheet.hideColumns(calcIndex(9), monthDayArr[9]);
    spreadsheet.showColumns(calcIndex(9), monthDayArr[9]);

    // 11월 숨기기/보이기
    spreadsheet.hideColumns(calcIndex(10), monthDayArr[10]);
    spreadsheet.showColumns(calcIndex(10), monthDayArr[10]);

    // 12월 숨기기/보이기
    spreadsheet.hideColumns(calcIndex(11), monthDayArr[11]);
    spreadsheet.showColumns(calcIndex(11), monthDayArr[11]);
  }
};

function calcIndex(param){
  var startIndex = 16;
  var DAY_28 = 28, DAY_29 = 29, DAY_30 = 30, DAY_31 = 31;
  var monthDayArr = [DAY_31, DAY_28, DAY_31, DAY_30, DAY_31, DAY_30, DAY_31, DAY_31, DAY_30, DAY_31, DAY_30, DAY_31]
  // 윤년 체크
  if (isLeapYear()) monthDayArr[1] = DAY_29;
  
  return param == 0 ? startIndex : monthDayArr.slice(0, param).reduce((a,b) => (a+b)) + startIndex;
}

function isLeapYear() {
    var year = 2024;
    // var year = new Date().getFullYear();
    return (year % 4 === 0 && year % 100 !== 0) || (year % 400 === 0);
}
```