-- 1. 소매가(retailprice)가 $125이상인 상품을 알파벳순으로 보여주십시오. 라는 문제를 풀기 위해, 빈칸1, 빈칸2에 들어가야할 문법을 알려주세요.
-- 2. 캘리포니아 주에 거주 하며, 우편번호(custzipcode) 가 92199 인 고객이 몇 명인가요?
-- 3. 주문 번호 (ordernumber) 8번에 대한 총 주문 금액은 얼마인가요? ( 소수점 값은 반올림하여 확인해주세요, ex) 1000.50의 경우 -> 1001원으로 확인 )
-- 4. 주문 일이 2017-09-02 일에 해당하면서, 상품 번호가 1 이거나 또는 상품의 개 당 가격이 $1000~$2000 달러 사이인 상품에 대한 구매 정보 가 포함된 주문 번호의 갯수를 알려주세요. ( 주문번호의 갯수는 중복 제거한 수량을 의미합니다.)
-- 5. 도시 (vendcity) Ballard, Bellevue 및 Redmond에 본사를 둔 모든 공급 업체(vendor) 를 찾기 위한 쿼리를 작성하기 위해서, 사용할 수 있는 문법을 모두 골라주세요.


-- 1. 소매가(retailprice)가 $125이상인 상품을 알파벳순으로 보여주십시오. 라는 문제를 풀기 위해, 빈칸1, 빈칸2에 들어가야할 문법을 알려주세요.
select *
  from products as p
 where p.retailprice >= 125
 order by productname asc

-- 2. 캘리포니아 주에 거주 하며, 우편번호(custzipcode) 가 92199 인 고객이 몇 명인가요?
select count(*)
 from customers c
where c.custzipcode = '92199'
  and c.custstate = 'CA'

-- 3. 주문 번호 (ordernumber) 8번에 대한 총 주문 금액은 얼마인가요? ( 소수점 값은 반올림하여 확인해주세요, ex) 1000.50의 경우 -> 1001원으로 확인 )
select sum(od.quotedprice * od.quantityordered)
 from orders o
inner join order_details od on od.ordernumber = o.ordernumber
where o.ordernumber = 8
  
-- 4. 주문 일이 2017-09-02 일에 해당하면서, 상품 번호가 1 이거나 또는 상품의 개 당 가격이 $1000~$2000 달러 사이인 상품에 대한 구매 정보 가 포함된 주문 번호의 갯수를 알려주세요. ( 주문번호의 갯수는 중복 제거한 수량을 의미합니다.)
select count(*)
 from orders o
inner join order_details od on od.ordernumber = o.ordernumber
where o.orderdate = '2017-09-02'
  and (od.quotedprice between 1000 and 2000 or od.productnumber = 1)

-- 5. 도시 (vendcity) Ballard, Bellevue 및 Redmond에 본사를 둔 모든 공급 업체(vendor) 를 찾기 위한 쿼리를 작성하기 위해서, 사용할 수 있는 문법을 모두 골라주세요.
  select *
   from vendors  v
  where v.vendcity in ('Ballard', 'Bellevue', 'Redmond')
  
 select *
   from vendors  v
  where v.vendcity = 'Ballard'
    or v.vendcity = 'Bellevue'
    or v.vendcity ='Redmond'
  
  