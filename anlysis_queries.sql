USE ERP_Sales_Inventory;

-- Total Order
SELECT COUNT(*) AS Total_Orders
FROM Orders;

-- Total Sales 
SELECT SUM(TotalAmount) AS Total_Sales
FROM Orders 
WHERE OrderStatus <> 'Cancelled';

-- Order Status Analyze
SELECT OrderStatus, 
COUNT(*) AS OrderCount
FROM Orders
GROUP BY OrderStatus;

-- Customer Wise Sales & Order
SELECT CustomerID, COUNT(*) AS TotalOrders, SUM(TotalAmount) AS TotalOrderValue
FROM Orders 
GROUP BY CustomerID
ORDER BY TotalOrderValue DESC;

-- Customer name with sales
SELECT c.CustomerID, c.CustomerName, COUNT(o.OrderID) AS TotalOrders, SUM(o.TotalAmount) AS TotalOrderValue
FROM Customers c
INNER JOIN Orders o
ON c.CustomerID = o.CustomerID 
GROUP BY c.CustomerID, c.CustomerName 
ORDER BY TotalOrderValue DESC;

-- Product wise Sales Analysis
SELECT p.ProductID, p.ProductName, 
       SUM(od.Quantity) AS TotalQuantitySold, 
       SUM(od.Quantity * od.UnitPrice) AS TotalSales
FROM Products p
INNER JOIN OrderDetails od
ON p.ProductID = od.ProductID 
GROUP BY p.ProductID, p.ProductName
ORDER BY TotalSales DESC;

-- Category wise sales
SELECT c.CategoryID, c.CategoryName, 
       SUM(od.Quantity) AS TotalQuantitySold, 
       SUM(od.Quantity * od.UnitPrice) AS TotalSales
FROM Categories c
INNER JOIN Products p
ON c.CategoryID = p.CategoryID
INNER JOIN OrderDetails od
ON p.ProductID = od.ProductID 
GROUP BY c.CategoryID, c.CategoryName
ORDER BY TotalSales DESC;

--Inventory Current Stock Analysis
SELECT p.ProductID, p.ProductName, i.StockIN,
       i.StockOut, i.CurrentStock
FROM Products p
INNER JOIN Inventory i
ON p.ProductID = i.ProductID
ORDER BY i.CurrentStock ASC;

--Payment method Analysis
SELECT PaymentMethod, COUNT(*) AS TotalPayments,
       SUM(Amount) AS TotalAmount
FROM Payments 
GROUP BY PaymentMethod 
ORDER BY TotalAmount DESC;

--Payment Status Analysis 
SELECT PaymentStatus, COUNT(*) AS 
      TotalPayments, SUM(Amount)
      AS TotalAmount
FROM Payments
GROUP BY PaymentStatus 
ORDER BY TotalAmount DESC;

--Sales by Order Status
SELECT OrderStatus, COUNT(*) AS TotalOrders, SUM(TotalAmount) AS TotalSales
FROM Orders 
GROUP BY OrderStatus 
ORDER BY totalSales DESC;

-- TOP Customer by Sales
SELECT c.CustomerName, SUM(o.TotalAmount) AS TotalSales
FROM Customers c
INNER JOIN Orders o 
ON c.CustomerId = o.CustomerID
GROUP BY c.CustomerName 
ORDER BY TotalSales DESC;

--Orders By city
SELECT c.City, COUNT(o.OrderID) AS TotalOrders, SUM(o.TotalAmount) AS TotalSales 
FROM Customers c 
INNER JOIN Orders o 
ON c.CustomerID = o.CustomerID
GROUP BY c.City 
ORDER BY TotalSales DESC;

-- Monthly Sales Analysis 
SELECT YEAR(OrderDate) AS OrderYear, 
       Month(OrderDate) AS OrderMonth,
       SUM(TotalAmount) AS TotalSales
FROM Orders 
WHERE OrderStatus <> 'Cancelled'
GROUP BY YEAR(OrderDate),
         MONTH(OrderDate) 
ORDER BY OrderYear, OrderMonth;

--Avg Order Value
SELECT AVG(TotalAmount) AS AverageOrderValue 
FROM Orders 
WHERE OrderStatus <> 'Cancelled';

--Low Stock Products
SELECT p.ProductId, p.ProductName, i.CurrentStock
FROM products p
INNER JOIN Inventory i 
ON p.ProductID = i.ProductID 
WHERE i.CurrentStock < 30 
ORDER BY i.CurrentStock ASC;

--Product stock status 
SELECT p.ProductName, i.CurrentStock, 
CASE
    WHEN i.CurrentStock < 20 THEN 'Low Stock'
    WHEN i.CurrentStock BETWEEN 20 AND 50 THEN 'Medium Stock' 
    ELSE 'High Stock' END AS StockStatus 
    FROM Products p
    INNER JOIN Inventory i 
    ON p.ProductID = i.ProductID 
    ORDER BY i.CurrentStock ASC;

--Top selling Product
SELECT TOP 1 p.ProductName, SUM(od.Quantity * od.UnitPrice) AS TotalSales
FROM Products p
INNER JOIN OrderDetails od 
ON p.ProductID = od.ProductID 
GROUP BY p.ProductName
ORDER BY TotalSales DESC;

-- Completed Orders Sales
SELECT COUNT(*) AS CompleteOrders, SUM(TotalAmount) AS CompletedSales 
FROM Orders 
WHERE OrderStatus = 'Completed';

-- Customer Order Count
SELECT c.CustomerName, COUNT(o.OrderID) AS TotalOrders 
FROM Customers c 
INNER JOIN Orders o 
ON c.CustomerID = o.CustomerID
GROUP BY c.CustomerName 
ORDER BY TotalOrders DESC;

-- Payment Collection by Mathod 
SELECT PaymentMethod, SUM(Amount) AS TotalCollected
FROM Payments 
WHERE PaymentStatus = 'Paid'
GROUP BY PaymentMethod 
ORDER BY TotalCollected DESC;

-- Data Validation Order vs Order Details
SELECT o.OrderID, o.TotalAmount AS OrderTotal, 
  SUM(od.Quantity * od.UnitPrice) AS CalcxulatedTotal
FROM Orders o 
INNER JOIN OrderDetails od 
ON o.OrderID = od.OrderID 
GROUP BY o.OrderID, o.TotalAmount
HAVING o.TotalAmount <> SUM(od.Quantity * od.UnitPrice);

--Customer with Highest Order Value
SELECT TOP 1 c.CustomerName, SUM(o.TotalAmount) AS TotalOrderValue
FROM Customers c 
INNER JOIN Orders o 
ON c.CustomerID = o.CustomerID 
GROUP BY c.CustomerName 
ORDER BY TotalOrderValue DESC; 

--Customer Above Average Order Value 
SELECT c.CustomerName, SUM(o.TotalAmount)
       AS TotalOrderValue 
FROM Customers c 
INNER JOIN Orders o 
ON c.CustomerID = o.CustomerID 
WHERE o.OrderStatus <> 'Cancelled'
GROUP BY c.CustomerName 
HAVING SUM(o.TotalAmount) > (
   SELECT AVG(TotalAmount)
   FROM Orders o2
   WHERE o2.OrderStatus <> 'Cancelled'
);

-- Customer wise sales Analysis
SELECT c.CustomerName, SUM(o.TotalAmount)
       AS TotalOrderValue
FROM Customers c
INNER JOIN Orders o
ON c.CustomerID = o.CustomerID
GROUP BY c.CustomerName
ORDER BY TotalOrderValue DESC;

