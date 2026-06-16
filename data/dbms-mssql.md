## mssql-backup.md

# MSSQL Backup

## 백업 파일 복원

```sql
use master
go

-- 백업 파일 목록 확인
RESTORE FILELISTONLY
     FROM DISK='D:\DB_DATA\20180220_TEST.bak' -- 백업해둔 .BAK 파일

-- 새로운 이름으로 데이터베이스 복원
RESTORE DATABASE [TEST] --새롭게 복원할 DB명
     FROM DISK='D:\DB_DATA\20180220_TEST.bak' --백업해둔 .BAK 파일
     WITH RECOVERY,
     MOVE 'TEST' TO 'D:\DB_DATA\TEST2.mdf', --MOVE 'HVI_2011'은 첫번째 LOCALNAME (PMS_Data)
     MOVE 'TEST_log' TO 'D:\DB_DATA\\TEST2_log.ldf', REPLACE --MOVE 'HVI_2011_LOG'는 2번째 LOGICALNAME (PMS_Log)

GO
```

## logical_file_name 확인

```sql
--logical_file_name  확인
use TEST
go

SELECT file_id, name as [logical_file_name],physical_name
from sys.database_files
```

## logical_file_name 변경

```sql
--logical_file_name  변경
USE [master]
GO
ALTER DATABASE [TEST] MODIFY FILE (NAME = DYERP, NEWNAME = WOOJE);
GO
ALTER DATABASE [TEST] MODIFY FILE (NAME = DYERP_log, NEWNAME = WOOJE_log);
GO
```

## LocalDB

### 1. LocalDB설치

<https://www.microsoft.com/ko-kr/download/details.aspx?id=29062>

- `KOR\x64\SqlLocaLDB.MSI`
- `KOR\x64\SQLManagementStudio_x64_KOR.exe`

### 2. LocalDB 인스턴스 만들기

<http://orangetazo.tistory.com/11>

CMD에서

```
 생성 : SqlLocalDB create 'DB명'
 삭제 : SqlLocalDB stop 'DB명'  > SqlLocalDB delete 'DB명'
```

### 3. 기존DB에서 LocalDB로 mdf,ldf파일옮기기

mdf, ldf 파일 복사 <http://faq.hostway.co.kr/Windows_DB/7718>

```sql
sp_detach_db 'SKWD'
GO
sp_attach_db 'SKWD' , 'D:\DB_DATA\SKWD.mdf' , 'D:\DB_DATA\SKWD_log.ldf'
GO
```

### 4. Visual Studio에서 LocalDB 연결방법

<https://docs.microsoft.com/ko-kr/sql/database-engine/configure-windows/sql-server-2016-express-localdb>

```
"Server=(localdb)\MSSQLLocalDB;Integrated Security=true"

"Server=(LocalDB)\MSSQLLocalDB; Integrated Security=true ;AttachDbFileName=D:\Data\MyDB1.mdf"

private static string DB_CONN_ADDR = "Server=(LocalDB)\\v11.0; Integrated Security=true ;AttachDbFileName=C:\\Data\\SKWD.mdf;";
```

## mssql-copytablesyno.md

# MS-SQL 테이블 복사

## 1. 테이블을 생성하면서 테이블의 데이타 복사

```sql
select * into 생성될테이블명 from 원본테이블명
```

테이블 구조만 복사하겠다면

```sql
select * into 생성될테이블명 from 원본테이블명 where 1=2
```

## 2. 테이블이 이미 생성되어 있는경우 데이타만 복사

```sql
insert into 카피될테이블명 select * from 원본테이블명
```

특정 데이타만 복사 하겠다면

```sql
insert into 카피될테이블명 select * from 원본테이블명 where 검색조건
```

출처: <https://iberis.tistory.com/10> [Iberis]

## mssql.md

# MSSQL

## 문자열이나 이진 데이터는 잘립니다. 문이 종료되었습니다.

Insert시에 할당된 타입의 byte보다 많은 값이 들어올 경우

<http://chouingchou.tistory.com/63>

## 여러 로우의 데이터를 한개의 로우 데이터로 출력해보자 (세로 데이터 가로 한줄로 출력)

<http://ggmouse.tistory.com/127>

<http://ntalbs.github.io/2015/sql-transpose/>

## 테이블 복제

<http://blog.okno.co.kr/419>

## 행 추가

<http://database.sarang.net/?inc=read&criteria=mssql&subcrit=qna&aid=5910>

<http://database.sarang.net/?inc=read&aid=4406&criteria=mssql&subcrit=&id=&limit=20&keyword=select+update&page=1>

## 줄바꿈문자 출력

<http://idenrai.tistory.com/73>

## 확인 DB Link

```sql
SELECT * FROM master.dbo.sysservers
```

