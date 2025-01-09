USE `StudyDB`;

#실습 4-1
CREATE TABLE `Member`(
	`uid` VARCHAR(10) NOT NULL PRIMARY KEY,
    `name` VARCHAR(10) NOT NULL,
    `hp` CHAR(13) NOT NULL UNIQUE,
    `pos` VARCHAR(10) NOT NULL DEFAULT '사원',
    `dep` INT,
    `rdate` DATE NOT NULL
);
DESCRIBE `Member`;

INSERT INTO `Member` VALUES ('a101', '박혁거세', '010-1234-1001', '부장', '101', CURTIME());
INSERT INTO `Member` VALUES ('a102', '김유신', '010-1234-1002', '차장', '101', CURTIME());
INSERT INTO `Member` VALUES ('a103', '김춘추', '010-1234-1003', '사원', '101', CURTIME());
INSERT INTO `Member` VALUES ('a104', '장보고', '010-1234-1004', '대리', '102', CURTIME());
INSERT INTO `Member` VALUES ('a105', '강감찬', '010-1234-1005', '과장', '102', CURTIME());
INSERT INTO `Member` VALUES ('a106', '이성계', '010-1234-1006', '차장', '103', CURTIME());
INSERT INTO `Member` VALUES ('a107', '정철', '010-1234-1007', '차장', '103', CURTIME());
INSERT INTO `Member` VALUES ('a108', '이순신', '010-1234-1008', '부장', '104', CURTIME());
INSERT INTO `Member` VALUES ('a109', '허균', '010-1234-1009', '부장', '104', CURTIME());
INSERT INTO `Member` (`uid`, `name`, `hp`, `dep`, `rdate`) VALUES ('a110', '정약용', '010-1234-1010', '105', CURTIME());
INSERT INTO `Member` (`uid`, `name`, `hp`, `dep`, `rdate`) VALUES ('a111', '박지원', '010-1234-1011', '105', CURTIME());

ALTER TABLE `Member` MODIFY `rdate` DATETIME;
UPDATE `Member` SET `rdate`=NOW() WHERE `dep` > 100;

SELECT * FROM `Member`;

CREATE TABLE `Department`(
	`depNo` INT NOT NULL PRIMARY KEY,
    `name` VARCHAR(10) NOT NULL,
    `tel` CHAR(12) NOT NULL
);
DESCRIBE `Department`;

INSERT INTO `Department` VALUES (101, '영업1부', '051-512-1001');
INSERT INTO `Department` VALUES (102, '영업2부', '051-512-1002');
INSERT INTO `Department` VALUES (103, '영업3부', '051-512-1003');
INSERT INTO `Department` VALUES (104, '영업4부', '051-512-1004');
INSERT INTO `Department` VALUES (105, '영업5부', '051-512-1005');
INSERT INTO `Department` VALUES (106, '영업지원부', '051-512-1006');
INSERT INTO `Department` VALUES (107, '인사부', '051-512-1007');

SELECT * FROM `Department`;

CREATE TABLE `Sales`(
	`seq` INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `uid` VARCHAR(10) NOT NULL,
    `year` YEAR NOT NULL,
    `month` INT NOT NULL,
    `sale` INT
);
DESCRIBE `Sales`;

INSERT INTO `Sales` (`uid`, `year`, `month`, `sale`) VALUES ('a101', '2018', 1, 98100);
INSERT INTO `Sales` (`uid`, `year`, `month`, `sale`) VALUES ('a102', '2018', 1, 13600);
INSERT INTO `Sales` (`uid`, `year`, `month`, `sale`) VALUES ('a103', '2018', 1, 80100);
INSERT INTO `Sales` (`uid`, `year`, `month`, `sale`) VALUES ('a104', '2018', 1, 78000);
INSERT INTO `Sales` (`uid`, `year`, `month`, `sale`) VALUES ('a105', '2018', 1, 93000);

INSERT INTO `Sales` (`uid`, `year`, `month`, `sale`) VALUES ('a101', '2018', 2, 23500);
INSERT INTO `Sales` (`uid`, `year`, `month`, `sale`) VALUES ('a102', '2018', 2, 12600);
INSERT INTO `Sales` (`uid`, `year`, `month`, `sale`) VALUES ('a103', '2018', 2, 18500);
INSERT INTO `Sales` (`uid`, `year`, `month`, `sale`) VALUES ('a105', '2018', 2, 19000);
INSERT INTO `Sales` (`uid`, `year`, `month`, `sale`) VALUES ('a106', '2018', 2, 53000);

INSERT INTO `Sales` (`uid`, `year`, `month`, `sale`) VALUES ('a101', '2019', 1, 24000);
INSERT INTO `Sales` (`uid`, `year`, `month`, `sale`) VALUES ('a102', '2019', 1, 10900);
INSERT INTO `Sales` (`uid`, `year`, `month`, `sale`) VALUES ('a103', '2019', 1, 10100);
INSERT INTO `Sales` (`uid`, `year`, `month`, `sale`) VALUES ('a104', '2019', 1, 53500);
INSERT INTO `Sales` (`uid`, `year`, `month`, `sale`) VALUES ('a107', '2019', 1, 24000);

INSERT INTO `Sales` (`uid`, `year`, `month`, `sale`) VALUES ('a102', '2019', 2, 160000);
INSERT INTO `Sales` (`uid`, `year`, `month`, `sale`) VALUES ('a103', '2019', 2, 101000);
INSERT INTO `Sales` (`uid`, `year`, `month`, `sale`) VALUES ('a104', '2019', 2, 43000);
INSERT INTO `Sales` (`uid`, `year`, `month`, `sale`) VALUES ('a105', '2019', 2, 24000);
INSERT INTO `Sales` (`uid`, `year`, `month`, `sale`) VALUES ('a106', '2019', 2, 160000);

INSERT INTO `Sales` (`uid`, `year`, `month`, `sale`) VALUES ('a102', '2020', 1, 201000);
INSERT INTO `Sales` (`uid`, `year`, `month`, `sale`) VALUES ('a104', '2020', 1, 63000);
INSERT INTO `Sales` (`uid`, `year`, `month`, `sale`) VALUES ('a105', '2020', 1, 74000);
INSERT INTO `Sales` (`uid`, `year`, `month`, `sale`) VALUES ('a106', '2020', 1, 122000);
INSERT INTO `Sales` (`uid`, `year`, `month`, `sale`) VALUES ('a107', '2020', 1, 111000);

INSERT INTO `Sales` (`uid`, `year`, `month`, `sale`) VALUES ('a102', '2020', 2, 120000);
INSERT INTO `Sales` (`uid`, `year`, `month`, `sale`) VALUES ('a103', '2020', 2, 93000);
INSERT INTO `Sales` (`uid`, `year`, `month`, `sale`) VALUES ('a104', '2020', 2, 84000);
INSERT INTO `Sales` (`uid`, `year`, `month`, `sale`) VALUES ('a105', '2020', 2, 180000);
INSERT INTO `Sales` (`uid`, `year`, `month`, `sale`) VALUES ('a108', '2020', 2, 76000);

SELECT * FROM `Sales`;

#실습 4-3
SELECT * FROM `Member` WHERE `name`='김유신';
SELECT * FROM `Member` WHERE `pos` = '차장' AND dep=101;
SELECT * FROM `Member` WHERE `pos` = '차장' OR dep=101;
SELECT * FROM `Member` WHERE `name` != '김춘추';
SELECT * FROM `Member` WHERE `name` <> '김춘추';
SELECT * FROM `Member` WHERE `pos` = '사원' OR `pos` = '대리';
SELECT * FROM `Member` WHERE `pos` IN ('사원', '대리');
SELECT * FROM `Member` WHERE `dep` IN (101, 102, 103);
SELECT * FROM `Member` WHERE `name` like '%신';
SELECT * FROM `Member` WHERE `name` like '김%';
SELECT * FROM `Member` WHERE `name` like '김__';
SELECT * FROM `Member` WHERE `name` like '정_';
SELECT * FROM `Member` WHERE `name` like '_성_';
SELECT * FROM `Sales` WHERE `sale` > 50000;
SELECT * FROM `Sales` WHERE `sale` > 50000 AND `sale` < 100000 AND `month`=1;
SELECT * FROM `Sales` WHERE `sale` BETWEEN 50000 AND 100000;
SELECT * FROM `Sales` WHERE `year` IN(2020);
SELECT * FROM `Sales` WHERE `month` IN(1, 2);

#실습 4-4
SELECT * FROM `Sales` ORDER BY `sale`;
SELECT * FROM `Sales` ORDER BY `sale` ASC;
SELECT * FROM `Sales` ORDER BY `sale` DESC;
SELECT * FROM `Member` ORDER BY `name`;
SELECT * FROM `Member` ORDER BY `name` DESC;
SELECT * FROM `Member` ORDER BY `rdate` ASC;
SELECT * FROM `Sales` WHERE `sale` > 50000 ORDER BY `sale` DESC;
SELECT * FROM `Sales` 
WHERE `sale` > 50000 
ORDER BY `year`, `month`, `sale` DESC;

#실습 4-5
SELECT * FROM `Sales` LIMIT 3;
SELECT * FROM `Sales` LIMIT 0, 3;
SELECT * FROM `Sales` LIMIT 1, 2;
SELECT * FROM `Sales` LIMIT 5, 3;
SELECT * FROM `Sales` ORDER BY `sale` DESC LIMIT 3, 5;
SELECT * FROM `Sales` WHERE `sale` < 50000 ORDER BY `sale` DESC LIMIT 3;
SELECT * FROM `Sales` 
WHERE `sale` > 50000 
ORDER BY `year` DESC, month, `sale` DESC 
LIMIT 5;

#실습 4-6
SELECT SUM(`sale`) AS `합계` FROM `Sales`;
SELECT AVG(`sale`) AS `평균` FROM `Sales`;
SELECT MAX(`sale`) AS `최대값` FROM `Sales`;
SELECT MIN(`sale`) AS `최소값` FROM `Sales`;
SELECT CEILING(1.2);
SELECT CEILING(1.8);
SELECT FLOOR(1.2);
SELECT FLOOR(1.8);
SELECT ROUND(1.2);
SELECT ROUND(1.8);
SELECT RAND();
SELECT CEILING(RAND()*6);
SELECT COUNT(`sale`) AS `갯수` FROM `Sales`;
SELECT COUNT(*) AS `갯수` from `Sales`;
SELECT LEFT('HELLOWORLD', 5);
SELECT RIGHT('HELLOWORLD', 5);
SELECT SUBSTRING('HELLOWORLD', 6, 5);
SELECT CONCAT('HELLO', 'WORLD');

SELECT CURDATE();
SELECT CURTIME();
SELECT NOW();
INSERT INTO `Member` VALUES('a112', '유관순', '010-1234-1012', '대리', 107, NOW());

#실습 4-7; 2018년 1월 매출의 총합 구하기
SELECT SUM(`sale`) AS `총합` FROM `Sales` WHERE `year` = 2018 AND `month` = 1;

#실습 4-8; 2019년 2월에 5만원 이상 매출에 대한 총합과 평균
SELECT SUM(`sale`) AS `총합` FROM `Sales` WHERE `year` = 2019 AND `month` = 2 AND `sale` > 50000;
SELECT AVG(`sale`) AS `평균` FROM `Sales` WHERE `year` = 2019 AND `month` = 2 AND `sale` > 50000;

#실습 4-9; 2020년 전체 매출 가운데 최저, 최고 매출 구하기
SELECT MAX(`sale`) AS `최고매출`, MIN(`sale`) AS `최저매출` FROM `Sales` WHERE `year` = 2020;

#실습 4-10
SELECT @@sql_mode;

SET SESSION sql_mode = 'STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';


SELECT * FROM `Sales` GROUP BY `uid`;
SELECT * FROM `Sales` GROUP BY `year`;
SELECT * FROM `Sales` GROUP BY `uid`, `year`;
SELECT `uid`, COUNT(*) AS `건수` FROM `Sales` GROUP BY `uid`;
SELECT `uid`, SUM(`sale`) AS `합계` FROM `Sales` GROUP BY `uid`;
select `uid`, avg(`sale`) as `평균` from `Sales` group by uid;

select `uid`, `year`, sum(`sale`) as `합계` from `Sales` group by `uid`, `year`;
select `uid`, `year`, sum(`sale`) as `합계` from `Sales` group by `uid`, `year` order by `year` asc, `합계` desc;

#실습 4-11
select `uid` , sum(`sale`) as `합계` from `Sales` group by `uid` having `합계` >= 200000;
select `uid`, `year`, sum(`sale`) as `합계` 
from `Sales` 
where `sale` >= 100000 
group by `uid`, `year` 
having `합계` >= 200000 
order by `합계` desc;

#실습 4-12
create table `Sales2` like `Sales`;
insert into `Sales2` select * from `Sales`;
set sql_safe_updates = 0;
update `Sales2` set `year` = `year` + 3;

select * from `Sales2`;

select * from `Sales`
union
select * from `Sales2`;

select * from `Sales` where `sale` >= 100000
union
select * from `Sales2` where `sale` >= 100000;

select `uid`, `year`, `sale` from `Sales`
union
select `uid`, `year`, `sale` from `Sales2`;

select `uid`, `year`, sum(`sale`) as `합계`
from `Sales`
group by `uid`, `year`
union
select `uid`, `year`, sum(`sale`) as `합계`
from `Sales2`
group by `uid`, `year`
order by `year` asc, `합계` desc;
;

#실습 4-12
SELECT * FROM `Sales` INNER JOIN `Member` ON `Sales`.`uid` = `Member`.`uid`;

SELECT * FROM `Member` AS a
JOIN `Department` AS b
ON a.dep = b.depNo;

#실습 4-13
SELECT * FROM `Sales` AS a
JOIN `Member` AS b 
USING(`uid`);

SELECT * FROM `Sales` AS a
JOIN `Member` AS b on a.uid = b.uid
JOIN `Department` as c on b.dep = c.depNo;

#실습 4-14
INSERT INTO `Sales` (`uid`, `year`, `month`, `sale`) VALUES ('a201', 2020, 2, 15500);
SELECT * FROM `Sales` as a
RIGHT JOIN `Member` as b on a.uid = b.uid;

SELECT * FROM `Sales` as a
LEFT JOIN `Member` as b on a.uid = b.uid;

#실습 4-15
/*(`Member` as a JOIN `Department` as b ON a.dep = b.depNo)의 결과값에서 SELECT a.uid, a.name, a.pos, b.name을 추출.*/
SELECT a.uid, a.name, a.pos, b.name FROM `Member` as a
JOIN `Department` as b on a.dep = b.depNo; 

#실습 4-16
SELECT 
	SUM(`sale`) as `김유신 2019 매출` 
FROM `sales` as a join `member` as b 
on a.uid = b.uid
where `name` = '김유신' AND 
`year` = 2019;

#실습 4-17
SELECT 
	SUM(`sale`) AS `매출합`, 
	b.`name`, 
	c.`name`, 
	a.`year` 
FROM `Sales` AS a 
JOIN `Member` AS b ON a.`uid` = b.`uid`
JOIN `Department` AS c ON b.`dep` = c.`depNo` 
WHERE `sale` > 50000 AND `year` = 2019
GROUP BY a.`uid`
HAVING `매출합` >= 100000
ORDER BY `매출합` DESC;

#실습 4-17-1: 
SELECT 
    b.name,
    c.name,
    a.year,
    SUM(`sale`) as "매출합"
FROM `Sales` as a 
join `Member` as b on a.uid = b.uid 
join `Department` as c on b.dep = c.depNo
where year = 2018 
group by a.uid
order by `sale` ASC
;