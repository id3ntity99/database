#날짜 : 2025/01/06
#이름 : 이현민
#내용 : 1장 데이터베이스 설치와 생성

#실습 1-1
CREATE DATABASE `StudyDB`;
DROP DATABASE `StudyDB`;

#실습 1-2
CREATE USER `id3ntity99`@`%` IDENTIFIED BY `1234`;
GRANT ALL PRIVILEGES ON StudyDB.* TO `id3ntity99`@`%`;
FLUSH PRIVILEGES;

# 실습 1-3
ALTER USER `id3ntity99`@`%` IDENTIFIED BY 'abc1234';
DROP USER `id3ntity99`@`%`;
FLUSH PRIVILEGES;

