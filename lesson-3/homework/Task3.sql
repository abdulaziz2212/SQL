use lesson3;
select * from products


SELECT 
    p.Category,
    p.ProductName,
    p.Price,
    IIF(p.Stock = 0, 'Out of Stock', 
        IIF(p.Stock BETWEEN 1 AND 10, 'Low Stock', 'In Stock')) AS InventoryStatus
FROM Products p
JOIN (
    -- Find the most expensive product in each category
    SELECT Category, MAX(Price) AS MaxPrice
    FROM Products
    GROUP BY Category
) sub ON p.Category = sub.Category AND p.Price = sub.MaxPrice
ORDER BY p.Price DESC
--OFFSET 5 ROWS;

