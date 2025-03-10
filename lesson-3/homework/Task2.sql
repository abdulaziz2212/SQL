use lesson3;
go
-- Selects OrderStatus, total number of orders, total revenue  
SELECT 
	OrderStatus,  
	COUNT(*) as TotalOrders,  -- Counts the number of orders per status
	SUM(TotalAmount) as TotalRevenue -- Calculates total revenue per status

FROM (
-- Subquery: Assigns a new column OrderStatus based on the original Status column  
	SELECT *,
	CASE
		WHEN Status in ('Shipped', 'Delivered') THEN 'Completed'
		WHEN Status = 'Pending' THEN 'Pending'
		WHEN Status = 'Cancelled' THEN 'Cancelled'
	END
	AS OrderStatus
	FROM Orders
	WHERE OrderDate BETWEEN '2023-01-01' and '2023-12-31'
) as subquery -- Creates a temporary table with the new OrderStatus column

-- Groups the results by OrderStatus
GROUP BY OrderStatus	

-- Filters to include only OrderStatus groups where total revenue exceeds 5000
HAVING SUM(TotalAmount) > 5000

-- Orders the final result by TotalRevenue in descending order  
ORDER BY TotalRevenue DESC;


