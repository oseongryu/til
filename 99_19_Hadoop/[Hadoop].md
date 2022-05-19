##
docker -it --name hadoop-base centos

## HUE 사용

```
1. Query Editor : Sql 실행가능
2. Table Browser : Table 내역 조회
3. Workflows : Batch 구성요소 관리
    - Workflows > 대시보드 : Batch 등록 내역 조회
    - Workflows > 편집기 : Batch 등록 내역 편집
    - Workflows > 편집기 > Workflow : Batch 구성 요소 관리, 배치 재실행 
    - Workflows > 편집기 > Coordinator : Batch 수행 주기/시간 관리
4. 파일브라우저 : Batch 에서 실행될 sql 확인 및 편집
5. Job Browser : Batch 실행 log 확인
```

## References

https://taaewoo.tistory.com/22?category=862614
https://mungiyo.tistory.com/16
https://blog.acronym.co.kr/329?category=398102