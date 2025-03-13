use lesson11;

--Puzzle 2: The Missing Orders

--An e-commerce company tracks orders in two separate systems, but some orders are missing in one of them. You need to find the missing records.

--preview
select * from Orders_DB1
select * from Orders_DB2

--1.Declare a table variable @MissingOrders with the same structure as Orders_DB1.

declare @MissingOrders table(
	OrderID INT ,
    CustomerName VARCHAR(50),
    Product VARCHAR(50),
    Quantity INT
);

--Insert all orders that exist in Orders_DB1 but not in Orders_DB2 into @MissingOrders.

INSERT INTO @MissingOrders(OrderID,CustomerName,Product, Quantity)
SELECT o1.OrderID, o1.CustomerName, o1.Product, o1.Quantity
FROM Orders_DB1 as o1
LEFT JOIN Orders_DB2 as o2
ON o1.OrderID = o2.OrderID 
where o2.OrderID is  null

select * from @MissingOrders








 

