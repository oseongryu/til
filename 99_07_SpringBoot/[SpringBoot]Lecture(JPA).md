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
```java
// Entity를 @JSonIgnore를 하는 형태로도 가능하지만 절대하지 않기
// Entity의 값을 변경시 api의 Spec이 변경되면 안됨
// Spec 확장을 고려해서 data에 Array를 넣는 형태로 진행
@GetMapping("/api/v2/members")
public Result membersV2() {

    List<Member> findMembers = memberService.findMembers();
    //엔티티 -> DTO 변환
    List<MemberDto> collect = findMembers.stream()
            .map(m -> new MemberDto(m.getName()))
            .collect(Collectors.toList());
    return new Result(collect);
}

```

## API 개발 고급 - 준비
### API 개발 고급 소개

```
조회용 샘플 데이터 입력
지연 로딩과 조회 성능 최적화
컬렉션 조회 최적화
페이징과 한계 돌파
OSIV와 성능 최적화
```

### 조회용 샘플 데이터 입력

```
userA
-JPA1 BOOK
-JPA2 BOOK

userB
-SPRING1 BOOK
-SPRING2 BOOK


initService.dbInit1();
initService.dbInit2();

  jpa:
    hibernate:
      ddl-auto: create
```

## API 개발 고급 - 지연 로딩과 조회 성능 최적화
### 간단한 주문 조회 V1: 엔티티를 직접 노출
```
주문 + 배송정보 + 회원을 조회하는 API를 만들자
지연 로딩 때문에 발생하는 성능 문제를 단계적으로 해결해보자.

참고: 지금부터 설명하는 내용은 정말 중요합니다. 실무에서 JPA를 사용하려면 100% 이해해야 합니다.

ManyToOne, OneToOne 성능최적화


localhost:8080/api/v1/simple-orders

양방향 연관관계가 있을 경우 @JsonIgnore

fetch =LAZY 지연로딩 시.. 에러가 발생해서 Hibernate5Module
Configure를 수정해서 강제 Lazy로딩을 하게할 수도 있지만 하면안됨..
hibernate5Module.configure(Hibernate5Module.Feature.FORCE_LAZY_LOADING, true);

아래와 같이 강제 초기화할 수 있음
for (Order order : all) {
    order.getMember().getName(); //Lazy 강제 초기화
    order.getDelivery().getAddress(); //Lazy 강제 초기화
}

지연 로딩(LAZY)를 피하기 위해 즉시 로딩(EARER)으로 설정하면 안됨. 즉시로딩은 연관관계가 필요없을때도 데이터를 항상조회해서 성능문제를 발생할 수 있음
즉시 로딩으로 설정 시 성능 튜닝이 어려워짐
항상 지연로딩을 기본으로하고, 성능 최적화가 필요한 경우 페치조인(fetch join)을 사용



```
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