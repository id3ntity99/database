#날짜 : 2025/01/13
#이름 : 이현민
#내용 : SQL 연습문제1

# 실습 1-1
create database `Shop`;
create user 'shop'@'%' identified by '1234';
grant all privileges on Shop.* to 'shop'@'%';

# 실습 1-2
use `Shop`;
create table `Customer`(
	custId VARCHAR(10) NOT NULL primary key,
    name VARCHAR(10) NOT NULL,
    hp CHAR(13) NULL,
    addr VARCHAR(100) NULL,
    rdate DATE NOT NULL
);

create table `Product`(
	prodNo int  not null primary key,
    prodName varchar(10) not null,
    stock int not null default 0,
    price int default null,
    company varchar(20) not null
);

create table `Order`(
	orderNo int primary key not null auto_increment,
    orderId varchar(10) not null,
    orderProduct int not null,
    orderCount int not null default 1,
    orderDate datetime not null
);

# 실습 1-3
insert into `customer` values('c101', '김유신', '010-1234-1001', '김해시 봉황동', curdate());
insert into `customer` values('c102', '김춘추', '010-1234-1002', '경주시 보문동', curdate());
insert into `customer` values('c103', '장보고', '010-1234-1003', '완도군 청산면', curdate());
insert into `customer` values('c104', '강감찬', '010-1234-1004', '서울시 마포구', curdate());
insert into `customer` values('c105', '이성계', null, null, curdate());

insert into `customer` values('c106', '정철', '010-1234-1006', '경기도 용인시', curdate());
insert into `customer` values('c107', '허준', null, null, curdate());
insert into `customer` values('c108', '이순신', '010-1234-1008', '서울시 영등포구', curdate());
insert into `customer` values('c109', '송상현', '010-1234-1009', '부산시 동래구', curdate());
insert into `customer` values('c110', '정약용', '010-1234-1010', '경기도 광주시', curdate());

insert into `Product` values(1, "새우깡", 5000, 1500, "농심");
insert into `Product` values(2, "초코파이", 2500, 2500, "오리온");
insert into `Product` values(3, "포카칩", 3600, 1700, "오리온");
insert into `Product` values(4, "양파링", 1250, 1800, "농심");
insert into `Product` values(5, "죠리퐁", 2200, null, "크라운");
insert into `Product` values(6, "마가렛트", 3500, 3500, "롯데");
insert into `Product` values(7, "뿌셔뿌셔", 1650, 1200, "오뚜기");

insert into `Order` values(1, "c102", 3, 2, now());
insert into `Order` values(2, "c101", 4, 1, now());
insert into `Order` values(3, "c108", 1, 1, now());
insert into `Order` values(4, "c109", 6, 5, now());
insert into `Order` values(5, "c102", 2, 1, now());

insert into `Order` values(6, "c101", 7, 3, now());
insert into `Order` values(7, "c110", 1, 2, now());
insert into `Order` values(8, "c104", 2, 4, now());
insert into `Order` values(9, "c102", 1, 3, now());
insert into `Order` values(10, "c107", 6, 1, now());

# 실습 1-4
select * from `Customer`;

# 실습 1-5
SELECT custid, name, hp from `Customer`;

# 실습 1-6
select * from `Product`;

# 실습 1-7
select company from `product`;

# 실습 1-8
select distinct company from `product`;

# 실습 1-9
select `prodName`, `price` from `product`;

# 실습 1-10
select `prodName`, `price` + 500 as `조정 단가` from `product`;

# 실습 1-11
select `prodName`, `stock`, `price` from `product` where `company`='오리온';

# 실습 1-12
select `orderProduct`, `orderCount`, `orderDate` from `Order` where `orderId` = 'c102';

# 실습 1-13
select `orderProduct`, `orderCount`, `orderDate` from `Order` where `orderId` = 'c102' AND `orderCount` >= 2;

# 실습 1-14
select * from `Product` where `price` >= 1000 AND `price` <= 2000;

# 실습 1-15
select `custId`, `name`, `hp`, `addr` from `Customer` where `name` like '김%';

# 실습 1-16
select `custId`, `name`, `hp`, `addr` from `Customer` where `name` like '__';

# 실습 1-17
select * from `customer` where `hp` is null;

# 실습 1-18
select * from `customer` where `addr` is not null;

# 실습 1-19
select * from `customer` order by `rdate` DESC;

# 실습 1-20
select * from `Order` where `orderCount` >= 3 order by `orderCount` DESC, `orderNo` DESC;

# 실습 1-21
select AVG(price) from `product`;

# 실습 1-22
select SUM(stock) as `재고량 합계` from `Product` where `company`='농심';

# 실습 1-23
select count(custId) as `고객수` from `customer`;

# 실습 1-24
select count(distinct company) as `제조업체 수` from `product`;

# 실습 1-25
select `orderProduct` as `주문 상품번호`, sum(`orderCount`) as `총 주문수량` from `Order` group by `orderProduct` order by `orderProduct` asc;

# 실습 1-26
select `company` as `제조업체`, count(*) as `제품수`, max(`price`) as '최고가' from `Product` group by `company` order by `company` asc;

# 실습 1-27
select `company` as `제조업체`, count(*) as `제품수`, max(`price`) as '최고가' from `Product` group by `company` having `제품수` >= 2;

# 실습 1-28
select `orderProduct`, `orderId`, SUM(`orderCount`) as `총 주문수량` from `Order` group by `orderProduct`, `orderId` order by `orderProduct` ASC;

# 실습 1-29
select a.orderId, b.prodName from `Order` as a
join `Product` as b on a.orderProduct = b.prodNo
where `orderId` = 'c102';

# 실습 1-30
select `orderId`, `name`, `prodName`, `orderDate` From `Order` As a
Join `customer` as b
on a.orderId = b.custId
join `product` as c
on a.orderProduct = c.prodNo
where DATE(`orderDate`) = '2022-07-03'; # 예제 속 orderDate 칼럼의 데이터와 현재 데이터베이스의 데이터가 서로 달라 실행 시 아무것도 검색되지 않음.