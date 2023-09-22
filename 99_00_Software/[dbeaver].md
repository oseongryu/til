#### 자동완성 해제
```
- Window > Preferences > Editors > SQL Editor > Code Completion
Insert table aliases (N/A)

```

#### Auto Commit 해제

```
- Window > Preferences > Database > connection Types
Auto-commit by default (체크해제)
```

#### SChemas filter

```
- Schemas 우클릭 > Filter > Configure "Schemas" filter
```


#### Encoding

```
Window > Preferences > General > Workspace
Text file encoding > UTF-8
```

#### ORA-01861: literal does not match format string

```sql
-- sqldeveloper와 달리 Dbeaver
SELECT * FROM NLS_SESSION_PARAMETERS WHERE PARAMETER = 'NLS_DATE_FORMAT';
SELECT * FROM NLS_INSTANCE_PARAMETERS WHERE PARAMETER = 'NLS_DATE_FORMAT';
SELECT * FROM NLS_DATABASE_PARAMETERS WHERE PARAMETER = 'NLS_DATE_FORMAT';

ALTER SESSION SET NLS_DATE_FORMAT = 'YYYY-MM-DD';
ALTER SESSION SET NLS_DATE_FORMAT = 'YYYY-MM-DD HH24:MI:SS';

```
