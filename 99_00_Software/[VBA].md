### setting

<img width="600" src="../static/img/vba/001.png"/>
<img width="600" src="../static/img/vba/002.png"/>
<img width="600" src="../static/img/vba/003.png"/>
<img width="600" src="../static/img/vba/004.png"/>


### 열숨기기 및 사이즈 변경
```
Sub HideAndShowFunction()
    Dim resultMsgBox As VbMsgBoxResult
    resultMsgBox = MsgBox("열을 숨길지 여부 선택", vbOKCancel)

    If resultMsgBox = vbOK Then
        Columns("A:KS").Hidden = True

        arrx = Array("C", "F", "K", "Q", "R", "Y", "Z", "AA", "AZ", "AK", "CG", "CH", "CI", "CO", "CS", "KR", "KS")
        arry = Array("50", "50", "40", "70", "80", "80", "80", "70", "50", "50", "50", "70", "90", "90", "100", "50", "50")
        Dim index As Long

        For index = LBound(arrx) To UBound(arrx)
            Columns(arrx(index)).Hidden = False
            Columns(arrx(index)).ColumnWidth = arry(index) / 5
        Next index

    Else
        Columns("A:KS").Hidden = False
    End If

    ActiveSheet.Cells(1, 1).Select
End Sub
```

### pptx add slides, input title and content

```vb
Sub AddSlides()

Dim oPres As Presentation
Dim oSlide As Slide
Dim sTitle As String
Dim sContent As String

Set oPres = ActivePresentation

' 3. 주요 기능 및 화면 구성

' 슬라이드 추가
Set oSlide = oPres.Slides.Add(oPres.Slides.Count + 1, ppLayoutCustom)

' 제목 설정
sTitle = "3. 주요 기능 및 화면 구성"
oSlide.Shapes.Title.TextFrame.TextRange.Text = sTitle

' 내용 추가
sContent = "- 홈 화면" & vbCrLf & _
"- 검색 및 필터링 기능" & vbCrLf & _
"- 식당 상세 정보 및 메뉴 선택" & vbCrLf & _
"- 주문 및 결제" & vbCrLf & _
"- 주문 현황 및 배달 추적" & vbCrLf & _
"- 사용자 프로필 및 설정"
oSlide.Shapes.AddTextbox(msoTextOrientationHorizontal, 100, 100, 500, 300).TextFrame.TextRange.Text = sContent

' 4. 상세 화면 설계

' 슬라이드 추가
Set oSlide = oPres.Slides.Add(oPres.Slides.Count + 1, ppLayoutCustom)

' 제목 설정
sTitle = "4. 상세 화면 설계"
oSlide.Shapes.Title.TextFrame.TextRange.Text = sTitle

' 내용 추가
sContent = "- 각 화면의 요소 및 기능 정의" & vbCrLf & _
"- 사용자 인터랙션 디자인" & vbCrLf & _
"- UI 디자인 및 시각적 요소 정의"
oSlide.Shapes.AddTextbox(msoTextOrientationHorizontal, 100, 100, 500, 300).TextFrame.TextRange.Text = sContent

End Sub
```

### excel 데이터변경

```vb
Sub Main()

Debug.Print "시작"

' 시작,종료 행
Dim startRow As Long
Dim lastRow As Long

startRow = 3
lastRow = Cells(Rows.Count, 1).End(xlUp).Row

ChangeDate startRow, lastRow, "B", 0
ChangeDate startRow, lastRow, "K", 7

Debug.Print "종료"

End Sub

Sub ChangeDate(startRow As Long, lastRow As Long, inputCell As String, dayVal As Long)
' colNum
Dim colNum As Long
colNum = Evaluate(inputCell & "1").Column
' low
Dim todayDate As Date
todayDate = DateAdd("d", dayVal, Date)

' x열 startRow부터 lastRow까지 반복
Dim i As Integer
For i = startRow To lastRow
    Cells(i, colNum).Value = Format(todayDate, "yyyy-mm-dd")
Next i


End Sub

```