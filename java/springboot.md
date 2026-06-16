## springboot-eatgo.md

## 2021년 2월 2일 
SpringBoot 실전 프로젝트

### 제1차시

#### 1. 강의소개및 활용법

"뭔가 잘못했겠지"

반성의 시간 가지기 "무엇을 했나?", "뭐가 어려웠나?", "다음엔 어떻게 할것인가?" (계획세우기)
-> 이를 통해서 성장할수 있을 것이고, 기록하기 (매일 기록하고 반성하는 습관을 가져야함)

급한일 VS 중요한일
-> 사람은 기본적으로 급한 일 우선으로 처리하려고 한다. 급한일부터 처리하지말자 -> 무엇이 중요한가? 확인 후 처리하기

#### 2. 무엇을 만들 것인가?

1. 무엇이 문제인가? -> 불편한점 -> 분야를 선택 (ex) 버스를 타고 다니면 불편함 = Domain -> 올바른문제 찾기 -> 대박

올바른 문제 찾기는 어렵다

2. 오늘 뭐 먹지? -> Why? -> 왜 고민하나? -> 무엇이 문제인가? -> 
주변에 어떤 가게가 있는지 잘 모른다. 매일 같은 곳을 간다.
어떤 가게가 좋은지 잘 모르겠다. 기존에 방문한 사람들은 뭐라고 평가하는가?
예전에 봐둔가게가 있었는데 기억이 안난다.
가보고 싶은 곳을 기록하고 싶다.
가게에 자리가 있는지 모르겠다.
심리적으로 불편한 전화 대신 온라인으로 예약할 수 있을까?

3. 사용자 입장에서 스토리를 구성 (사용자 스토리) = 기능명세서와 같지 않을까
사용자 입장에서 기능을 서술

(사용자)는
(가치)를 위해
(기능)을 할 수 있다. 

4. 사용자는 누구인가? = 유스케이스 다이어그램과 비슷하지 않을까

고객
가게
관리자

고객은 뭘 먹고 싶은지 발견할 수 있도록 가게 목록을 볼 수 있다.
-> 뭘 먹고 싶은지 발견 이부분을 집중해서 어떻게 해야한다.
고객은 정확히 먹고 싶은 게 뭔지 확인하기 위해 가게의 메뉴를 볼 수 있다. 
고객은 좋은 가게인지 알 수 있도록 평점을 확인할 수 있다.
고객은 선택의 폭을 좁히기 위해 가게 목록을 분류에 따라 볼 수 있다.
고객은 나와 남을 위해 가게에 평점과 리뷰를 남길 수 있다.
->'나와 남을 위해'
고객은 나중에 찾아보기 쉽도록 가게를 즐겨찾기에 추가할 수 있다.
고객은 가게에서 기다리지 않기 위해 가게에 인원 메뉴를 에약할 수 있다.

가게는 관심있는 고객을 받기위해 예ㅑ약요청을 확인할수있다.
가게는 더나은 고객 서비스를 위해 예약요청에 응답할수있다.

관리자는 고객이 서비스를 쓸수있도록 가게정보를 등록할 수 있다.


인간의 욕심은 끝이 없고, 요구사항 변경은 반복된다. -> 계획을 세우자.
(요구사항의 변경은 좋은 신호)


* 어떤사람이 어떤가치를 얻을 수 있는지를 항상 생각하는 습관을 가지자

### 3. 어떻게 만들 것인가?

도메인 모델링
Restaurant
Menu Item
Food & Beverages
User 정보 (고객, 사장님, 관리자)
Favorite
Review
Reservation

시스템 아키텍처 Sysytem Architecture
* 제약조건
- 웹 Web
- Mobile에서도 사용가능 (모바일 어플리케이션)

다른부분이 존재, 공통인 부분 기능은 공통
-> Front-end, Back-end

Multi-tier Architecture 여러개의 계층으로 나눠서 시스템을 구성

3-tier Architecture
Presentataion, Business, Data Source
-> Front-end, Back-end, DB
-> HTML/CSS/JS , REST API, DBMS

Back-end에 집중

*Layerd Architecture
-UI Layer
-Application Layer
-Domain Layer
-Infrastructure Layer
프로그램의 복잡도를 낮추기 위해서 

*기술
Java
Spring Boot
REST API

#### 4. Hello, World

Spring Initializr
Demo


Spring.io
Quick start

Gradle
Java
2.1.5

option

Group kr.co.fastcampus
Artifact eatgo
설명 eatgo
Desce Eat Go Project
Jar , 8


Depencencies

Web -> Spring Web Starter
devtools -> Spring Boot DevTools
lombok -> Lombok


Gererate the project


1. 압축풀기
2. 프로젝트 실행
3. IntelliJ 설치


Refactor Rename 

README.md

interfaces
WelcomeController

* devTools가 알아서 재시작함

* test를 활용해야하는 이유


#### 5. Test Driven Development
- 테스트 주도 개발  = 목표 주도 개발 = 사용자 중심 개발 = 인터페이스 중심 개발
(목표를 달성했는지 테스트)

* TDD의 목표 
1. 올바르게 작동하는 깔끔한 코드를 만드는게 목표

Refactoring
Test Code 작성
Test First

TDD의 과정
Red (실패하는 코드)
Green (Add 가능하도록)
Refactoring (x + y 등을 구현해서 실행하도록)

실행하는게 오래걸릴때 TDD를 활용


* Demo

Restaurant

Go TO > Test

*Tip ctrl + shift 로 매서드 위치 변경 




#### 6. REST API

다양한 환경 지원

서로다른 Front-end
하나의 Back-end

Create
Read
Update
Delete

POST
GET
PUT/PATCH
DELETE

URI 
URL (Uniform Resource Locator)


* Collection 역할
Read(List), Create

ex http://host/restaurants/

* Member 역할
Read(Detail), Update, Delete


ex http://host/restaurants/{id}



* JSON 

* APIs
가게목록
GET /restaurants
GET /restaurants/1
GET /restaurants/{id}

가게추가
POST /restaurants

가게수정
PATCH /restaurants/{id}

가게 삭제
DELETE /restaurants/{id}


#### 7. 가게목록
실제 구현

#### 8. 가게상세 -1
실제 구현

중복
Respository


#### 9. 가게상세 -2
실제 구현


#### 10. 의존성 주입

Dependency Injection

의존성 주입

의존관계

A는 B에 의존 = A가 B를 사용 
-> B의 변화가 A에 영향 => 관리 필요

Controller는 Repository에 의존

Controller에 Repository를 사용

Spring IOC Container의 역할
@Component
@Autowired

extract interface

#### 11. 레이어 분리-1

Layered Architechture

UI Layer
Application Layer
Domain Layer


interfaces
application
domain


Menu, Item을 추가

복잡한 로직 -> Application Layer 도입 -> Restaurant Service

실습


#### 12. 레이어 분리-2

실습

#### 13. 가짜객체

Mock Object

Mockito 

Spring Test

POJO
(Plain Old Java Object)


#### 14. 가게 추가-1

Header Location

Empty {}
Httpie 설치

UI Layer = Controller
Application Layer = Service


http GET localhost:8080
http POST localhost:8080/restaurants name=BeRyong address=Busan
http GET localhost:8080/restaurants

Controller

#### 15. 가게 추가-2


### 3차시 Spring Boot 실전 프로젝트 03

#### JPA

#### 프론트엔드

#### 가게 수정

#### Lombok - 1

#### Lombok - 2

#### Validation

#### 에러 처리

### 4차시 Spring Boot 실전 프로젝트 04

#### 메뉴 관리 -1
#### 메뉴 관리 -2
#### 메뉴 관리 -3

#### 리뷰 작성 -1
#### 리뷰 작성 -2
#### 리뷰 작성 -3


### 5차시 Spring Boot 실전 프로젝트 05
#### 프로젝트 분리 -1
#### 프로젝트 분리 -2
#### 프로젝트 분리 -3
#### 프로젝트 분리 -4
#### 프로젝트 분리 -5
#### 진짜 영속화


### 6차시 Spring Boot 실전 프로젝트 06
#### 가게 목록 필터링 -1
#### 가게 목록 필터링 -2
#### 가게 목록 필터링 -3
#### 가게 목록 필터링 -4
#### 가게 목록 필터링 -5
#### 가게 목록 필터링 -6


### 7차시 Spring Boot 실전 프로젝트 07

## springboot-jpa.md

### SpringBoot JPA

#### SpringBoot 설정

1. spring initalizr
- https://start.spring.io/

- 설정 후 GENERATE 클릭

2. IntelliJ IDE애서 다운받은 폴더를 실행

3. Run > Edit Configurations > +버튼 > Gradle > Run에 bootRun 입력 후 OK

3. Run > Run 'spring' 실행 후 WebBrowser에서 localhost:8080/ 에 접속

#### Spring restTemplate UrlEncoding
```java

String url = CommonUtils.relayURL(apiUrl, initRequestParameters(map));
ResponseEntity<String> result = restTemplate.getForEntity(url, String.class);

// String Type으로 선언한 Url을 URI Object로 선언 시 별도의 인코딩 처리가 발생하지 않음 
String url = CommonUtils.relayURL(apiUrl, initRequestParameters(map));
ResponseEntity<String> result = restTemplate.getForEntity(new URI(url), String.class);
```

## springboot-jsp.md

#### Spring profiles Change
```js
Github등 open된 곳에서 소스를 관리할 경우 DB 정보와 같은 중요정보는 Parameter를 사용해서 실행하도록 하면, 정보 보호가 가능함 
* 적용방법(bootRun 시 VM 세팅에 추가)
-Dspring.profiles.active=prod -Dspring.datasource.username=test  -Dspring.datasource.password=test -Dvariables.ip=127.0.0.1 -Dvariables.sid=XE


1. build.gradle

implementation 'org.springframework.boot:spring-boot-configuration-processor'

bootRun {
    systemProperties System.properties
    main = "com.tistory.f5074.spring_boot.Application"
}

2. Application.java
@SpringBootApplication
@MapperScan(value = {"com.tistory.f5074.spring_boot"})
@EnableConfigurationProperties

3. application.yml
spring:
  profiles:
    active: test
  datasource:
    driver-class-name: net.sf.log4jdbc.sql.jdbcapi.DriverSpy
    url: jdbc:log4jdbc:oracle:thin:@${variables.ip}:1521/${variables.sid}
    username: test
    password: test

variables:
  ip: localhost
  sid: xe
```

#### JSP 세팅
```js
1. build.gradle
implementation 'javax.servlet:jstl'
implementation 'org.apache.tomcat.embed:tomcat-embed-jasper'

2. application.yml
spring:
  mvc:
    static-path-pattern: /static/**
    view:
      prefix: /WEB-INF/views/
      suffix: .jsp

3. src/main/webapp/WEB-INF/views/index.jsp
해당경로에 설정해줘야 jsp 페이지가 적용됨
```


#### jar 배치 실행 시 JSP가 열리지 않는 부분
```js
jar를 war로 변경해서 배포할 경우 가능

1. build.gradle
apply plugin: 'war'

bootWar{
    archiveBaseName = 'spring_boot'
    archiveFileName =  'spring_boot.war'
    archiveVersion = '0.0.0'
} 

2. build.gradle을 변경후 gradle sync 시 ServletInitializer 생성됨

3. 기존 Application.java 에 메인 메서드를 ServletInitializer로 변경

@SpringBootApplication
@MapperScan(value = {"com.tistory.f5074.spring_boot"})
@EnableConfigurationProperties
public class ServletInitializer extends SpringBootServletInitializer {

    @Override
    protected SpringApplicationBuilder configure(SpringApplicationBuilder application) {
        return application.sources(Application.class);
    }


    public static void main(String[] args){
        SpringApplication.run(ServletInitializer.class,args);
    }

}

4. application.yml 리소스용 파일위치

spring: 
  resources:
    static-locations: classpath:/static/
    add-mappings: true
```

#### batch file
```bash
vi start_server.sh

---
#!/bin/sh -
nohup java -Dfile.encoding=UTF-8 -jar ./build/drawing-app.war --server.port=8081 > ./drawing-app/app.out 2> ./drawing-app/app.err < /dev/null & nohup echo $! > ./drawing-app/pid.file &
---

vi stop_server.sh
---
#!/bin/sh -
kill $(cat ./drawing-app/pid.file)
---
```

#### Run Configurations
```js
Environment variables: 
-spring.profiles.active=stage;-spring.datasource.url=jdbc:log4jdbc:oracle:thin:@127.0.0.1:1521/XE
```

#### 방화벽 작업후 postgre SQL관련 연결이 안됨

```sql
-- connect 상태 확인 시 방화벽 작업이후 해당 커넥션이 연결되지 않음
-- 서버에서 telnet 등을 사용해서 연결상태는 정상이었음
-- 방화벽 작업 후 Java 서비스에서 재연결이 되지 않아서 발생


-- postgre 운영 커넥션 정보 확인
SELECT usename
	, application_name
	, client_addr
	, client_port
	, backend_start
	, query_start
	, state
	, query
FROM pg_stat_activity
WHERE datname = 'postgres'
	AND client_addr IN ('192.168.0.1', '192.168.0.2')
ORDER BY client_addr DESC
```

## springboot-lecture.md

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

