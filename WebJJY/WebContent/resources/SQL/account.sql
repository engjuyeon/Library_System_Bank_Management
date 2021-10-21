CREATE TABLE IF NOT EXISTS account (
	mid varchar(10) not null,
	acc_no int not null,
	cus_no int not null,
	bank varchar(10) not null,
	branch varchar(10),
	name varchar(20) not null,
	micr varchar(9) not null,
	ifsc varchar(11) not null,
	minum LONG,
	balance LONG,
	remark TEXT,
	primary key(cus_no)
)default CHARSET=utf8;

select * from account;
drop table account;