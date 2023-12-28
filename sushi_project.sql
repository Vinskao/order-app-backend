create database sushi_proj
use sushi_proj
GO

DROP TABLE if exists [branch_store]
DROP TABLE if exists [order]
DROP TABLE if exists [customer]
DROP TABLE if exists [employee]
DROP TABLE if exists [order_to_meal]
DROP TABLE if exists [meal]
DROP TABLE if exists [meal_type]
DROP TABLE if exists [reserve_record]
DROP TABLE if exists [table_universal]
DROP TABLE if exists [coupon]
DROP TABLE if exists [coupon_to_customer]
DROP TABLE if exists [history_password]
DROP TABLE if exists [meal_to_branch_store]





CREATE TABLE [branch_store] (
  [id] int PRIMARY KEY identity(1,1),
  [name] nvarchar(20),
  [address] nvarchar(50),
  [info] nvarchar(50),
  [tel_number] varchar(20),
  [six_people_seats_amount] int,
  [personal_seats_amount] int
)

GO

CREATE TABLE [order] (
  [id] int PRIMARY KEY identity(1,1),
  [customer_id] int,
  [branch_store_id] int,
  [coupon_id] int,
  [take_food_time] datetime,
  [taker_name] nvarchar(10),
  [taker_phone_numbers] nvarchar(10),
  [record_total_price] int,
  [ispaid] bit,
  [request_refund] bit,
  [created_at] datetime
)
GO

CREATE TABLE [customer] (
  [id] int PRIMARY KEY identity(1,1),
  [username] nvarchar(20),
  [email] varchar(50) unique,
  [password] varchar(20),
  [salt] varchar(50),
  [phone] varchar(10),
  [birth] date,
  [created_at] datetime
)
GO

CREATE TABLE [employee] (
  [id] int PRIMARY KEY identity(1,1),
  [username] nvarchar(20),
  [email] varchar(50) unique,
  [password] varchar(20),
  [phone] varchar(20),
  [branch_store_id] int,
  [birth] date,
  [created_at] datetime,
  [employee_level] nvarchar(50),
  [position_title] nvarchar(50)
)
GO

CREATE TABLE [order_to_meal] (
  [id] int PRIMARY KEY identity(1,1),
  [order_id] int,
  [meal_id] int,
  [quantity] int,
  [note] nvarchar(50),
  [record_subtotal] int
)
GO

CREATE TABLE [meal] (
  [id] int PRIMARY KEY identity(1,1),
  [name] nvarchar(50),
  [price] int,
  [speical_menu] bit,
  [end_time] date,
  [photo] varchar(MAX),
  [info] nvarchar(50),
  [type] int
)
GO

CREATE TABLE [meal_type] (
  [id] int PRIMARY KEY identity(1,1),
  [name] nvarchar(50),
  [info] nvarchar(50)
)
GO

CREATE TABLE [reserve_record] (
  [id] int PRIMARY KEY identity(1,1),
  [customer_id] int,
  [headcount] int,
  [reserved_day] date,
  [reserved_time] datetime,
  [branch_store_id] int,
  [arrive_time] datetime,
  [in_queue] int,
  [in_late_queue] int,
  [created_at] datetime
)
GO

CREATE TABLE [table_universal] (
  [id] int PRIMARY KEY identity(1,1),
  [branch_store_id] int,
  [table_name] varchar(20),
  [seats_type] varchar(20),
  [date] date,
  [time_interval] varchar(4),
  [is_available] bit
)
GO

CREATE TABLE [coupon] (
  [id] int PRIMARY KEY identity(1,1),
  [discount_factor] float,
  [info] nvarchar(50),
  [start_time] datetime,
  [end_time] datetime,
  [duration_day] int
)
GO

CREATE TABLE [coupon_to_customer] (
  [id] int PRIMARY KEY identity(1,1),
  [customer_id] int,
  [coupon_id] int,
  [quantity] int,
  [obtain_time] datetime
)
GO

CREATE TABLE [history_password] (
  [id] int PRIMARY KEY identity(1,1),
  [customer_id] int,
  [password] varchar(20),
  [salt] varchar(50),
  [altered_at] datetime
)
GO

CREATE TABLE [meal_to_branch_store] (
  [id] int PRIMARY KEY identity(1,1),
  [branch_store_id] int,
  [meal_id] int,
  [is_available] bit
)
GO

ALTER TABLE [order] ADD FOREIGN KEY ([customer_id]) REFERENCES [customer] ([id])
GO

ALTER TABLE [order_to_meal] ADD FOREIGN KEY ([order_id]) REFERENCES [order] ([id])
GO

ALTER TABLE [order_to_meal] ADD FOREIGN KEY ([meal_id]) REFERENCES [meal] ([id])
GO

ALTER TABLE [meal] ADD FOREIGN KEY ([type]) REFERENCES [meal_type] ([id])
GO

ALTER TABLE [reserve_record] ADD FOREIGN KEY ([customer_id]) REFERENCES [customer] ([id])
GO

ALTER TABLE [coupon_to_customer] ADD FOREIGN KEY ([coupon_id]) REFERENCES [coupon] ([id])
GO

ALTER TABLE [coupon_to_customer] ADD FOREIGN KEY ([customer_id]) REFERENCES [customer] ([id])
GO

ALTER TABLE [order] ADD FOREIGN KEY ([branch_store_id]) REFERENCES [branch_store] ([id])
GO

ALTER TABLE [reserve_record] ADD FOREIGN KEY ([branch_store_id]) REFERENCES [branch_store] ([id])
GO

ALTER TABLE [order] ADD FOREIGN KEY ([coupon_id]) REFERENCES [coupon] ([id])
GO

ALTER TABLE [employee] ADD FOREIGN KEY ([branch_store_id]) REFERENCES [branch_store] ([id])
GO

ALTER TABLE [table_universal] ADD FOREIGN KEY ([branch_store_id]) REFERENCES [branch_store] ([id])
GO

ALTER TABLE [history_password] ADD FOREIGN KEY ([customer_id]) REFERENCES [customer] ([id])
GO

ALTER TABLE [meal_to_branch_store] ADD FOREIGN KEY ([branch_store_id]) REFERENCES [branch_store] ([id])
GO

ALTER TABLE [meal_to_branch_store] ADD FOREIGN KEY ([meal_id]) REFERENCES [meal] ([id])
GO
