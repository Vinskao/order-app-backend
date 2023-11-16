USE ProjectOrderNow;
-- Create Table orders
CREATE TABLE orders (
  id INT PRIMARY KEY,
  customerId INT FOREIGN KEY REFERENCES customers(id),
  isOrdered BIT,
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

-- Create table orderToMeal
CREATE TABLE orderToMeal (
  orderId INT PRIMARY KEY,
  meal NVARCHAR(20) PRIMARY KEY,
  quantity INT,
  FOREIGN KEY (orderId) REFERENCES orders(id),
  FOREIGN KEY (meal) REFERENCES meal(id)
);

-- Create Table meal
CREATE TABLE meal (
  id INT PRIMARY KEY,
  name NVARCHAR(50),
  price INT,
  type NVARCHAR(50) REFERENCES mealType(id),
  isAvailable BIT,
  created_at TIMESTAMP
);

-- Create Table mealType
CREATE TABLE mealType (
  id INT PRIMARY KEY,
  name NVARCHAR(50),
  created_at TIMESTAMP
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

-- Create Table tables
CREATE TABLE tables (
  tableNumber INT PRIMARY KEY,
  seats INT,
  reservedTime TIME
);

-- Create Table coupons
CREATE TABLE coupons (
  couponId INT PRIMARY KEY
);

-- Create Table couponToCustomer
CREATE TABLE couponToCustomer (
  customerId INT PRIMARY KEY FOREIGN KEY REFERENCES customers(id),
  couponId INT PRIMARY KEY FOREIGN KEY REFERENCES coupons(couponId),
  quantity INT
);
