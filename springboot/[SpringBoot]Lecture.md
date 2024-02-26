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

```
#  org.hibernate.type: trace

@ManyToOne(fetch = EAGER) 하면 안되는 이유 
@ManyToOne(fetch = LAZY)를 사용

엔티티를 DTO로 변환하는 일반적인 방법
쿼리가 총 1 + N + N번 실행된다. (v1과 쿼리수 결과는 같다.)

```
```java
@GetMapping("/api/v2/simple-orders")
public List<SimpleOrderDto> ordersV2() {
    // ORDER 2개
    // N + 1 -> 1 + 회원 N + 배송 N
    List<Order> orders = orderRepository.findAll();
    List<SimpleOrderDto> result = orders.stream()
            .map(o -> new SimpleOrderDto(o))
            .collect(toList());

    return result;
}
```

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
```
한번의 쿼리로 실행이 가능
```

```java

// OrderQueryRepository
public List<OrderFlatDto> findAllByDto_flat() {
    return em.createQuery(
            "select new jpabook.jpashop.repository.order.query.OrderFlatDto(o.id, m.name, o.orderDate, o.status, d.address, i.name, oi.orderPrice, oi.count)" +
                    " from Order o" +
                    " join o.member m" +
                    " join o.delivery d" +
                    " join o.orderItems oi" +
                    " join oi.item i", OrderFlatDto.class)
            .getResultList();
}

// OrderApiController
@GetMapping("/api/v6/orders")
public List<OrderQueryDto> ordersV6() {
    List<OrderFlatDto> flats = orderQueryRepository.findAllByDto_flat();

    return flats.stream()
            .collect(groupingBy(o -> new OrderQueryDto(o.getOrderId(), o.getName(), o.getOrderDate(), o.getOrderStatus(), o.getAddress()),
                    mapping(o -> new OrderItemQueryDto(o.getOrderId(), o.getItemName(), o.getOrderPrice(), o.getCount()), toList())
            )).entrySet().stream()
            .map(e -> new OrderQueryDto(e.getKey().getOrderId(), e.getKey().getName(), e.getKey().getOrderDate(), e.getKey().getOrderStatus(), e.getKey().getAddress(), e.getValue()))
            .collect(toList());
}

// OrderQueryDto
@EqualsAndHashCode(of = "orderId")
```

### API 개발 고급 정리

```
*엔티티 조회
- 엔티티를 조회해서 그대로 반환: V1
- 엔티티 조회 후 DTO로 변환: V2
- 페치 조인으로 쿼리 수 최적화: V3
- 컬렉션 페이징과 한계 돌파: V3.1
    - 컬렉션은 페치 조인시 페이징이 불가능
    - ToOne 관계는 페치 조인으로 쿼리 수 최적화
    - 컬렉션은 페치 조인 대신에 지연 로딩을 유지하고, hibernate.default_batch_fetch_size,
      @BatchSize로 최적화

*DTO 직접조회
- JPA에서 DTO를 직접 조회: V4
- 컬렉션 조회 최적화- 일대다 관계인 컬렉션은 IN 절을 활용해서 메모리에 미리 조회해서 최적화: V5
- 플랫 데이터 최적화 - JOIN 결과를 그대로 조회 후 애플리케이션에서 원하는 모양으로 직접 변환: V6

*권장순서
1. 엔티티 조회방식으로 우선 접근
    1.페치조인으로 쿼리 수를 최적화
    2.컬렉션 최적화
        1.페이징 필요 -> hibernate.default_batch_fetch_size, @BatchSize로 최적화
        2. 페이징 필요x -> 페치 조인 사용
2. 엔티티 조회 방식으로 해결이 안되면 DTO 조회 방식 사용
3. DTO 조회 방식으로 해결이 안되면 NativeSQL or Spring JdbcTemplate

참고: 엔티티 조회 방식은 페치 조인이나, hibernate.default_batch_fetch_size, @BatchSize 같이 코드를 거의 수정하지 않고, 옵션만 약간 변경해서, 다양한 성능 최적화를 시도할 수 있다. 반면에 DTO를 직접 조회하는 방식은 성능을 최적화 하거나 성능 최적화 방식을 변경할 때 많은 코드를 변경해야 한다.

참고: 개발자는 성능 최적화와 코드 복잡도 사이에서 줄타기를 해야한다. 항상 그런 것은 아니지만, 보통 성능 최적화는 단순한 코드를 복잡한 코드로 몰고간다.
엔티티 조회방식은 JPA가 많은 부분을 최적화 해주기 때문에, 단순한 코드를 유지하면서, 성능을 최적화 할 수 있다.
반면에 DTO 조회 방식은 SQL을 직접 다루는 것과 유사하기 때문에, 둘 사이에 줄타기를 해야 한다.


DTO 조회 방식의 선택지
- DTO로 조회하는 방법도 각각 장단이 있다. V4, V5, V6에서 단순하게 쿼리가 1번 실행된다고 V6이 항상 좋은 방법인 것은 아니다.
-V4는 코드가 단순하가. 특정 주문 한건만 조회하면 이 방식을 사용해도 성능이 잘 나온다. 예를 들어서 조회한 Order데이터가 1건이면 OrderItem을 찾기 위한 쿼리도 1번만 실행하면 된다.
-V5는 코드가 복잡하다. 여러 주문을 한꺼번에 조회하는 경우에는 V4 대신에 이것을 최적화한 V5 방식을 사용해야 한다. 예를 들어서 조회한 Order데이터가 1000건인데, V4 방식을 그대로 사용하면, 쿼리가 총 1 + 1000번 실행된다. 여기서 1은 Order를 조회한 쿼리고, 1000은 조회된 Order의 row 수다. V5 방식으로 최적화 하면 쿼리가 총 1 + 1번만 실행된다. 상황에 따라 다르겠지만 운영 환경에서 100배 이상의 성능 차이가 날 수 있다.
-V6는 완전히 다른 접근방식이다. 쿼리 한번으로 최적화 되어서 상당히 좋아보이지만, Order를 기준으로 페이징이 불가능하다. 실무에서는 이정도 데이터면 수백이나, 수천건 단위로 페이징 처리가 꼭 필요하므로, 이 경우 선택하기 어려운 방법이다. 그리고 데이터가 많으면 중복 전송이 증가해서 V5와 비교해서 성능 차이도 미비하다.
```

## API 개발 고급 - 실무 필수 최적화
### OSIV와 성능 최적화

## 다음으로
### 스프링 데이터 JPA 소개
### QueryDSL 소개