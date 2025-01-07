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

INSERT INTO `User3` VALUES ('A101','김유신','1990-01-01','010-1001-1001','김해');
INSERT INTO `User3` VALUES ('A102','김춘추','1991-01-01','010-1001-1002','경주');
INSERT INTO `User3` VALUES ('A103','장보고','1992-01-01','010-1001-1003','완도');
INSERT INTO `User3` VALUES ('A104','강감찬','1993-01-01', NULL,'서울');
INSERT INTO `User3` VALUES ('A105','이순신','1994-01-01', NULL,'부산');
SELECT * FROM `User3`;

#실습 3-4
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