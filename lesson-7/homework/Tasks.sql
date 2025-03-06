use lesson7;

CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    CustomerName VARCHAR(100)
);

CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerID INT,
    OrderDate DATE
);

CREATE TABLE OrderDetails (
    OrderDetailID INT PRIMARY KEY,
    OrderID INT FOREIGN KEY REFERENCES Orders(OrderID),
    ProductID INT,
    Quantity INT,
    Price DECIMAL(10,2)
);

CREATE TABLE Products (
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(100),
    Category VARCHAR(50)
);


INSERT INTO Customers VALUES 
(1, 'Alice'), (2, 'Bob'), (3, 'Charlie');

INSERT INTO Orders VALUES 
(101, 1, '2024-01-01'), (102, 1, '2024-02-15'),
(103, 2, '2024-03-10'), (104, 2, '2024-04-20');

INSERT INTO OrderDetails VALUES 
(1, 101, 1, 2, 10.00), (2, 101, 2, 1, 20.00),
(3, 102, 1, 3, 10.00), (4, 103, 3, 5, 15.00),
(5, 104, 1, 1, 10.00), (6, 104, 2, 2, 20.00);

INSERT INTO Products VALUES 
(1, 'Laptop', 'Electronics'), 
(2, 'Mouse', 'Electronics'),
(3, 'Book', 'Stationery');


--1️ Retrieve All Customers With Their Orders (Include Customers Without Orders)
--Use an appropriate JOIN to list all customers, their order IDs, and order dates.
--Ensure that customers with no orders still appear.

select *	
from Customers as c
left JOIN Orders as o
ON c.CustomerID = o.CustomerID;

--2️ Find Customers Who Have Never Placed an Order

select c.CustomerID, c.CustomerName
from Customers as c
	left JOIN Orders as o
	ON c.CustomerID = o.CustomerID
	WHERE OrderID is NULL

-- 3️. List All Orders With Their Products
--Show each order with its product names and quantity.

select ord.OrderID, p.ProductName, ord.Quantity
from OrderDetails as ord
JOIN Products as p
ON  ord.ProductID = p.ProductID

--4️ Find Customers With More Than One Order
--List customers who have placed more than one order.

select c.CustomerName, c.CustomerID,
		COUNT(OrderID) as numOrders
from Customers as c
join Orders as o
ON c.CustomerID = o.CustomerID
GROUP BY c.CustomerName,c.CustomerID
HAVING Count(o.OrderID) > 1

--5️ Find the Most Expensive Product in Each Order
select o.OrderID, MAX(ord.Price) as mostExpensiveProduct
from Orders as o
JOIN OrderDetails as ord
ON o.OrderID = ord.OrderID
GROUP BY o.OrderID

--6️ Find the Latest Order for Each Customer
select o.CustomerID, c.CustomerName, o.OrderID, o.OrderDate as latestOrder
from Orders as o
JOIN Customers as c
ON c.CustomerID = o.CustomerID
WHERE o.OrderDate = (select MAX(OrderDate) from Orders WHERE CustomerID = o.CustomerID)

--7️ Find Customers Who Ordered Only 'Electronics' Products
--List customers who only purchased items from the 'Electronics' category.

select CustomerName, Count(Distinct Category) as distinctCategory
FROM Customers as c
JOIN Orders as o
ON c.CustomerID = o.CustomerID
JOIN OrderDetails as ord
ON ord.OrderID = o.OrderID
JOIN Products as p
ON ord.ProductID = p.ProductID
Group by CustomerName
HAVING MIN(Category) = 'Electronics' AND MAX(Category) = 'Electronics';

--8 Find Customers Who Ordered at Least One 'Stationery' Product

select Distinct c.CustomerName, c.CustomerID
FROM Customers as c
WHERE EXISTS (
    SELECT 1 FROM Orders o
    JOIN OrderDetails ord ON ord.OrderID = o.OrderID
    JOIN Products p ON ord.ProductID = p.ProductID
    WHERE o.CustomerID = c.CustomerID AND p.Category = 'Stationery'
);

--9️ Find Total Amount Spent by Each Customer
--Show CustomerID, CustomerName, and TotalSpent.

select c.CustomerID, c.CustomerName,
	SUM(ord.Price * ord.Quantity) as TotalSpent
FROM Customers as c
JOIN Orders as o
ON c.CustomerID = o.CustomerID
JOIN OrderDetails as ord
ON ord.OrderID = o.OrderID
JOIN Products as p
ON ord.ProductID = p.ProductID
GROUP BY c.CustomerID, c.CustomerName
