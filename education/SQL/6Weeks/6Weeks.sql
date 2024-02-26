-- 문제1번)  각 제품(product)의 제품명과 총 판매량( quantityordered )을 알려주세요. 추가로, 전체 판매량 또한 알려주세요. 
-- 문제2번)  주문 금액이 $1000 이상이며,  총 주문 횟수가 3회 이상인 고객 번호와 이름은? 
-- 문제3번) 미국 서해안에 있는 주 (custstate ) 에서 전체 주문 금액이 $1,000,000 가 넘는 주를 보여주세요.
-- Hint  1. 서해안 주  : custstate  =  'WA', 'OR', 'CA'
-- 문제4번)  헬멧을 주문한 적 없는 고객을 보여주세요. not exists를 꼭 활용하여 풀이해주세요.
-- Hint 1. Productname을 활용하여 헬맷 확인 (카테고리테이블 활용 X)
-- 문제5번) 고객의 월별 주문 횟수가 3 번 이상을 기록한 적 있는 모든 고객 이름은 무엇인가요? (GROUP BY, HAVING, JOIN 사용)
-- 문제6번)직원과 고객중이  이름이 동일한 사람이 있을까요?  있다면 해당 사람의 이름에 대해서 (이름+ 성) 형식으로 알려주세요.
-- 문제7번)  2017년 09 월에 해당 하는 주문에 대해서, 1~10일, 11~20일, 21~30일에 대한 각각의 구간에 대한 주문 금액을 보여주세요. 
-- row 수는 1개로  1~10일에 해당하는 주문금액,  11~20일에 해당하는 주문금액, 21~30일에 해당하는 주문금액과 , 총 주문금액에 대한 컬럼으로 보여주세요.
-- 문제8번) 주문을 많이 한 고객 순서 대로 순위를 매겨 나열하세요.  (analytic function 활용)
-- - 같은 주문 수치 일 때, 같은 등수로 보여주세요.
-- - 순위는 1,2,3등의 형식으로 순차적인 값이 노출되어야 합니다.
-- - 단 고객의 리스트는 다음에 제한 조건을 가집니다.
-- - 월별 주문 5회 이상한 Case를  3개월 이상한 경험한 고객으로만 제한합니다. (3개월은 연속이던 불연속이던 상관없습니다.)
-- ex)  고객1이 1월에 6회 , 3월에 5회,  9월에 5회 주문한 경험이있다면 포함해야합니다. 
-- 문제9번) Tire 카테고리 주문 량이 매달 증가하고 있나요?  (2017년 1월 ~ 12월 까지 판매량만 확인하시면 됩니다.)
--     월별 주문량을 이전 달 주문량과 함께 표기해 증가 여부를 알려주세요.  (analytic function 활용)
--     -- 아래의 표기 값으로 산출 해주세요. 
--     - 이전 달 보다 값이 크다면 ? 'PLUS'
--     - 이전 달의 값이 현재 값 보다 크다면 ? 'MINUS'
--     - 현재 달의 판매 량과 이전 달 값이 같다면 ? 'SAME'
--     - 이 외의 Case 는 ? NULL 
--  Hint 1. 카테고리 테이블 활용 필요  - "Tires" 카테고리 확인 
-- 문제10번) 주문일자별,  직원이 처리한  주문 수를 알려주세요. 총 전체 주문 수도 함께 보여주세요. 


-- 문제1번)  각 제품(product)의 제품명과 총 판매량( quantityordered )을 알려주세요. 추가로, 전체 판매량 또한 알려주세요. 
select coalesce(p.productname , 'Total quantityordered') as productname, sum(od.quantityordered) as quantityordered
 from orders o
inner join order_details od on od.ordernumber = o.ordernumber
inner join products p on p.productnumber = od.productnumber
group by grouping sets ((p.productname), ())
order by p.productname

-- 문제2번)  주문 금액이 $1000 이상이며,  총 주문 횟수가 3회 이상인 고객 번호와 이름은? 
with order_price as (
select o.customerid, sum(od.quantityordered * od.quotedprice) order_price
 from orders o
inner join order_details od on od.ordernumber = o.ordernumber
inner join products p on p.productnumber = od.productnumber
where 1 = 1
group by o.customerid
), order_count as(
select o.customerid, count(o.ordernumber) order_count
 from orders o
where 1 = 1
group by o.customerid
order by o.customerid
)
select oc.customerid, (c.custfirstname || ' ' || c.custlastname) as customername
  from order_price op
 inner join order_count oc on oc.customerid = op.customerid
 inner join customers c on c.customerid = oc.customerid
 where oc.order_count >= 3
   and op.order_price >= 1000
order by oc.customerid   

-- 문제3번) 미국 서해안에 있는 주 (custstate ) 에서 전체 주문 금액이 $1,000,000 가 넘는 주를 보여주세요.
-- Hint  1. 서해안 주  : custstate  =  'WA', 'OR', 'CA'
select c.custstate
 from orders o
inner join order_details od on od.ordernumber = o.ordernumber
inner join products p on p.productnumber = od.productnumber
inner join customers c on c.customerid = o.customerid
where c.custstate in ('WA', 'OR', 'CA')
group by grouping sets (c.custstate)
having sum(od.quantityordered * od.quotedprice) > 1000000

-- 문제4번)  헬멧을 주문한 적 없는 고객을 보여주세요. not exists를 꼭 활용하여 풀이해주세요.
-- Hint 1. Productname을 활용하여 헬맷 확인 (카테고리테이블 활용 X)
select c.customerid, (c.custfirstname || ' ' || c.custlastname) as customername
 from customers c 
where c.customerid not in (
select o.customerid
 from orders o
inner join order_details od on od.ordernumber = o.ordernumber
inner join products p on p.productnumber = od.productnumber
where not exists (select * from products p where p.productname is null)
  and p.productname like '%Helmet'
order by o.customerid
)

-- 문제5번) 고객의 월별 주문 횟수가 3 번 이상을 기록한 적 있는 모든 고객 이름은 무엇인가요? (GROUP BY, HAVING, JOIN 사용)
with orders_count as (
select o.customerid, to_char(o.orderdate, 'YYYY-MM'), count(o.ordernumber) order_count
 from orders o
where 1 = 1
group by to_char(o.orderdate, 'YYYY-MM'), o.customerid
having  count(o.ordernumber) >= 3
order by o.customerid, to_char(o.orderdate, 'YYYY-MM')
)
select (c.custfirstname || ' ' || c.custlastname) as customername
 from orders_count oc
inner join customers c on c.customerid = oc.customerid
group by (c.custfirstname || ' ' || c.custlastname)

-- 문제6번)직원과 고객중이  이름이 동일한 사람이 있을까요?  있다면 해당 사람의 이름에 대해서 (이름+ 성) 형식으로 알려주세요.
with cust as (
select c.custfirstname || c.custlastname as fullname, c.custfirstname as firstname,  'customers' as type
  from customers c
), emp as (
  select e.empfirstname || e.emplastname as fullname, e.empfirstname as firstname, 'employees' as type
  from employees e
)
select c.fullname cust_fullname, e.fullname emp_fullname
 from cust c
inner join emp e on e.firstname = c.firstname

-- 문제7번)  2017년 09 월에 해당 하는 주문에 대해서, 1~10일, 11~20일, 21~30일에 대한 각각의 구간에 대한 주문 금액을 보여주세요. 
-- row 수는 1개로  1~10일에 해당하는 주문금액,  11~20일에 해당하는 주문금액, 21~30일에 해당하는 주문금액과 , 총 주문금액에 대한 컬럼으로 보여주세요.
WITH tb_1_10
AS (
	SELECT sum(od.quantityordered * od.quotedprice) AS price
		, '1~10일에 해당하는 주문금액' AS month_type
	FROM orders o
	INNER JOIN order_details od ON od.ordernumber = o.ordernumber
	INNER JOIN products p ON p.productnumber = od.productnumber
	WHERE 1 = 1
		AND o.orderdate BETWEEN '2017-09-01' AND '2017-09-10'
), tb_11_20 AS (
	select sum(od.quantityordered * od.quotedprice) AS price
		, '11~20일에 해당하는 주문금액' AS month_type
	FROM orders o
	INNER JOIN order_details od ON od.ordernumber = o.ordernumber
	INNER JOIN products p ON p.productnumber = od.productnumber
	WHERE 1 = 1
		AND o.orderdate BETWEEN '2017-09-11' AND '2017-09-20'
), tb_21_30 AS (
	SELECT sum(od.quantityordered * od.quotedprice) AS price
		, '21~30일에 해당하는 주문금액' AS month_type
	FROM orders o
	INNER JOIN order_details od ON od.ordernumber = o.ordernumber
	INNER JOIN products p ON p.productnumber = od.productnumber
	WHERE 1 = 1
		AND o.orderdate BETWEEN '2017-09-21' AND '2017-09-30'
), tb_total as (
	SELECT sum(od.quantityordered * od.quotedprice) AS price
		, '총 주문금액' AS month_type
	FROM orders o
	INNER JOIN order_details od ON od.ordernumber = o.ordernumber
	INNER JOIN products p ON p.productnumber = od.productnumber
	WHERE 1 = 1
		AND o.orderdate BETWEEN '2017-09-01' AND '2017-09-30'
), tb_union as (
select price, month_type
 from tb_1_10
union all
select  price, month_type
 from tb_11_20
union all
select  price, month_type
 from tb_21_30
union all
select  price, month_type
 from tb_total
)
select 
    MAX(CASE WHEN month_type = '1~10일에 해당하는 주문금액' THEN price END) as "1~10일에 해당하는 주문금액",
    MAX(CASE WHEN month_type = '11~20일에 해당하는 주문금액' THEN price END) as "11~20일에 해당하는 주문금액",
    MAX(CASE WHEN month_type = '21~30일에 해당하는 주문금액' THEN price END) as "21~30일에 해당하는 주문금액",
    MAX(CASE WHEN month_type = '총 주문금액' THEN price END) as "총 주문금액"
 from tb_union

-- 문제8번) 주문을 많이 한 고객 순서 대로 순위를 매겨 나열하세요.  (analytic function 활용)
-- - 같은 주문 수치 일 때, 같은 등수로 보여주세요.
-- - 순위는 1,2,3등의 형식으로 순차적인 값이 노출되어야 합니다.
-- - 단 고객의 리스트는 다음에 제한 조건을 가집니다.
-- - 월별 주문 5회 이상한 Case를  3개월 이상한 경험한 고객으로만 제한합니다. (3개월은 연속이던 불연속이던 상관없습니다.)
-- ex)  고객1이 1월에 6회 , 3월에 5회,  9월에 5회 주문한 경험이있다면 포함해야합니다. 

-- 문제9번) Tire 카테고리 주문 량이 매달 증가하고 있나요?  (2017년 1월 ~ 12월 까지 판매량만 확인하시면 됩니다.)
--     월별 주문량을 이전 달 주문량과 함께 표기해 증가 여부를 알려주세요.  (analytic function 활용)
--     -- 아래의 표기 값으로 산출 해주세요. 
--     - 이전 달 보다 값이 크다면 ? 'PLUS'
--     - 이전 달의 값이 현재 값 보다 크다면 ? 'MINUS'
--     - 현재 달의 판매 량과 이전 달 값이 같다면 ? 'SAME'
--     - 이 외의 Case 는 ? NULL 
--  Hint 1. 카테고리 테이블 활용 필요  - "Tires" 카테고리 확인 	
with cur_date as (
	select substring(cast(o.orderdate as varchar),1,7) orderdate
	,c.categorydescription, count(o.ordernumber) as cnt
	  from orders o
	 inner join order_details od on od.ordernumber = o.ordernumber
	 inner join products p on p.productnumber = od.productnumber
	 inner join categories c on c.categoryid = p.categoryid
	where c.categorydescription = 'Tires'
	  and o.orderdate between '2017-01-01' and '2017-12-31'
	group by grouping sets ((substring(cast(o.orderdate as varchar),1,7), c.categorydescription))
	order by substring(cast(o.orderdate as varchar),1,7)
), pre_date as (
	select substring(cast(o.orderdate as varchar),1,7) orderdate
	, lag(substring(cast(o.orderdate as varchar),1,7), 1) over(order by substring(cast(o.orderdate as varchar),1,7) asc ) as pre_date
	, lag(count(o.ordernumber), 1) over () as prev_cnt
	  from orders o
	 inner join order_details od on od.ordernumber = o.ordernumber
	 inner join products p on p.productnumber = od.productnumber
	 inner join categories c on c.categoryid = p.categoryid
	where c.categorydescription = 'Tires'
	  and o.orderdate between '2017-01-01' and '2017-12-31'
	group by grouping sets ((substring(cast(o.orderdate as varchar),1,7), c.categorydescription))
	order by substring(cast(o.orderdate as varchar),1,7)
)
select cd.orderdate, cd.cnt, pd.pre_date, pd.prev_cnt
,case when cd.cnt > pd.prev_cnt then 'PLUS' 
when cd.cnt < pd.prev_cnt then 'MINUS' 
when cd.cnt = pd.prev_cnt then 'SAME'
else null end as type
  from cur_date cd
 inner join pre_date pd on pd.orderdate =   cd.orderdate
 
-- 문제10번) 주문일자별,  직원이 처리한  주문 수를 알려주세요. 총 전체 주문 수도 함께 보여주세요.
 select o.orderdate, o.employeeid, count(o.ordernumber)
   from orders o
group by grouping sets ((o.orderdate, o.employeeid), ())
order by o.orderdate, o.employeeid
 
 