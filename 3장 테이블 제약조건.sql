#날짜: 2025/01/07
#이름: 이현민
#내용: 3장 테이블 제약조건

#실습 3-1
USE `StudyDB`;
CREATE TABLE `User2`(
	`uid` VARCHAR(10) PRIMARY KEY, 
    `name` VARCHAR(10),
    `birth` CHAR(10),
    `addr` VARCHAR(50)
);
DESCRIBE `User2`;

#실습 3-2
INSERT INTO `User2` VALUES ('A101', '김유신', '1990-02-03', '김해');
INSERT INTO `User2` VALUES ('A102', '김춘추', '1991-02-03', '경주');
INSERT INTO `User2` VALUES ('A103', '장보고', '1992-02-03', '완도');
SELECT * FROM `User2`;

#실습 3-3
CREATE TABLE `User3` (
	`uid` VARCHAR(10) PRIMARY KEY,
    `name` VARCHAR(10),
    `birth` CHAR(10),
    `hp` CHAR(13) UNIQUE,
    `addr` VARCHAR(50)
);
DESCRIBE `User3`;

#실습 3-4
INSERT INTO `User3` VALUES ('A101','김유신','1990-01-01','010-1001-1001','김해');
INSERT INTO `User3` VALUES ('A102','김춘추','1991-01-01','010-1001-1002','경주');
INSERT INTO `User3` VALUES ('A103','장보고','1992-01-01','010-1001-1003','완도');
INSERT INTO `User3` VALUES ('A104','강감찬','1993-01-01', NULL,'서울');
INSERT INTO `User3` VALUES ('A105','이순신','1994-01-01', NULL,'부산');
SELECT * FROM `User3`;

#실습 3-5
CREATE TABLE `Parent` (
	`pid` VARCHAR(10) PRIMARY KEY,
    `name` VARCHAR(10),
    `birth` CHAR(10),
    `addr` VARCHAR(100)
);
DESCRIBE `Parent`;

CREATE TABLE `Child` (
	`cid` VARCHAR(10) PRIMARY KEY,
    `name` VARCHAR(10),
    `hp` CHAR(13) UNIQUE,
    `parent` VARCHAR(10),
    FOREIGN KEY (`parent`) REFERENCES `Parent` (`pid`)
);
DESCRIBE `Child`;

#실습 3-6
INSERT INTO `Parent` VALUES ("P101", "김유신", "1968-05-09", "경남 김해시");
INSERT INTO `Parent` VALUES ("P102", "김춘추", "1972-11-23", "경남 경주시");
INSERT INTO `Parent` VALUES ("P103", "장보고", "1978-03-01", "전남 완도시");
INSERT INTO `Parent` VALUES ("P104", "강감찬", "1979-08-16", "서울시 관악구");
INSERT INTO `Parent` VALUES ("P105", "이순신", "1981-05-23", "부산시 진구");

SELECT * FROM `Parent`;

INSERT INTO `Child` VALUES ("C101", "김철수", "010-1234-1001", "P101");
INSERT INTO `Child` VALUES ("C102", "김영희", "010-1234-1002", "P101");
INSERT INTO `Child` VALUES ("C103", "장철수", "010-1234-1003", "P103");
INSERT INTO `Child` VALUES ("C104", "이철수", "010-1234-1004", "P105");
# This statement will not execute, because there is no such record with uid of "P109"
# INSERT INTO `Child` VALUES ("C105", "이철수", "010-1234-1004", "P109");

SELECT * FROM `Child`;

#실습 3-7
CREATE TABLE `User4`(
	`uid` VARCHAR(10) PRIMARY KEY,
    `name` VARCHAR(10) NOT NULL,
    `gender` CHAR(1),
    `age` INT DEFAULT 1,
    `hp` CHAR(13) UNIQUE,
    `addr` VARCHAR(20)
);
DESCRIBE TABLE `User4`;

#실습 3-8
INSERT INTO `User4` VALUES ("A101", "김유신", "M", 21, "010-1234-0001", "김해");
INSERT INTO `User4` VALUES ("A102", "김춘추", "M", 20, "010-1234-0002", "경주");
INSERT INTO `User4` VALUES ("A103", "장보고", "M", 31, "010-1234-0003", "완도");
INSERT INTO `User4` SET `uid`="A104", `name`="신사임당",`gender`="F", `addr`="강릉";
# This statement will not execute, because the name column, which does not allow NULL, is NULL
# INSERT INTO `User4` SET `uid`="A104", `gender`="F", `hp`="010-1234-0004", `addr`="강릉";

SELECT * FROM `User4`;

#실습 3-9
CREATE TABLE `User5`(
	`seq`    INT AUTO_INCREMENT PRIMARY KEY, #AUTO_INCREMENT is used when there are no columns to be used as a primary key such as uid, pid...
	`name`   VARCHAR(10) NOT NULL,
    `gender` CHAR(1) CHECK (`gender` IN ('M', 'F')),
    `age`    INT DEFAULT 1 CHECK (`age` > 0 AND `age` < 100),
    `addr`   VARCHAR(20)
);
DESCRIBE `User5`;

#실습 3-10
INSERT INTO `User5` (`name`, `gender`, `age`, `addr`) VALUES ('김유신', 'M', '25', '김해');
INSERT INTO `User5` (`name`, `gender`, `age`, `addr`) VALUES ('김춘추', 'M', '24', '경주');
INSERT INTO `User5` (`name`, `gender`, `age`, `addr`) VALUES ('장보고', 'M', '35', '완도');
# This statement will not execute, because the age column, which does not allow negative integer value, is set to be negative.
# INSERT INTO `User5` (`name`, `gender`, `age`, `addr`) VALUES ('허난설헌', 'F', '-1', '광주');
# This statement will not execute too, because the gender column, which only accept either "M" or "F", is set to a "Z".
# INSERT INTO `User5` (`name`, `gender`, `age`, `addr`) VALUES ('신사임당', 'Z', '25', '강릉');
SELECT * FROM `User5`;
