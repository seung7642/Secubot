create database secubot default character set utf8;

grant all privilieges on *.* to 'secubot'@'localhost';
grant all privilieges on *.* to 'secubot'@'%';

create table secubot.member (
	memberid varchar(15) primary key,
	name varchar(15) not null,
	password varchar(20) not null,
	regdate datetime not null
) engine=InnoDB default character set=utf8;

create table secubot.article (
	article_no int auto_increment primary key,
	writer_id varchar(15) not null,
	writer_name varchar(15) not null,
	title varchar(255) not null,
	regdate datetime not null,
	moddate datetime not null,
	read_cnt int
) engine=InnoDB default character set=utf8;

create table secubot.article_content (
	article_no int primary key,
	content text
) engine=InnoDB default character set=utf8;