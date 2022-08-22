CREATE DATABASE qlbh
GO

USE qlbh
GO

CREATE TABLE Users 
(
	id int IDENTITY(1,1) PRIMARY KEY,
	first_name nvarchar(10) NOT NULL,
	last_name nvarchar(50) NOT NULL,
	phone nchar(10),
	user_address nvarchar(100),
	username nvarchar(50) NOT NULL,
	pwd nvarchar(100) NOT NULL,
	user_role nchar(5)
)
GO

CREATE TABLE Category 
(
	id int IDENTITY(1,1) PRIMARY KEY,
	name nvarchar(50) NOT NULL,
)
GO

CREATE TABLE Product 
(
	id int IDENTITY(1,1) PRIMARY KEY,
	name nvarchar(50) NOT NULL,
	supplier nvarchar(50) NOT NULL,
	descriptions nvarchar(100),
	price decimal(10, 0),
	images nvarchar(200),
	on_sale bit,
	categoryId int NOT NULL FOREIGN KEY (categoryId) REFERENCES Category(id)
)
GO

CREATE TABLE Orders 
(
	id int IDENTITY(1,1) PRIMARY KEY,
	created_date datetime NOT NULL,
	delivery_date datetime NOT NULL,
	total decimal(10, 0),
	userId int NOT NULL FOREIGN KEY (userId) REFERENCES Users(id)
)
GO

CREATE TABLE Orders_Detail 
(
	id int IDENTITY(1,1) PRIMARY KEY,
	orderId int NOT NULL FOREIGN KEY (orderId) REFERENCES Orders(id),
	productId int NOT NULL FOREIGN KEY (productId) REFERENCES Product(id),
	amount int NOT NULL,
	unit_price decimal(10, 0) NOT NULL,
	active bit NOT NULL,
)
GO

insert into Category values (N'CPU')
insert into Category values (N'VGA')
insert into Category values (N'Main')
insert into Category values (N'Ram')
insert into Category values (N'Rom')
insert into Category values (N'PSU')

insert into Product values (N'Intel 12th Core I9', N'Intel', null, 19000000, null, 1, 1)
insert into Product values (N'Intel 11th Core I5', N'Intel', null, 4500000, null, 1, 1)
insert into Product values (N'Intel 10th Core I3', N'Intel', null, 3000000, null, 1, 1)
insert into Product values (N'AMD Ryzen 3 3200G', N'AMD', null, 2500000, null, 1, 1)
insert into Product values (N'AMD Ryzen 5 5600G', N'AMD', null, 5000000, null, 1, 1)
insert into Product values (N'RTX 3070', N'Nvidia ', null, 15000000, null, 1, 2)
insert into Product values (N'RTX 3080', N'Nvidia ', null, 29000000, null, 1, 2)
insert into Product values (N'RTX 3090', N'Nvidia ', null, 44000000, null, 1, 2)
insert into Product values (N'GIGABYTE Radeon', N'AMD ', null, 10000000, null, 1, 2)
insert into Product values (N'ASUS Dual Radeon', N'AMD ', null, 6500000, null, 1, 2)
insert into Product values (N'MSI PRO H610M-B DDR4', N'Intel', null, 2300000, null, 1, 3)
insert into Product values (N'MSI MAG B660M MORTAR DDR4', N'Intel', null, 4000000, null, 1, 3)
insert into Product values (N'ASUS Prime TRX40 -Pro', N'AMD', null, 13000000, null, 1, 3)
insert into Product values (N'8GB DDR4', N'Kingston', null, 1000000, null, 1, 4)
insert into Product values (N'16GB DDR4', N'Kingston', null, 2500000, null, 1, 4)
insert into Product values (N'8GB LED DDR4', N'Corsair', null, 1300000, null, 1, 4)
insert into Product values (N'SSD 120GB', N'Kingston', null, 700000, null, 1, 5)
insert into Product values (N'SSD 240GB', N'Kingston', null, 850000, null, 1, 5)
insert into Product values (N'SSD 480GB', N'Kingston', null, 1600000, null, 1, 5)
insert into Product values (N'HDD 1TB', N'Seagate', null, 1600000, null, 1, 5)
insert into Product values (N'HDD 2TB', N'Seagate', null, 2400000, null, 1, 5)
insert into Product values (N'300W', N'DeepCool', null, 850000, null, 1, 6)
insert into Product values (N'550W', N'Corsair', null, 1500000, null, 1, 6)
insert into Product values (N'700W', N'CoolerMaster', null, 2000000, null, 1, 6)
insert into Product values (N'1000W', N'CoolerMaster', null, 6000000, null, 1, 6)

insert into Users (first_name, last_name, phone, user_address, username, pwd, user_role) values ('Carolyne', 'Fine', '1789541989', '383 Forster Trail', 'admin', '123456', 'AD');
insert into Users (first_name, last_name, phone, user_address, username, pwd, user_role) values ('Jasmine', 'Woolner', '4779361002', '73 Canary Avenue', 'employeeone', '123456', 'EM');
insert into Users (first_name, last_name, phone, user_address, username, pwd, user_role) values ('Cleveland', 'Palfreyman', '2993401117', '2 Sachs Park', 'employeetwo', '123456', 'EM');
insert into Users (first_name, last_name, phone, user_address, username, pwd, user_role) values ('Walton', 'de Mullett', '6036856245', '6056 Dayton Terrace', 'customerone', '123456', 'CS');
insert into Users (first_name, last_name, phone, user_address, username, pwd, user_role) values ('Lavinie', 'Nissle', '6374202111', '9998 Dwight Circle', 'customertwo', '123456', 'CS');

set dateformat dmy
insert into Orders (created_date, delivery_date, total, userId) values ('1/9/2021', '17/9/2021', null, 5);
insert into Orders (created_date, delivery_date, total, userId) values ('3/9/2021', '17/9/2021', null, 5);
insert into Orders (created_date, delivery_date, total, userId) values ('21/10/2021', '27/10/2021', null, 5);
insert into Orders (created_date, delivery_date, total, userId) values ('15/5/2022', '23/5/2022', null, 4);
insert into Orders (created_date, delivery_date, total, userId) values ('16/5/2022', '29/5/2022', null, 5);
insert into Orders (created_date, delivery_date, total, userId) values ('15/6/2022', '17/6/2022', null, 5);
insert into Orders (created_date, delivery_date, total, userId) values ('16/6/2022', '23/6/2022', null, 5);
insert into Orders (created_date, delivery_date, total, userId) values ('22/6/2022', '29/6/2022', null, 4);
insert into Orders (created_date, delivery_date, total, userId) values ('24/7/2022', '3/8/2022', null, 4);
insert into Orders (created_date, delivery_date, total, userId) values ('10/8/2022', '30/8/2022', null, 4);
go

insert into Orders_Detail (orderId, productId, amount, unit_price, active) values (48, 4, 1, 2500000, 1);
insert into Orders_Detail (orderId, productId, amount, unit_price, active) values (48, 15, 1, 2500000, 1);
insert into Orders_Detail (orderId, productId, amount, unit_price, active) values (49, 6, 1, 15000000, 1);
insert into Orders_Detail (orderId, productId, amount, unit_price, active) values (49, 9, 2, 10000000, 1);
insert into Orders_Detail (orderId, productId, amount, unit_price, active) values (50, 2, 2, 4500000, 1);
insert into Orders_Detail (orderId, productId, amount, unit_price, active) values (50, 22, 1, 850000, 1);
insert into Orders_Detail (orderId, productId, amount, unit_price, active) values (50, 21, 5, 2400000, 1);
insert into Orders_Detail (orderId, productId, amount, unit_price, active) values (50, 13, 2, 13000000, 1);
insert into Orders_Detail (orderId, productId, amount, unit_price, active) values (51, 5, 2, 5000000, 1);
insert into Orders_Detail (orderId, productId, amount, unit_price, active) values (51, 7, 4, 29000000, 1);
insert into Orders_Detail (orderId, productId, amount, unit_price, active) values (52, 8, 2, 44000000, 1);
insert into Orders_Detail (orderId, productId, amount, unit_price, active) values (53, 3, 4, 3000000, 1);
insert into Orders_Detail (orderId, productId, amount, unit_price, active) values (53, 1, 1, 19000000, 1);
insert into Orders_Detail (orderId, productId, amount, unit_price, active) values (53, 15, 4, 2500000, 1);
insert into Orders_Detail (orderId, productId, amount, unit_price, active) values (54, 24, 1, 2000000, 1);
insert into Orders_Detail (orderId, productId, amount, unit_price, active) values (54, 12, 5, 4000000, 1);
insert into Orders_Detail (orderId, productId, amount, unit_price, active) values (55, 23, 1, 1500000, 1);
insert into Orders_Detail (orderId, productId, amount, unit_price, active) values (55, 6, 4, 15000000, 1);
insert into Orders_Detail (orderId, productId, amount, unit_price, active) values (55, 25, 3, 6000000, 1);
insert into Orders_Detail (orderId, productId, amount, unit_price, active) values (55, 17, 5, 700000, 1);
insert into Orders_Detail (orderId, productId, amount, unit_price, active) values (55, 7, 5, 29000000, 1);
insert into Orders_Detail (orderId, productId, amount, unit_price, active) values (56, 8, 4, 44000000, 1);
insert into Orders_Detail (orderId, productId, amount, unit_price, active) values (57, 15, 5, 2500000, 1);
insert into Orders_Detail (orderId, productId, amount, unit_price, active) values (57, 8, 1, 44000000, 1);

UPDATE Orders 
SET total = (select SUM(unit_price * amount) from Orders_Detail where orderId = 48)
WHERE ID = 48

UPDATE Orders 
SET total = (select SUM(unit_price * amount) from Orders_Detail where orderId = 49)
WHERE ID = 49

UPDATE Orders 
SET total = (select SUM(unit_price * amount) from Orders_Detail where orderId = 50)
WHERE ID = 50

UPDATE Orders 
SET total = (select SUM(unit_price * amount) from Orders_Detail where orderId = 51)
WHERE ID = 51

UPDATE Orders 
SET total = (select SUM(unit_price * amount) from Orders_Detail where orderId = 52)
WHERE ID = 52

UPDATE Orders 
SET total = (select SUM(unit_price * amount) from Orders_Detail where orderId = 53)
WHERE ID = 53

UPDATE Orders 
SET total = (select SUM(unit_price * amount) from Orders_Detail where orderId = 54)
WHERE ID = 54

UPDATE Orders 
SET total = (select SUM(unit_price * amount) from Orders_Detail where orderId = 55)
WHERE ID = 55

UPDATE Orders 
SET total = (select SUM(unit_price * amount) from Orders_Detail where orderId = 56)
WHERE ID = 56

UPDATE Orders 
SET total = (select SUM(unit_price * amount) from Orders_Detail where orderId = 57)
WHERE ID = 57