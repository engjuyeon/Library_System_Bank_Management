CREATE TABLE IF NOT EXISTS banklist (
	num int not null auto_increment,
	account int not null,
	acc_type varchar(20) not null,
	acc_date varchar(50) not null,
	ramark TEXT,
	balance int not null,
	primary key(num)
)default CHARSET=utf8;

select * from account;
drop table banklist;


INSERT INTO banklist VALUES(0, 2342346, 'deposit', '2021-06-13', 'memo', 50000);
