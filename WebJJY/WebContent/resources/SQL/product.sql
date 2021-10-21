CREATE TABLE IF NOT EXISTS product(
	b_id VARCHAR(10) NOT NULL,
	b_name VARCHAR(20),
	b_description TEXT,
   	b_author VARCHAR(20),
	b_publisher VARCHAR(20),
	b_unitsInStock LONG,
	b_condition VARCHAR(20),
	b_fileName VARCHAR(20),
	PRIMARY KEY (b_id)
)default CHARSET=utf8;

desc product;