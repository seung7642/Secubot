create database secubot default character set utf8;

grant all privilieges on *.* to 'secubot'@'localhost';
grant all privilieges on *.* to 'secubot'@'%';

create table secubot.member (
	memberid varchar(15) primary key,
	name varchar(15) not null,
	password varchar(20) not null,
	regdate datetime not null
) engine=InnoDB default character set=utf8;

create table secubot.log (
	lognum int auto_increment primary key,
	id varchar(15) not null,
	email varchar(50) not null,
	name varchar(20) not null,
	log datetime not null
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
	noti_no int auto_increment primary key,
	article_no int,
	content text,
	foreign key(article_no)
	references article(article_no) on update cascade
) engine=InnoDB default character set=utf8;

create table secubot.mynoti (
	noti_no int auto_increment primary key,
	article_no int,
	read_check tinyint(1) not null default 0,
	regdate datetime not null,
	writer_id varchar(20) not null,
	writer_name varchar(20) not null,
	foreign key(article_no)
	references article(article_no) on update cascade
) engine=InnoDB default character set=utf8;

create table secubot.count_of_correspond (
	total_correspond int not null,
	today_correspond int not null
) engine=InnoDB default character set=utf8;

create table secubot.policy_process (
	process_name varchar(20) primary key,
	process_hash varchar(50) not null,
	process_kill tinyint(1) not null default 0
) engine=InnoDB default character set=utf8;

create table secubot.policy_network (
	src_ip char(16) not null,
	dst_ip char(16) not null,
	port int not null
) engine=InnoDB default character set=utf8;