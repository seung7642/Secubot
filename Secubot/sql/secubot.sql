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
	process_check int not null default=0,
	trans_type int not null
) engine=InnoDB default character set=utf8;

create table secubot.article_content (
	noti_no int auto_increment primary key,
	article_no int,
	content text,
	src_ip char(16) not null,
	dst_ip char(16) not null,
	dst_port int not null,
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

create table secubot.agentlist (
	agent_no int auto_increment primary key,
	user_name varchar(20) not null,
	user_phone varchar(20) not null,
	user_ip varchar(20) not null,
	user_mac varchar(20) not null,
	agent_hash varchar(50) not null,
	api_token varchar(50) not null,
	hddid varchar(20) not null,
	login_date datetime not null
) engine=InnoDB default character set=utf8;

create table secubot.policy_process (
	policy_process_no int auto_increment primary key,
	policy_name varchar(20) not null,
	process_name varchar(20) not null
) engine=InnoDB default character set=utf8;

create table secubot.policy_network (
	policy_network_no int auto_increment primary key,
	policy_name varchar(20) not null,
	src_ip char(16) not null,
	dst_ip char(16) not null,
	port int not null
) engine=InnoDB default character set=utf8;

create table secubot.report (
	report_date datetime not null,
	count_receipt_complaint int not null,
	count_treatment_complaint int not null,
	count_detection int not null,
	count_correspond int not null
) engine=InnoDB default character set=utf8;

/* Network */
create table network_assets (
	ip varchar(100),
	mac varchar(100),
	vendor varchar(100),
	os varchar(100)
) engine=InnoDB default character set=utf8;