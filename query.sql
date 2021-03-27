
Create database infomoney;

create table values_cotation(
id int primary key auto_increment,
code varchar(255),
name varchar(255),
price varchar(255),
buying varchar(255),
selling varchar(255),
variation_low varchar(255),
variation_high varchar(255)
);

create table user(
id int primary key auto_increment,
name varchar(255),
email varchar(255),
password varchar(255)
);

create table wallet(
id int primary key auto_increment,
amount float,
user_id int,
foreign key (user_id) references user(id)
);

create table values_cotation_user(
id int primary key auto_increment,
user_id int,
foreign key (user_id) references user(id),
values_cotation_id int,
foreign key (values_cotation_id) references values_cotation(id), 
amount float,
date date
);
use infomoney;
alter table values_cotation drop column cotation_id;

select * from values_cotation;
select * from values_cotation_user;


create table Moedas(
id int primary key auto_increment,
code VARCHAR(255),
codein VARCHAR(255),
name VARCHAR(255),
high float,
low float,
varBid float,
ask float,
pctChange float,
bid float,
timestamp int,
create_date VARCHAR(255)	
);

select * from Moedas where codein = "BRLT";

SELECT * FROM MOEDAS;
