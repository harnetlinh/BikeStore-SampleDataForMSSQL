CREATE DATABASE BikeStores;
go
USE BikeStores;
go

-- create tables
CREATE TABLE categories (
	category_id INT PRIMARY KEY,
	category_name VARCHAR (255)
);

CREATE TABLE brands (
	brand_id INT PRIMARY KEY,
	brand_name VARCHAR (255)
);

CREATE TABLE products (
	product_id INT PRIMARY KEY,
	product_name VARCHAR (255),
	brand_id INT,
	category_id INT,
	model_year SMALLINT,
	list_price DECIMAL (10, 2)
);

CREATE TABLE customers (
	customer_id INT PRIMARY KEY,
	first_name VARCHAR (255),
	last_name VARCHAR (255),
	phone VARCHAR (25),
	email VARCHAR (255),
	street VARCHAR (255),
	city VARCHAR (50),
	state VARCHAR (25),
	zip_code VARCHAR (5)
);

CREATE TABLE stores (
	store_id INT PRIMARY KEY,
	store_name VARCHAR (255),
	phone VARCHAR (25),
	email VARCHAR (255),
	street VARCHAR (255),
	city VARCHAR (255),
	state VARCHAR (10),
	zip_code VARCHAR (5)
);

CREATE TABLE staffs (
	staff_id INT IDENTITY (1, 1) PRIMARY KEY,
	first_name VARCHAR (50),
	last_name VARCHAR (50),
	email VARCHAR (255) UNIQUE,
	phone VARCHAR (25),
	active tinyint,
	store_id INT,
	manager_id INT
);

CREATE TABLE orders (
	order_id INT IDENTITY (1, 1) PRIMARY KEY,
	customer_id INT,
	order_status tinyint,
	-- Order status: 1 = Pending; 2 = Processing; 3 = Rejected; 4 = Completed
	order_date DATE,
	required_date DATE,
	shipped_date DATE,
	store_id INT,
	staff_id INT
);

CREATE TABLE order_items (
	order_id INT,
	item_id INT,
	product_id INT,
	quantity INT,
	list_price DECIMAL (10, 2),
	discount DECIMAL (4, 2) DEFAULT 0,
	PRIMARY KEY (order_id, item_id)
);

CREATE TABLE stocks (
	store_id INT,
	product_id INT,
	quantity INT,
	PRIMARY KEY (store_id, product_id)
);