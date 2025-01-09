#날짜: 2025/01/09
#이름: 이현민
#내용: 5장 데이터베이스 개체

#실습 5-1
SHOW INDEX FROM `User1`;
SHOW INDEX FROM `User2`;
SHOW INDEX FROM `User3`;

#실습 5-2
CREATE INDEX `idx_user1_uid` ON `User1` (`uid`);
SHOW INDEX FROM `User1`;

#실습 5-3
DROP INDEX `idx_user1_uid` ON `User1`;

#실습 5-4
CREATE VIEW `vw_user1` AS (SELECT `name`, `hp`, `age` FROM `User1`);
CREATE VIEW `vw_user4_age_under30` AS (SELECT * FROM `User4` WHERE `age` > 30);
CREATE VIEW `vw_member_with_sales` AS (
	SELECT
		a.`uid` AS `직원아이디`,
        b.`name` AS `직원이름`,
        b.`pos` AS `직급`,
        c.`name` AS `부서명`,
        a.`year` AS `매출년도`,
        a.`month` AS `월`,
        a.`sale` AS `매출액`
	FROM `Sales` AS a
    JOIN `Member` AS b ON a.uid = b.uid
    JOIN `Department` AS C ON b.dep = c.depNo
);

#실습 5-5
SELECT * FROM `vw_user1`;
SELECT * FROM `vw_user4_age_under30`;
SELECT * FROM `vw_member_with_sales`;

#실습 5-6
DROP VIEW `vw_user1`;
DROP VIEW `vw_user4_age_under30`;
DROP VIEW `vw_member_with_sales`;

#실습 5-7
DELIMITER $$
	CREATE PROCEDURE proc_test1()
    BEGIN
		SELECT * FROM `Member`;
        SELECT * FROM `Department`;
	END $$
DELIMITER ;

CALL proc_test1();

# 실습 5-8
DELIMITER $$
	CREATE PROCEDURE proc_test2(IN _userName VARCHAR(10))
    BEGIN
		SELECT * FROM `Member` WHERE `name` = _userName;
    END $$
DELIMITER ;

CALL proc_test2('김유신');

DELIMITER $$
	CREATE PROCEDURE proc_test3(IN _pos VARCHAR(10), IN _dep TINYINT)
    BEGIN
		SELECT * FROM `Member` WHERE `pos`=_pos AND `dep` = _dep;
    END $$
DELIMITER ;

CALL proc_test3('차장', 101);

DELIMITER $$
	CREATE PROCEDURE proc_test4(IN _pos VARCHAR(10), OUT _count INT)
    BEGIN 
		SELECT count(*) INTO _count FROM `Member` WHERE `pos` = _pos;
    END $$
DELIMITER ;

CALL proc_test4('대리', @_count);
SELECT CONCAT('_count: ', @_count);

#실습 5-9
DELIMITER $$
	CREATE PROCEDURE proc_test5(IN _name VARCHAR(10))
    BEGIN
		DECLARE userId VARCHAR(10);
        SELECT `uid` INTO userId FROM `Member` WHERE `name` = _name;
        SELECT * FROM `Sales` WHERE `uid`=userId;
    END $$
DELIMITER ;

CALL proc_test5('김유신');

DELIMITER $$
 CREATE PROCEDURE proc_test6()
 BEGIN
	DECLARE num1 INT;
    DECLARE num2 INT;
    
    SET num1 = 1;
    SET num2 = 2;
    
    IF (NUM1 > NUM2) THEN
		SELECT 'NUM1 is greater than NUM2' as `result2`;
	ELSE
		SELECT 'NUM1 is lesser than NUM2' as `result2`;
	END IF;
 END $$
DELIMITER ;

CALL proc_test6();