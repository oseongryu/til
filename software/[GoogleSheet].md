### 월별 스프레드시트 일괄 숨기기
```js
/** @OnlyCurrentDoc */

function myFunction() {
  // var spreadsheet = SpreadsheetApp.getActive();
  // spreadsheet.getRange('P163:NP163').activate();
  // spreadsheet.getRange('P163').copyTo(spreadsheet.getActiveRange(), SpreadsheetApp.CopyPasteType.PASTE_NORMAL, false);
  // Logger.log('실행');
  var activeSpreadSheet = SpreadsheetApp.getActiveSpreadsheet();
  var DAY_28 = 28, DAY_29 = 29, DAY_30 = 30, DAY_31 = 31;
  var arrMonthDay = [DAY_31, DAY_28, DAY_31, DAY_30, DAY_31, DAY_30, DAY_31, DAY_31, DAY_30, DAY_31, DAY_30, DAY_31]
  // 윤년 체크
  if (isLeapYear()) arrMonthDay[1] = DAY_29;
  var arrSheet = ['상품', '전시', '캠페인', '주문', '회원','물류/정산', '외부연동']

  // 1. 컬럼 사이즈 조정
  var arrColumnWidth = [10, 40, 40, 40, 55, 80, 60, 400, 40, 40, 40, 60, 60, 60, 60, 60]
  for (var sheetIndex = 0; sheetIndex < arrSheet.length; sheetIndex++){
    var spreadsheet = activeSpreadSheet.getSheetByName(arrSheet[sheetIndex]);
    for(var columnIndex = 0; columnIndex < arrColumnWidth.length; columnIndex++) {
      spreadsheet.setColumnWidth(columnIndex + 1, arrColumnWidth[columnIndex]);
    }
    spreadsheet.setColumnWidths(arrColumnWidth.length + 1, 380 - arrColumnWidth.length, 18);
  }

  // 2. 월별 날짜 숨기기 (숨기기 진행할 월을 추가)
  var arrHideMonth = [1]

  for (var sheetIndex = 0; sheetIndex < arrSheet.length; sheetIndex++){
    var spreadsheet = activeSpreadSheet.getSheetByName(arrSheet[sheetIndex]);

    for(var monthIndex = 0; monthIndex < 12; monthIndex++) {
      spreadsheet.showColumns(calcIndex(monthIndex), arrMonthDay[monthIndex]);
      if(arrHideMonth[monthIndex] != null) spreadsheet.hideColumns(calcIndex(monthIndex), arrMonthDay[monthIndex]);
    }
  }
};

function calcIndex(param){
  var startIndex = 17;
  var DAY_28 = 28, DAY_29 = 29, DAY_30 = 30, DAY_31 = 31;
  var arrMonthDay = [DAY_31, DAY_28, DAY_31, DAY_30, DAY_31, DAY_30, DAY_31, DAY_31, DAY_30, DAY_31, DAY_30, DAY_31]
  // 윤년 체크
  if (isLeapYear()) arrMonthDay[1] = DAY_29;
  return param == 0 ? startIndex : arrMonthDay.slice(0, param).reduce((a,b) => (a+b)) + startIndex;
}

function isLeapYear() {
    var year = 2024;
    // var year = new Date().getFullYear();
    return (year % 4 === 0 && year % 100 !== 0) || (year % 400 === 0);
}
```