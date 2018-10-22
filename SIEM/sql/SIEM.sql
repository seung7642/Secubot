create database siem default character set utf8;

GRANT ALL PRIVILEGES ON siem.* TO 'user'@'localhost';
GRANT ALL PRIVILEGES ON siem.* TO 'user'@'%';

create table siem.member (
	id varchar(15) primary key,
	email varchar(50) not null,
	name varchar(20) not null,
	password varchar(15) not null,
	regdate datetime not null,
	regcode varchar(30) not null,
	regcodecheck boolean not null
) engine=InnoDB default character set=utf8;

create table siem.log (
	lognum int primary key,
	id varchar(15) not null,
	email varchar(50) not null,
	name varchar(20) not null,
	log datetime not null
) engine=InnoDB default character set=utf8;

create table siem.RuleResult (
	netType varchar(15),
	inTime datetime,
	src_ip varchar(16),
	dst_ip varchar(16)
) engine=InnoDB default character set=utf8;