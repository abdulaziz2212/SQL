use lesson3;
go
CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Department VARCHAR(50),
    Salary DECIMAL(10,2),
    HireDate DATE
);


CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerName VARCHAR(100),
    OrderDate DATE,
    TotalAmount DECIMAL(10,2),
    Status VARCHAR(20) CHECK (Status IN ('Pending', 'Shipped', 'Delivered', 'Cancelled'))
);

CREATE TABLE Products (
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(100),
    Category VARCHAR(50),
    Price DECIMAL(10,2),
    Stock INT
);

INSERT INTO Employees (EmployeeID, FirstName, LastName, Department, Salary, HireDate)
VALUES 
    (1, 'Alice', 'Johnson', 'HR', 60000, '2019-03-15'),
    (2, 'Bob', 'Smith', 'IT', 85000, '2018-07-20'),
    (3, 'Charlie', 'Brown', 'Finance', 95000, '2017-01-10'),
    (4, 'David', 'Williams', 'HR', 50000, '2021-05-22'),
    (5, 'Emma', 'Jones', 'IT', 110000, '2016-12-02'),
    (6, 'Frank', 'Miller', 'Finance', 40000, '2022-06-30'),
    (7, 'Grace', 'Davis', 'Marketing', 75000, '2020-09-14'),
    (8, 'Henry', 'White', 'Marketing', 72000, '2020-10-10'),
    (9, 'Ivy', 'Taylor', 'IT', 95000, '2017-04-05'),
    (10, 'Jack', 'Anderson', 'Finance', 105000, '2015-11-12'),
	(11, 'Karen', 'Baker', 'HR', 58000, '2018-02-25'),
    (12, 'Leo', 'Harris', 'IT', 90000, '2019-06-18'),
    (13, 'Mia', 'Clark', 'Finance', 98000, '2016-09-30'),
    (14, 'Noah', 'Martinez', 'HR', 52000, '2021-03-10'),
    (15, 'Olivia', 'Garcia', 'IT', 115000, '2015-07-19'),
    (16, 'Paul', 'Rodriguez', 'Finance', 42000, '2022-08-22'),
    (17, 'Quinn', 'Lee', 'Marketing', 77000, '2020-11-08'),
    (18, 'Ryan', 'Walker', 'Marketing', 70000, '2019-05-15'),
    (19, 'Sophia', 'Hall', 'IT', 97000, '2016-12-12'),
    (20, 'Tom', 'Allen', 'Finance', 102000, '2014-10-28'),
	(21, 'Uma', 'Young', 'HR', 61000, '2019-04-17'),
    (22, 'Victor', 'King', 'IT', 88000, '2017-08-23'),
    (23, 'Wendy', 'Scott', 'Finance', 99000, '2015-05-12'),
    (24, 'Xavier', 'Green', 'HR', 54000, '2022-02-28'),
    (25, 'Yara', 'Adams', 'IT', 113000, '2014-06-05'),
    (26, 'Zane', 'Nelson', 'Finance', 43000, '2023-01-10'),
    (27, 'Abby', 'Carter', 'Marketing', 76000, '2020-07-29'),
    (28, 'Ben', 'Mitchell', 'Marketing', 71000, '2021-11-04'),
    (29, 'Clara', 'Perez', 'IT', 94000, '2018-03-20'),
    (30, 'Daniel', 'Roberts', 'Finance', 106000, '2013-09-15'),
    (31, 'Ella', 'Stewart', 'HR', 59000, '2020-05-21'),
    (32, 'Finn', 'Lopez', 'IT', 89000, '2016-12-10'),
    (33, 'Georgia', 'Hill', 'Finance', 101000, '2015-02-14'),
    (34, 'Hector', 'Bennett', 'HR', 53000, '2021-08-19'),
    (35, 'Iris', 'Collins', 'IT', 112000, '2013-04-07'),
    (36, 'Jake', 'Turner', 'Finance', 45000, '2022-09-05'),
    (37, 'Kylie', 'Ward', 'Marketing', 78000, '2019-06-11'),
    (38, 'Liam', 'Torres', 'Marketing', 74000, '2020-10-22'),
    (39, 'Mason', 'Richardson', 'IT', 96000, '2017-05-30'),
    (40, 'Nina', 'Wood', 'Finance', 108000, '2012-12-01');

INSERT INTO Orders (OrderID, CustomerName, OrderDate, TotalAmount, Status)
VALUES 
    (101, 'John Doe', '2023-01-15', 2500, 'Shipped'),
    (102, 'Mary Smith', '2023-02-10', 4500, 'Pending'),
    (103, 'James Brown', '2023-03-25', 6200, 'Delivered'),
    (104, 'Patricia Davis', '2023-05-05', 1800, 'Cancelled'),
    (105, 'Michael Wilson', '2023-06-14', 7500, 'Shipped'),
    (106, 'Elizabeth Garcia', '2023-07-20', 9000, 'Delivered'),
    (107, 'David Martinez', '2023-08-02', 1300, 'Pending'),
    (108, 'Susan Clark', '2023-09-12', 5600, 'Shipped'),
    (109, 'Robert Lewis', '2023-10-30', 4100, 'Cancelled'),
    (110, 'Emily Walker', '2023-12-05', 9800, 'Delivered'),
	(111, 'Daniel Hall', '2024-01-10', 3200, 'Shipped'),
    (112, 'Olivia Allen', '2024-01-25', 2100, 'Pending'),
    (113, 'Ethan Young', '2024-02-15', 6700, 'Delivered'),
    (114, 'Sophia Hernandez', '2024-03-05', 1500, 'Cancelled'),
    (115, 'Liam King', '2024-03-18', 8900, 'Shipped'),
    (116, 'Charlotte Wright', '2024-04-07', 7300, 'Delivered'),
    (117, 'William Lopez', '2024-05-22', 2800, 'Pending'),
    (118, 'Amelia Scott', '2024-06-11', 4600, 'Shipped'),
    (119, 'Benjamin Green', '2024-07-30', 9200, 'Delivered'),
    (120, 'Mia Adams', '2024-08-14', 3800, 'Cancelled');
INSERT INTO Products (ProductID, ProductName, Category, Price, Stock)
VALUES 
    (1, 'Laptop', 'Electronics', 1200, 15),
    (2, 'Smartphone', 'Electronics', 800, 30),
    (3, 'Desk Chair', 'Furniture', 150, 5),
    (4, 'LED TV', 'Electronics', 1400, 8),
    (5, 'Coffee Table', 'Furniture', 250, 0),
    (6, 'Headphones', 'Accessories', 200, 25),
    (7, 'Monitor', 'Electronics', 350, 12),
    (8, 'Sofa', 'Furniture', 900, 2),
    (9, 'Backpack', 'Accessories', 75, 50),
    (10, 'Gaming Mouse', 'Accessories', 120, 20),
	(11, 'Wireless Keyboard', 'Accessories', 90, 18),
    (12, 'Office Desk', 'Furniture', 350, 4),
    (13, 'Bluetooth Speaker', 'Electronics', 180, 22),
    (14, 'Dining Table', 'Furniture', 700, 1),
    (15, 'Smartwatch', 'Electronics', 250, 30),
    (16, 'Air Purifier', 'Home Appliances', 300, 10),
    (17, 'Bookshelf', 'Furniture', 280, 3),
    (18, 'Tablet', 'Electronics', 600, 15),
    (19, 'Mechanical Keyboard', 'Accessories', 140, 12),
    (20, 'Power Bank', 'Accessories', 50, 40),
    (21, 'Soundbar', 'Electronics', 320, 9),
    (22, 'Portable Projector', 'Electronics', 500, 6),
    (23, 'Microwave Oven', 'Home Appliances', 350, 8),
    (24, 'Refrigerator', 'Home Appliances', 1200, 5),
    (25, 'Vacuum Cleaner', 'Home Appliances', 450, 7),
    (26, 'Electric Kettle', 'Home Appliances', 60, 25),
    (27, 'Wireless Earbuds', 'Accessories', 110, 35),
    (28, 'Yoga Mat', 'Fitness', 30, 50),
    (29, 'Dumbbell Set', 'Fitness', 120, 20),
    (30, 'Treadmill', 'Fitness', 900, 3),
    (31, 'Exercise Bike', 'Fitness', 600, 5),
    (32, '4K Smart TV', 'Electronics', 1800, 6),
    (33, 'Ergonomic Chair', 'Furniture', 400, 8),
    (34, 'Standing Desk', 'Furniture', 500, 6),
    (35, 'Ceiling Fan', 'Home Appliances', 150, 10),
    (36, 'Electric Scooter', 'Electronics', 700, 4),
    (37, 'HD Webcam', 'Accessories', 80, 25),
    (38, 'Graphic Tablet', 'Electronics', 350, 7),
    (39, 'Mini Fridge', 'Home Appliances', 250, 12),
    (40, 'Smart Thermostat', 'Home Appliances', 180, 9);



