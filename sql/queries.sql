--1. top 10 products by total sales
SELECT TOP 10
    p.ProductID,
    p.ProductName,
    SUM(oi.Sales) AS TotalSales
FROM dbo.OrderItems oi
JOIN dbo.Products p ON oi.ProductID = p.ProductID
GROUP BY p.ProductID, p.ProductName
ORDER BY TotalSales DESC;

--2) Region generates the most profit
SELECT
    l.Region,
    SUM(oi.Profit) AS TotalProfit
FROM dbo.OrderItems oi
JOIN dbo.Orders o   ON oi.OrderID = o.OrderID
JOIN dbo.Location l ON o.LocationID = l.LocationID
GROUP BY l.Region
ORDER BY TotalProfit DESC;

--3) Month with highest sales
SELECT TOP 1
    FORMAT(o.OrderDate, 'yyyy-MM') AS YearMonth,
    SUM(oi.Sales) AS MonthlySales
FROM dbo.OrderItems oi
JOIN dbo.Orders o ON oi.OrderID = o.OrderID
GROUP BY FORMAT(o.OrderDate, 'yyyy-MM')
ORDER BY MonthlySales DESC;

--4. Top 10 customers by revenue
SELECT TOP 10
    c.CustomerID,
    c.CustomerName,
    SUM(oi.Sales) AS TotalRevenue
FROM dbo.OrderItems oi
JOIN dbo.Orders o     ON oi.OrderID = o.OrderID
JOIN dbo.Customers c  ON o.CustomerID = c.CustomerID
GROUP BY c.CustomerID, c.CustomerName
ORDER BY TotalRevenue DESC;

--5. Monthly trend (sales + profit)
SELECT
    FORMAT(o.OrderDate, 'yyyy-MM') AS YearMonth,
    SUM(oi.Sales)  AS TotalSales,
    SUM(oi.Profit) AS TotalProfit
FROM dbo.OrderItems oi
JOIN dbo.Orders o ON oi.OrderID = o.OrderID
GROUP BY FORMAT(o.OrderDate, 'yyyy-MM')
ORDER BY YearMonth;