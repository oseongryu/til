### 월별 스프레드시트 일괄 숨기기

```js
/** @OnlyCurrentDoc */
var DAY_28 = 28, DAY_29 = 29, DAY_30 = 30, DAY_31 = 31;
var arrMonthDay = [DAY_31, DAY_28, DAY_31, DAY_30, DAY_31, DAY_30, DAY_31, DAY_31, DAY_30, DAY_31, DAY_30, DAY_31];
var arrSheet = ['상품', '전시', '캠페인', '주문', '회원','물류/정산', '외부연동'];

function onOpen() {
  createMenuWithSubMenu();
}

function createMenuWithSubMenu() {
  var subMenu1 = SpreadsheetApp.getUi().createMenu("숨기기")
    .addItem("4월숨기기", "hideMonth")
  var subMenu2 = SpreadsheetApp.getUi().createMenu("보이기")
    .addItem("4월보이기", "showMonth")
  
  SpreadsheetApp.getUi().createMenu("⚙️월 관리")
    .addItem("4월 숨기기", "hideMonth")
    .addItem("4월 보이기", "showMonth")
    // .addSubMenu(subMenu1)
    // .addSeparator()
    // .addSubMenu(subMenu2)
    .addToUi();
}

function removeMenu() {
    SpreadsheetApp.getActiveSpreadsheet().removeMenu("⚙️월 관리");
}

// 월 숨기기
function hideMonth(month=3) {
  var activeSpreadSheet = SpreadsheetApp.getActiveSpreadsheet();
  // 윤년 체크
  if (isLeapYear()) arrMonthDay[1] = DAY_29;  
  for (var sheetIndex = 0; sheetIndex < arrSheet.length; sheetIndex++){
    monthIndex = month;
    var spreadsheet = activeSpreadSheet.getSheetByName(arrSheet[sheetIndex]);
    spreadsheet.hideColumns(calcIndex(monthIndex), arrMonthDay[monthIndex]);
  }
};

// 월 보이기
function showMonth(month=3) {
  var activeSpreadSheet = SpreadsheetApp.getActiveSpreadsheet();
  // 윤년 체크
  if (isLeapYear()) arrMonthDay[1] = DAY_29;
  for (var sheetIndex = 0; sheetIndex < arrSheet.length; sheetIndex++){
    monthIndex = month;
    var spreadsheet = activeSpreadSheet.getSheetByName(arrSheet[sheetIndex]);
    spreadsheet.showColumns(calcIndex(monthIndex), arrMonthDay[monthIndex]);
  }
};

function myFunction(month) {
  var activeSpreadSheet = SpreadsheetApp.getActiveSpreadsheet();
  // 윤년 체크
  if (isLeapYear()) arrMonthDay[1] = DAY_29;
  
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
  var arrHideMonth = [1,2,3,4];
  var hideHalf = true;

  for (var sheetIndex = 0; sheetIndex < arrSheet.length; sheetIndex++){
    var spreadsheet = activeSpreadSheet.getSheetByName(arrSheet[sheetIndex]);
    // 2.1. 매월 숨김처리
    for(var monthIndex = 0; monthIndex < 12; monthIndex++) {

      spreadsheet.showColumns(calcIndex(monthIndex), arrMonthDay[monthIndex]);
      if(arrHideMonth[monthIndex] != null) spreadsheet.hideColumns(calcIndex(monthIndex), arrMonthDay[monthIndex]);
    }
    // 2.2. 월 절반만 보이기
    if(hideHalf) spreadsheet.showColumns(calcIndex(arrHideMonth.length -1) + 15, arrMonthDay[arrHideMonth.length -1] - 15);
  }
};

// 월계산
function calcIndex(param){
  var startIndex = 17;
  return param == 0 ? startIndex : arrMonthDay.slice(0, param).reduce((a,b) => (a+b)) + startIndex;
}

// 윤년체크
function isLeapYear(year=2024) {
    // var year = new Date().getFullYear();
    return (year % 4 === 0 && year % 100 !== 0) || (year % 400 === 0);
}

// guide
function guide() {
  // var spreadsheet = SpreadsheetApp.getActive();
  // spreadsheet.getRange('P163:NP163').activate();
  // spreadsheet.getRange('P163').copyTo(spreadsheet.getActiveRange(), SpreadsheetApp.CopyPasteType.PASTE_NORMAL, false);
  // Logger.log('실행');

  SpreadsheetApp.getActive().toast("You selected Setting A.");
  SpreadsheetApp.getUi().alert("실행완료");
  const activeSpreadSheet = SpreadsheetApp.getActiveSpreadsheet();
  var spreadsheet = activeSpreadSheet.getSheetByName('상품');
  // spreadsheet.insertColumns(1);
  Logger.log(spreadsheet.getMaxColumns());

  // var range = spreadsheet.getRange("P:AT");
  // spreadsheet.hideColumn(range);
}

```

### google sheet query

```
=QUERY({'상품'!B4:P64;'전시'!B4:P65;'캠페인'!B4:P55;'주문'!B4:P142;'회원'!B4:P94;'외부연동'!B4:P79';물류/정산'!B4:P63}, "SELECT '4월', Col2, Col5, Col4, Col7, Col10, Col1, Col3, Col12, Col13, Col14, Col15 WHERE (Col6 = '개발' and (Col14 >= DATE'2024-02-01' OR Col14 is null)) ORDER BY Col10 desc, Col14,Col1, Col7",0)
```