## 설정

1. Google Sheet Menu > File > New > SpreadSheet
2. change sheet name
3. input data into a sheet (column : `#type`)
4. Menu > Extensions > AppSheet > Create an app
5. Connect Google services

## AppSheet Display

```
Data : 구글 Sheet에서 정보를 불러옴, Sheet 선택후 Regenerate schema를 사용해서 업데이트
```

## 주의

1. Google Sheet에서 sheet을 변경할 경우 Data, Views를 업데이트 해줘야 함

## GCP

1. Add Project
2. APIs & Services > Enable APIs and services > Google Sheets API
3. Google Sheets API Enable
4. Create credentials

```
   Credential Type: User data
   App name: blog-deploy
   User support emai: ~~
   Developer contact informaiton: ~~
   Scopes: Google Sheets API

   OAuth Client ID
   Application type: Web application
   Name: blog-auth-client
```

5. Create > Download > Done
