#실습3-1
create database `College`;
create user 'college'@'%' identified by '1234';
grant all privileges on `College`.* to 'college'@'%';
flush privileges;

use college;

#실습3-2
create table `Student`(
	stdNo char(8) primary key not null,
    stdName varchar(20) not null,
    stdHp char(13) unique not null,
    stdYear int not null,
    stdAddress varchar(100) null
);

create table `Lecture`(
	lecNo int primary key not null,
    lecName varchar(20) not null,
    lecCredit int not null,
    lecTime int not null,
    lecCalss varchar(10) null
);

create table `Register`(
	regStdNo char(8) not null,
    regLecNo int not null,
    regMidScore int null,
    regFinalScore int null,
    regTotalScore int null,
    regGrade char(1) null
);
describe student;
describe lecture;
describe register;

#실습3-3
insert into student values ("20201016", "김유신", "010-1234-1001", 3, null);
insert into student values ("20201126", "김춘추", "010-1234-1002", 3, "경상남도 경주시");
insert into student values ("20210216", "장보고", "010-1234-1003", 2, "전라남도 완도시");
insert into student values ("20210326", "강감찬", "010-1234-1004", 2, "서울시 영등포구");
insert into student values ("20220416", "이순신", "010-1234-1005", 1, "부산시 부산진구");
insert into student values ("20220521", "송상현", "010-1234-1006", 1, "부산시 동래구");

insert into lecture values (159, "인지행동심리학", 3, 40, "본304");
insert into lecture values (167, "운영체제론", 3, 25, "본805");
insert into lecture values (234, "중급 영문법", 3, 20, "본201");
insert into lecture values (239, "세법개론", 3, 40, "본204");
insert into lecture values (248, "빅데이터 개론", 3, 20, "본801");
insert into lecture values (253, "컴퓨팅사고와 코딩", 2, 10, "본802");
insert into lecture values (349, "사회복지 마케팅", 2, 50, "본301");

insert into register set regStdNo = "20201126", regLecNo = 234;
insert into register set regStdNo = "20201016", regLecNo = 248;
insert into register set regStdNo = "20201016", regLecNo = 253;
insert into register set regStdNo = "20201126", regLecNo = 239;
insert into register set regStdNo = "20210216", regLecNo = 349;
insert into register set regStdNo = "20210326", regLecNo = 349;
insert into register set regStdNo = "20201016", regLecNo = 167;
insert into register set regStdNo = "20220416", regLecNo = 349;


#실습3-4
select * from lecture;

#실습3-5
select * from student;

#실습3-6
select * from register;

#실습3-7
select * from student where stdYear = 3;

#실습3-8
select * from lecture where lecCredit = 2;

#실습3-9
set sql_safe_updates = 0;
update register set regMidScore=36, `regFinalScore`=42 where regStdNo='20201126' and regLecNo=234;
update register set regMidScore=24, `regFinalScore`=62 where regStdNo='20201016' and regLecNo=248;
update register set regMidScore=28, `regFinalScore`=40 where regStdNo='20201016' and regLecNo=253;
update register set regMidScore=37, `regFinalScore`=57 where regStdNo='20201126' and regLecNo=239;
update register set regMidScore=28, `regFinalScore`=68 where regStdNo='20210216' and regLecNo=349;
update register set regMidScore=16, `regFinalScore`=65 where regStdNo='20210326' and regLecNo=349;
update register set regMidScore=18, `regFinalScore`=38 where regStdNo='20201016' and regLecNo=167;
update register set regMidScore=25, `regFinalScore`=58 where regStdNo='20220416' and regLecNo=349;
select * from register;

#실습3-10
update register set regTotalScore = regMidScore + regFinalScore, 
regGrade = if(regTotalScore >= 90, 'A',
		   if(regTotalScore >= 80, 'B',
           if(regTotalScore >= 70, 'C',
           if(regTotalScore >= 60, 'D', 'F'))));
select * from register;

#실습3-11
select * from register order by regGrade asc;

#실습3-12
select * from register where regLecNo=349 order by regTotalScore desc;

#실습3-13
select * from lecture where lecTime >= 30;

#실습3-14
select lecName, lecClass from lecture;

#실습3-15
select stdNo, stdName from student;

#실습3-16
select * from student where stdAddress is Null;

#실습3-17
select * from student where stdAddress like "부산시 %";

#실습3-18
select * from student as a left join register as b on a.stdNo = b.regStdNo;

#실습3-19
select
	stdNo,
    stdName,
    regLecNo,
    regMidScore,
    regFinalScore,
    regTotalScore,
    regGrade
from student as a, register as b where a.stdNo = b.regStdno;

#실습3-20
select stdName, stdNo, regLecNo
from student as a
join register as b
on a.stdNo = b. regStdNo
where regLecNo = 349;

#실습3-21
select
	stdNo,
    stdName,
    count(stdNo) as `수강신청 건수`,
    sum(regTotalScore) as `종합점수`,
    sum(regTotalScore) / count(stdNo) as `평균`
from student as a
join register as b
on a.stdNo = b.regStdNo
group by stdNo
;

#실습3-22
select * from register as a
join lecture as b 
on a.regLecNo = b.lecNo;

#실습3-23
select 
	regStdNo,
    regLecNo,
    lecName,
    regMidScore,
    regFinalScore,
    regTotalScore,
    regGrade
from register as a 
join lecture as b 
on a.regLecNo=b.lecNo;

#실습3-24
select
	count(*) as `사회복지 마케팅 수강신청건수`,
    avg(regTotalScore) as `사회복지 마케팅 평균`
from register as a 
join lecture as b 
on a.regLecNo = b.lecNo
where lecNo = 349;

#실습3-25
select 
	regStdNo,
    lecName
from register as a 
join lecture as b 
on a.regLecNo = b.lecNo
where regGrade='A';

#실습3-26
select * from student as a
join register as b on a.stdNo = b.regStdNo
join lecture as c on b.regLecNo = c.lecNo;

#실습3-27
select 
	stdNo,
    stdName,
    lecNo,
    lecName,
    regMidScore,
    regFinalScore,
    regTotalScore,
    regGrade
from student as a
join register as b on a.stdNo = b.regStdNo
join lecture as c on b.regLecNo = c.lecNo;

#실습3-28
select 
	stdNo,
	stdName,
    lecName,
    regTotalScore,
    regGrade
from student as a
join register as b on a.stdNo = b.regStdNo
join lecture as c on b.regLecNo = c.lecNo
where regGrade='F';

#실습3-29
select 
	stdNo,
    stdName,
    sum(lecCredit) as `이수학점`
from student as a
join register as b on a.stdNo = b.regStdNo
join lecture as c on b.regLecNo = c.lecNo
where regGrade != 'F'
group by stdNo
;

#실습3-30
select
	stdNo,
    stdName,
    group_concat(lecName) as `신청과목`,
    group_concat(if(regTotalScore >= 60, lecName, null)) as `이수과목`
from student as a
join register as b on a.stdNo = b.regStdNo
join lecture as c on b.regLecNo = c.lecNo
group by b.regStdNo
;

