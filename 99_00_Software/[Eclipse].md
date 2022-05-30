## Eclipse using external Editor

```

1. Windows > Preferences > General > Workspace
Refresh using native hooks or polling (checked)

2. Windows > Preferences > General > Editor > File Associations
File types click > Add Associated editors & Default

```

## Setting 

```
1. Maven > User Settings  
   C:\DEV\m2\settings.xml

2. Server > Runtime Environment > Add
   C:\DEV\tomcat

3. Java > Installed JREs

4. General > Content Types > Text
   Default encoding: UTF-8 > Update

5. General > Workspace
   Text file encoding: UTF-8

6. Validation

- Manual / Build disabled
  HTML Syntax Validator
  JAXB Validator
  JPA Validator
  JSF Application Configuration Validator
  JSF View Validator
  JSP Content Validator
  JSP Syntax Validator

- Build disabled
  XML Schema Validator
  XML Validator
  XSL Validator

6. Java > Compiler
   Compiler compliance level 1.7
   Use default compliance settings Check

7. Team > Git > Configuration > Add Entry
   user.email
   user.name
```

### eclipse init
```
\.metadata\.plugins\org.eclipse.core.runtime\.settings 하위 파일 전체 삭제
```