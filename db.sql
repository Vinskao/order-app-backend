CREATE DATABASE ProjectOrderNow;

USE ProjectOrderNow;

-- Create Table mealType
CREATE TABLE mealType (
  id INT PRIMARY KEY,
  name NVARCHAR(50),
  created_at TIMESTAMP
);

-- Create Table meal
CREATE TABLE meal (
  id INT PRIMARY KEY,
  name NVARCHAR(50),
  price INT,
  type INT FOREIGN KEY REFERENCES mealType(id),
  isAvailable BIT,
  created_at TIMESTAMP
);

-- Create Table customers
CREATE TABLE customers (
  id INT PRIMARY KEY,
  username VARCHAR(20) UNIQUE,
  email NVARCHAR(50) UNIQUE,
  password NVARCHAR(20),
  phone VARCHAR(10) UNIQUE,
  birth DATE,
  created_at TIMESTAMP
);

-- Create Table orders
CREATE TABLE orders (
  id INT PRIMARY KEY,
  customerId INT FOREIGN KEY REFERENCES customers(id),
  isOrdered BIT,
  created_at TIMESTAMP
);

-- Create table orderToMeal
CREATE TABLE orderToMeal (
  orderId INT,
  meal INT,
  quantity INT,
  PRIMARY KEY (orderId, meal),
  FOREIGN KEY (orderId) REFERENCES orders(id),
  FOREIGN KEY (meal) REFERENCES meal(id)
);

-- Create Table tables
CREATE TABLE tables (
  tableNumber INT PRIMARY KEY,
  seats INT,
  reservedTime TIME
);

-- Create Table reserveRecord
CREATE TABLE reserveRecord (
  id INT PRIMARY KEY,
  customerId INT FOREIGN KEY REFERENCES customers(id),
  tableNumber INT FOREIGN KEY REFERENCES tables(tableNumber),
  reservationTime TIME,
  isReserved BIT,
  created_at TIMESTAMP
);

-- Create Table coupons
CREATE TABLE coupons (
  couponId INT PRIMARY KEY
);

-- Create Table couponToCustomer with a composite primary key
CREATE TABLE couponToCustomer (
  customerId INT,
  couponId INT,
  quantity INT,
  PRIMARY KEY (customerId, couponId),
  FOREIGN KEY (customerId) REFERENCES customers(id),
  FOREIGN KEY (couponId) REFERENCES coupons(couponId)
);
