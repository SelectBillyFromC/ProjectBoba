insert into flavor
values(1, 'Green Tea');
insert into flavor
values(2, 'Taro Tea');
insert into flavor
values(3, 'Lemon Tea');
insert into flavor
values(4, 'Black Tea');

insert into topping
values(1, 'Boba');
insert into topping
values(2, 'Pearl');
insert into topping
values(3, 'Jelly');

insert into customer
values(1,'150 RiverWay','100','Boston','MA', 01215, '9493399898', 'Green Tea');
insert into customer
values(2,'150 RiverWay','100','Boston','MA', 02225, '9493399238', 'Milk Tea');
insert into customer
values(3,'150 RiverWay','100','Boston','MA', 02215, '9494322898', 'Chocolate Milk Tea');
insert into customer
values(4,'150 RiverWay','100','Boston','MA', 02213, '9493399111', 'Almond Milk Tea');
insert into customer
values(5,'150 RiverWay','100','Boston','MA', 02216, '9493323415', 'Mocha Milk Tea');

insert into bobatea
values(1,1,1,'GreenTea Boba',3.99);
insert into bobatea
values(2,1,2,'Taro Boba',3.99);
insert into bobatea
values(3,2,2,'Taro Pearl',3.99);
insert into bobatea
values(4,1,3,'Lemon Boba',3.99);
insert into bobatea
values(5,3,4,'Black Jelly',3.99);

insert into transactions
values(1,1, 3.99);
insert into transactions
values(2,2, 4.99);
insert into transactions
values(3,3, 3.99);
insert into transactions
values(4,4, 3.99);
insert into transactions
values(5,5, 4.99);


insert into shop
values(101,'300 Arroyo Drive','101','Irvine','CA', 92617, '9493009898');
insert into shop
values(102,'400 Arroyo Drive','101','Irvine','CA', 92617, '9493009898');
insert into shop
values(103,'500 Arroyo Drive','101','Boston','MA', 92617, '9493009898');
insert into shop
values(104, '600 Arroyo Drive','101','Boston','MA', 92617, '9493009898');
insert into shop
values(105,'700 Arroyo Drive','101','Boston','MA', 92617, '9493009898');


insert into inventory
values(1, 101, 100);
insert into inventory
values(2, 102, 93);
insert into inventory
values(3, 103, 90);
insert into inventory
values(4 ,104, 80);
insert into inventory
values(5 ,105, 98);

insert into staff_emp
values(1001,23,'300 Arroyo Drive','101','Irvine','CA', 92617, '9493009898','Employee', 15, 101);
insert into staff_emp
values(1002,24,'400 Arroyo Drive','102','Boston','MA', 02215, '9493009898','Employee', 20, 102);
insert into staff_emp
values(1003,25,'600 Arroyo Drive','103','Irvine','CA', 92617, '9493009898','Manager', 15, 103);
insert into staff_emp
values(1004,25,'800 Arroyo Drive','104','Boston','MA', 02215, '9493009898','Employee', 20, 104);
insert into staff_emp
values(1005,23,'900 Arroyo Drive','105','Irvine','CA', 92617, '9493009898','Employee', 15, 105);


insert into staff_mgr
values(103,25,'600 Arroyo Drive','103','Irvine','CA', 92617, '9493009898','Manager', 25, 103);
insert into staff_mgr
values(104,26,'600 Arroyo Drive','103','Irvine','CA', 92617, '9493009898','Manager', 25, 103);

insert into ingredient
values(201,'Green Tea Ingredient',2);
insert into ingredient
values(202,'Milk Tea Ingredient',2);
insert into ingredient
values(203,'Chocolate Tea Ingredient',2);
insert into ingredient
values(204,'Almond Tea Ingredient',2);
insert into ingredient
values(205,'Mocha Tea Ingredient',2);

insert into inv_ing
values(201,1);
insert into inv_ing
values(204,1);
insert into inv_ing
values(202,1);
insert into inv_ing
values(203,2);
insert into inv_ing
values(201,2);

insert into cust_trans
values(1,1);
insert into cust_trans
values(1,2);
insert into cust_trans
values(2,3);
insert into cust_trans
values(3,4);
insert into cust_trans
values(4,5);

insert into shop_trans
values(101,1);
insert into shop_trans
values(102,2);
insert into shop_trans
values(103,3);
insert into shop_trans
values(103,4);
insert into shop_trans
values(104,5);

insert into shop_boba
values(101, 1);
insert into shop_boba
values(101, 2);
insert into shop_boba
values(102, 1);
insert into shop_boba
values(103, 2);
insert into shop_boba
values(103, 3);
insert into shop_boba
values(103, 5);




