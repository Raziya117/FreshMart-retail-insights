-- FreshMart Retail Insight System

Create table Categories(
        catg_id int primary key,
        catg_name varchar(50)
    );


create table Products(
        prod_id int primary key,
        prod_name varchar(50),
        catg_id int,
        foreign key(catg_id) references Categories(catg_id),
        price number(10,2),
        stock_cnt int,
        expiry_date date
    );

create table SalesTransactions(
        trans_id int primary key,
        prod_id int,
        foreign key(prod_id) references Products(prod_id),
        quantity number,
        trans_date date
    );
    
insert into Categories values(1,'Vegetables');
insert into Categories values(2,'Fruits');
insert into Categories values(3,'Dairy');
insert into Categories values(4,'Bakery');
insert into Categories values(5,'Snacks');
insert into Categories values(6,'Beverages');

select * from Categories;

insert into Products values(101,'Milk',3,50,100,SYSDATE+5);
insert into Products values(102,'Chips',5,20,200,SYSDATE+10);
insert into Products values(103,'Biscuits',5,30,80,SYSDATE+120);
insert into Products values(104,'Cheese',3,200,30,SYSDATE+10);
insert into Products values(105,'Potato',1,20,180,SYSDATE+20);
insert into Products values(106,'Tomato',1,15,120,SYSDATE+3);
insert into Products values(107,'Butter',3,120,40,SYSDATE+6);
insert into Products values(108,'Chocolate',5,50,110,SYSDATE+180);
insert into Products values(109,'Bread',4,25,70,SYSDATE+2);
insert into Products values(110,'Soft Drink',6,40,90,SYSDATE+60);
insert into Products values(111,'Apple',2,10,150,SYSDATE+2);
insert into Products values(112,'Ice cream',3,150,35,SYSDATE+25);
insert into Products values(113,'Green Tea',6,70,40,sysdate+90);
insert into Products values(114,'Paneer',3,250,25,sysdate+15);

select * from Products;

insert into SalesTransactions values(1,101,10,sysdate-2);
insert into SalesTransactions values(2,103,20,sysdate-10);
insert into SalesTransactions values(3,105,15,sysdate-5);
insert into SalesTransactions values(4,102,5,sysdate-20);
insert into SalesTransactions values(5,106,2,sysdate-40);
insert into SalesTransactions values(6,104,25,sysdate-1);
insert into SalesTransactions values(7,105,18,sysdate-12);
insert into SalesTransactions values(8,108,30,sysdate-22);
insert into SalesTransactions values(9,107,50,sysdate-15);
insert into SalesTransactions values(10,109,15,sysdate-9);
insert into SalesTransactions values(11,109,20,sysdate-7);
insert into SalesTransactions values(12,111,15,sysdate-6);
insert into SalesTransactions values(13,102,33,sysdate-18);
insert into SalesTransactions values(14,103,12,sysdate-30);
insert into SalesTransactions values(15,106,19,sysdate-4);
insert into SalesTransactions values(16,110,11,sysdate-3);
insert into SalesTransactions values(17,112,10,sysdate-2);
insert into SalesTransactions values(18,110,20,sysdate-10);

select * from SalesTransactions;

--Total prodcuts
select count(*) as total_products from Products;

--Total stock available
select sum(stock_cnt)as Total_stock from Products;

-- products available for each category
select catg_id,count(*) as total_products from products
group by catg_id;

--products which never sold
select prod_name from products where prod_id not in(
   select prod_id from SalesTransactions
);

--sales happened in last 7 days
select * from SalesTransactions where trans_date>=sysdate-7;

--1.Expiring soon products
select prod_name,stock_cnt,expiry_date from products
where expiry_date<=sysdate+7 and stock_cnt>50;

--2.Dead stock analysis
select p.prod_id,p.prod_name from products p 
left join SalesTransactions s on p.prod_id=s.prod_id
and s.trans_date>=sysdate-60
where s.prod_id is null;

--3.Revenue contribution
select c.catg_name,sum(p.price*s.quantity) as Total_revenue
from SalesTransactions s
join Products p on s.prod_id=p.prod_id
join Categories c on p.catg_id=c.catg_id
group by c.catg_name
order by Total_revenue desc;




    
