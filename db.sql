-- Create Table customers
CREATE TABLE customers (
  id INT PRIMARY KEY IDENTITY(1,1),
  username VARCHAR(20) UNIQUE,
  email NVARCHAR(50) UNIQUE,
  password NVARCHAR(20),
  phone VARCHAR(10) UNIQUE,
  birth DATE,
  created_at TIMESTAMP
);

-- Create Table mealType
CREATE TABLE mealType (
  id INT PRIMARY KEY IDENTITY(1,1),
  name NVARCHAR(50),
  created_at TIMESTAMP
);

-- Create Table coupons
CREATE TABLE coupons (
  couponId INT PRIMARY KEY IDENTITY(1,1)
);

-- Create Table tables
CREATE TABLE tables (
  tableNumber INT PRIMARY KEY,
  seats INT,
  reservedTime TIME
);

-- Create Table meal
CREATE TABLE meal (
  id INT PRIMARY KEY IDENTITY(1,1),
  name NVARCHAR(50),
  price INT,
  type INT REFERENCES mealType(id),
  isAvailable BIT,
  created_at TIMESTAMP
);

-- Create Table orders
CREATE TABLE orders (
  id INT PRIMARY KEY IDENTITY(1,1),
  customerId INT FOREIGN KEY REFERENCES customers(id),
  isOrdered BIT,
  created_at TIMESTAMP
);

-- Create table orderToMeal
CREATE TABLE orderToMeal (
  orderId INT PRIMARY KEY,
  meal INT, -- Use the same data type as meal.id
  quantity INT,
  FOREIGN KEY (orderId) REFERENCES orders(id),
  FOREIGN KEY (meal) REFERENCES meal(id)
);


-- Create Table reserveRecord
CREATE TABLE reserveRecord (
  id INT PRIMARY KEY IDENTITY(1,1),
  customerId INT FOREIGN KEY REFERENCES customers(id),
  tableNumber INT FOREIGN KEY REFERENCES tables(tableNumber),
  reservationTime TIME,
  isReserved BIT,
  created_at TIMESTAMP
);

-- Create Table couponToCustomer
CREATE TABLE couponToCustomer (
  customerId INT FOREIGN KEY REFERENCES customers(id),
  couponId INT FOREIGN KEY REFERENCES coupons(couponId),
  quantity INT
);
