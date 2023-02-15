#### ORACLE 18C XE 접속방법 
```
(나의 경우 회사 네트워크에서 127.0.0.1이 아니라 정확한 ip를 입력해서 됨)
https://www.youtube.com/watch?v=jMzhxbiFXtM
 
sqlplus / as sysdba
SELECT name, open_mode, cdb FROM v$database;
show pdbs;
exit

lsnrctl status (오라클의 ServiceName확인하기)

services.msc oracle이 켜져있는지 확인하기

C:\app\f5074\product\18.0.0\dbhomeXE\network\admin\tnsnames.ora  SERVICE_NAME확인하기 
```


#### 오라클 sql파일 임포트 방법
```
https://enspring.tistory.com/517
https://blog.naver.com/PostView.nhn?blogId=kimdj217&logNo=221405032563&parentCategoryNo=&categoryNo=34&viewDate=&isShowPopularPosts=false&from=postView
cmd 에서 sqlplus system
@C:\Users\f5074\Documents\ex.sql
```

#### 1분단위로 날짜 생성
```
SELECT TO_CHAR(TO_DATE(START_DTTM, 'YYYYMMDDHH24MI') + (((LEVEL / 60)) / 24), 'YYYYMMDDHH24MI') TIME_STR
FROM (
	SELECT '202012291300' AS START_DTTM
		, '202012301430' AS END_DTTM
	FROM DUAL
	) connect BY TO_DATE(START_DTTM, 'YYYYMMDDHH24MI') + (((LEVEL / 60)) / 24) <= TO_DATE(END_DTTM, 'YYYYMMDDHH24MI');
```

#### x일 단위로 날짜 생성
```
SELECT TO_CHAR(DUM_DAYS, 'YYYYMMDD') DUM_DAYS
FROM (
    SELECT TO_DATE('20200101', 'YYYYMMDD') - 1 + ROWNUM AS DUM_DAYS
    FROM ALL_OBJECTS
    WHERE TO_DATE('20200101', 'YYYYMMDD') - 1 + ROWNUM < TO_DATE('20200120', 'YYYYMMDD')
    )
 WHERE TO_CHAR(DUM_DAYS, 'D') = '7'
```

#### X일 단위 활용
```
WITH TB_DATE AS (
	SELECT TO_CHAR(DUM_DAYS, 'YYYYMMDD') DUM_DAYS
	FROM (
	    SELECT TO_DATE('20200101', 'YYYYMMDD') - 1 + ROWNUM AS DUM_DAYS
	    FROM ALL_OBJECTS
	    WHERE TO_DATE('20200101', 'YYYYMMDD') - 1 + ROWNUM <= TO_DATE('20200120', 'YYYYMMDD')
	    )
), TB_CODE AS(
		SELECT GENE_CD_DESC
		FROM T_CD_GENE_DATA
		WHERE 1 = 1
		  AND GENE_DV = 'STAT_EQP_SET'
)
SELECT TD.DUM_DAYS, TC.GENE_CD_DESC
  FROM TB_DATE TD, TB_CODE TC
ORDER BY DUM_DAYS  
```

#### 설비데이터
```
설비데이터를 차트로 만들때, 각 분단위로 데이터가 쌓이는 상황
상황에 따라 분단위 데이터가 중간에 빠질 때 빈값이 없도록 등록하는 방법
1. 클라이언트에서 없을 경우 이전데이터를 추가하는 형태로 구현
2. 쿼리를 사용해서 없는 데이터의 경우 만들어주는 방법
3. 설비에서 측정하는 항목별(ITEM_CD)로 날짜별로 데이터를 생성해야함
4. 데이터가 없는 빈값의 경우 이전 혹은 이후에 있는 데이터로 값을 덮어씌워야 함
```

#### DBLINK
```
JOIN 자체를 외부 DB에서 수행하려면, /*+ DRIVING_SITE(EXT_TABLE) */ 을 사용한다.

-> 보통 외부 DB의 TABLE이 큰 경우, 작은 내부 DB DATA 를 그쪽으로 보낸후 JOIN 이후의 결과를 받는 방식

LEADING 등의 힌트가 안 먹을때는? 그냥 테이블, 뷰 순서 바꾸고 ORDERED 힌트 적용하면 먹힘

-> Query Transformation 등으로 인해 Query Block 이 바뀔수 있어 명시적으로 이름을 지정하는 LEADING 힌트가 안먹을 때가

있는 것 같다. 10053 Trace 확인하면 정확한 BLOCK 명이 나오려나?
```

#### Dump파일 Import
```
1. 먼저 emt.dmp파일을 C:\DEV에 저장
2. cmd에서 순서대로 입력을 하면 됨

1) C:\Users\hkedu>sqlplus "/as sysdba"
2) SQL> create user emt identified by emt default tablespace users;
3) SQL> grant connect, resource to emt;
4) SQL> create directory save as 'c:/dev';
5) SQL> grant read, write on directory save to emt;
6) SQL> exit
7) C:\Users\hkedu>impdp emt/emt directory=save file=emt.dmp


오류가 생길 경우

1) C:\Users\hkedu>sqlplus "/as sysdba"
2) SQL> drop user emt cascade;
3) SQL> drop directory save;
4) SQL> create user emt identified by emt default tablespace users;
5) SQL> grant connect, resource to emt;
6) SQL> create directory save as 'c:/dev';
7) SQL> grant read, write on directory save to emt;
8) SQL> exit
9) C:\Users\hkedu>impdp emt/emt directory=save file=emt.dmp
```
#### ORDER BY
```
GROUP BY SITE, CUR_DT, EQP_DESC, EQP_NO, EQP_ID, STATUS, STATUS_D
ORDER BY SITE, CUR_DT, EQP_DESC ASC, EQP_NO, EQP_ID, STATUS, DECODE(STATUS_D, 'ChangePowder', 1, 'ChangeMold', 2, 'SampleProduction', 3)
```

#### 일,주,월,년 단위 값 구하기
```
날짜별로 데이터를 수집 후 일, 주, 월, 년 단위로 GROUP BY로 처리할 수 있음

SELECT TO_CHAR(TO_TIMESTAMP('20200209 13595500', 'YYYYMMDD HH24MISSFF3'), 'YYYY-MM-DD') AS YEAR_MONTH_DAYS
	, TO_CHAR(TO_TIMESTAMP('20200209 13595500', 'YYYYMMDD HH24MISSFF3'), 'YYYY-WW') || ' W' AS YEAR_WEEKS
	, TO_CHAR(TO_TIMESTAMP('20200209 13595500', 'YYYYMMDD HH24MISSFF3'), 'YYYY-MM') AS YEAR_MONTHS
	, TO_CHAR(TO_TIMESTAMP('20200209 13595500', 'YYYYMMDD HH24MISSFF3'), 'YYYY') AS YEARS
FROM DUAL



SELECT TO_CHAR(SYSDATE, 'YYYY-MM-DD')
	 , TO_CHAR(SYSDATE, 'YYYY-WW') || ' W'
	 , TO_CHAR(SYSDATE, 'YYYY-MM')
	 , TO_CHAR(SYSDATE, 'YYYY')
  FROM DUAL
```

#### ORA-01000최대 열기 커서 수를 초과했습니다.
```
> 위와같은 에러발생 시 사용하는 트랜잭션 테이블에 Lock가 걸릴 확률이 높음

SELECT SID
	, USER_NAME
	, COUNT(SID) CURSOR
FROM V$OPEN_CURSOR
WHERE 1 = 1
--  AND user_name = 'SCOTT'
GROUP BY SID
	, USER_NAME
ORDER BY CURSOR DESC
```

#### Procedures
```
##### 1. 테이블생성
CREATE TABLE TABLE3
(
 COLUMN1 VARCHAR2(100)
,COLUMN2 VARCHAR2(100)
)

##### 2. 프로시져 생성
CREATE OR REPLACE PROCEDURE EX_PROC
(
   PARA1 IN VARCHAR2
  ,PARA2 IN VARCHAR2
)
IS
	RETURN_MESSAGE VARCHAR2(100) := 'test';
	RETURN_MESSAGE2 VARCHAR2(100) := 'test'; 
BEGIN
	dbms_output.put_line(RETURN_MESSAGE);
	INSERT INTO TABLE3 (COLUMN1, COLUMN2) VALUES(PARA1, PARA2);
END EX_PROC;

##### 3. 실행 (EXEC가 안될 경우 하단의 방식)
EXEC EX_PROC('test','test');

BEGIN
 	EX_PROC('test','test');
END;

```

#### Oracle sequence
```sql
CREATE SEQUENCE TEST.SQ_ID INCREMENT BY 1 MINVALUE 1 MAXVALUE 999999999999999 CYCLE NOCACHE NOORDER;

-- 시퀀스 현재값 변경-1
DROP SEQUENCE SEQ_X;
CREATE  SEQUENCE SEQ_X START WITH 10001 INCREMENT BY 1 MAXVALUE  1E28 MINVALUE  1 NOCYCLE CACHE  20 NOORDER;

-- 시퀀스 현재값 변경-2
ALTER SEQUENCE SEQ_X INCREMENT BY 10000;
SELECT SEQ_X.NEXTVAL FROM DUAL;
ALTER SEQUENCE SEQ_X INCREMENT BY 1;


-- 7만 8만 건이 넘어 갈 경우 하단의 sequence 성능이 더 좋음
INSERT INTO TABLE1 (
	  SEQ
	, INST_DTM
)
VALUES (
	  (SELECT NVL(MAX(TO_NUMBER(SEQ)) + 1, 1) AS SEQ FROM TABLE1)
	, SYSDATE
)   


<selectKey resultType="java.lang.String" keyProperty="SEQ" order="BEFORE">
	SELECT SQ_ID.NEXTVAL AS SEQ FROM DUAL
</selectKey>
INSERT INTO TABLE1 (
	SEQ
	, INST_DTM

)
VALUES (
	#{SEQ}
	, SYSDATE
)

```

#### 날짜관련
```sql
SELECT 
	TO_DATE('20220901'||'235959', 'YYYYMMDDHH24MISS')
	, TO_DATE('20220901', 'YYYYMMDD') - 0.99999
	, TO_DATE('20220901', 'YYYYMMDD') - 0.00001
	, TO_DATE('20220901', 'YYYYMMDD') + 0.99999
	, TO_DATE('20220901', 'YYYYMMDD') + 0.00001
FROM DUAL

-- 컬럼이 DATE인 데이터를 확인할 때는 235959까지 확인하도록 진행해야함
(x) AND REGISTER_DATE BETWEEN TO_DATE('20220901', 'YYYYMMDD') AND TO_DATE('20220901', 'YYYYMMDD')
(o) AND REGISTER_DATE BETWEEN TO_DATE('20220901'||'000000', 'YYYYMMDDHH24MISS') AND TO_DATE('20220901'||'235959', 'YYYYMMDDHH24MISS')
```

#### 권한관련
```sql
SELECT * 
FROM DBA_TAB_PRIVS
WHERE 1 = 1
 AND GRANTEE = 'TEST'
```

#### ROWNUM 역순
```sql
SELECT  NUM
  FROM (
	SELECT ROW_NUMBER() OVER (ORDER BY PK_KEY DESC) AS NUM
	FROM TEMP
)
WHERE 1 = 1
 AND NUM <= 1
```

#### oracle function

PLS-00306: 'TEST_OBJ' 호출 시 인수의 갯수나 유형이 잘못되었습니다
function에서 object의 값을 추가할때 types에 선언된 object의 값을 같이 추가해줘야함
```sql
CREATE OR REPLACE TYPE TEST_OBJ AS OBJECT
(
    TEST_A VARCHAR2(15),
    TEST_B VARCHAR2(7)
);

```

#### oracle package
```sql
CREATE OR REPLACE PACKAGE TEST.PACKAGE_TEST
AS
	-- 패키지에 들어올 프로시저, 함수 정의
	PROCEDURE PROC_TEST;

	PROCEDURE PROC_TEST2(NAME IN VARCHAR2, AGE IN NUMBER);

	FUNCTION examFunc(getGender IN VARCHAR2) RETURN VARCHAR2;

END PACKAGE_TEST;







-- 패키지 바디 부분
CREATE OR REPLACE PACKAGE BODY TEST.PACKAGE_TEST
AS
	 -- 패키지 내 프로시저, 함수 내용 정의
     PROCEDURE PROC_TEST
	 IS
	 BEGIN
	 	 INSERT INTO TABLE_TEST(COL1,COL2) VALUES('TEST', 1);
     END PROC_TEST;
    
     PROCEDURE PROC_TEST2(NAME IN VARCHAR2, AGE IN NUMBER)
	 IS
	 BEGIN
	 	 INSERT INTO TABLE_TEST(COL1,COL2) VALUES(NAME, AGE);
     END PROC_TEST2;  
    
	 FUNCTION examFunc -- 함수명
	 (getGender IN VARCHAR2) -- 함수 호출시 받아올 파라미터 정의
	 RETURN VARCHAR2 -- 함수 수행 시 반환할 데이터 타입
	 IS -- 사용할 변수 정의
	 	setGender VARCHAR2(100);
	 BEGIN -- 변수를 가지고 함수 수행
	     IF getGender = '남' THEN setGender := '남자';
	     ELSIF getGender = '여' THEN setGender := '여자';
	     ELSE setGender := '오류'; 
	     END IF;
	 RETURN setGender; -- 반환
	 END examFunc;    
    
END PACKAGE_TEST;
```




#### 테이블 컬럼찾기

/*테이블 내 컬럼 찾기*/
SELECT * FROM USER_TAB_COLUMNS WHERE COLUMN_NAME LIKE '%ATT_FL_GRP_ID%';

## Reference
https://m.cafe.daum.net/oraclesqltuning/8ACn/28
https://lawmin.tistory.com/58

ORA-01000최대 열기 커서 수를 초과했습니다.
https://serendipity.tistory.com/65

oracle package: https://wakestand.tistory.com/173
