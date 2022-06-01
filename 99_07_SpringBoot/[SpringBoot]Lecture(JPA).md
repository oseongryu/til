## 강좌 소개
### 강좌 소개
### 수업 자료
### 강의 소스 코드
### 2편 추가 자료

## API 개발 기본
### 회원 등록 API
```java
// 개발 시 Request, Response에 해당하는 class는 따로 생성
@PostMapping("/api/v1/members")
public CreateMemberResponse saveMemberV1(@RequestBody @Valid Member member) {
    Long id = memberService.join(member);
    return new CreateMemberResponse(id);
}

@PostMapping("/api/v2/members")
public CreateMemberResponse saveMemberV2(@RequestBody @Valid CreateMemberRequest request) {

    Member member = new Member();
    member.setName(request.getName());

    Long id = memberService.join(member);
    return new CreateMemberResponse(id);
}
```
### 회원 수정 API
```java
// ENtity수정은 변경감지를 활용
// Update는 반환값이 없는게 좋음(커맨드와 쿼리를 분리)
@PutMapping("/api/v2/members/{id}")
public UpdateMemberResponse updateMemberV2(@PathVariable("id") Long id, @RequestBody @Valid UpdateMemberRequest request) {
    memberService.update(id, request.getName());
    Member findMember = memberService.findOne(id);
    return new UpdateMemberResponse(findMember.getId(), findMember.getName());
}
```
### 회원 조회 API

## API 개발 고급 - 준비
### API 개발 고급 소개
### 조회용 샘플 데이터 입력


## API 개발 고급 - 지연 로딩과 조회 성능 최적화
### 간단한 주문 조회 V1: 엔티티를 직접 노출
### 간단한 주문 조회 V2: 엔티티를 DTO로 변환
### 간단한 주문 조회 V3: 엔티티를 DTO로 변환 - 페치 조인 최적화
### 간단한 주문 조회 V4: JPA에서 DTO로 바로 조회


## API 개발 고급 - 컬렉션 조회 최적화
### 주문 조회 V1: 엔티티 직접 노출
### 주문 조회 V2: 엔티티를 DTO로 변환
### 주문 조회 V3: 엔티티를 DTO로 변환 - 페치 조인 최적화
### 주문 조회 V3.1: 엔티티를 DTO로 변환 - 페이징과 한계 돌파
### 주문 조회 V4: JPA에서 DTO 직접 조회
### 주문 조회 V5: JPA에서 DTO 직접 조회 - 컬렉션 조회 최적화
### 주문 조회 V6: JPA에서 DTO로 직접 조회, 플랫 데이터 최적화
### API 개발 고급 정리


### API 개발 고급 - 실무 필수 최적화
### OSIV와 성능 최적화
### 다음으로
### 스프링 데이터 JPA 소개
### QueryDSL 소개