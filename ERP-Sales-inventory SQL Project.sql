CREATE DATABASE [ERP Sales Inventory];

USE [ERP Sales Inventory];

CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    CustomerName VARCHAR(100),
    Email VARCHAR(100),
    Phone VARCHAR(15),
    City VARCHAR(50),RegistrationDate DATE
);
CREATE TABLE Project(
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(100),
    CategoryID INT,
    SupplierID INT,
    Price DECIMAL(10,2),
    StockQuantity INT
);
CREATE TABLE Categories (
    CategoryID INT PRIMARY KEY,
    CategoryName VARCHAR(100),
    Description VARCHAR(255)
);
CREATE TABLE Suppliers (
    SupplierID INT PRIMARY KEY,
    SupplierName VARCHAR(100),
    ContactPerson VARCHAR(100),
    PHONE VARCHAR(15),
    City VARCHAR(50)
);
CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerID INT,
    OrderDate DATE,
    OrderStatus VARCHAR(30),
    TotalAmount DECIMAL(12,2)
);

CREATE TABLE Inventory (
    InventoryID INT PRIMARY KEY,
    ProductID INT,
    StockIn INT,
    StockOut INT,
    CurrentStock INT,
    LastUpdated DATE
);
CREATE TABLE Payments (
    PaymentID INT PRIMARY KEY,
    OrderID INT,
    PaymentDate DATE,
    PaymentMethod VARCHAR(30),
    PaymentStatus VARCHAR(30),
    Amount DECIMAL(12,2)
);
CREATE TABLE OrderDetails (
    OrderDetailID INT PRIMARY KEY,
    OrderID INT,
    ProductID INT,
    Quantity INT,
    UnitPrice DECIMAL(10,2)
);
EXEC sp_rename 'Project' , 'Products';

SELECT name
FROM sys.tables
ORDER BY name;

ALTER TABLE Products
ADD CONSTRAINT FK_Products_Categories
FOREIGN KEY (CategoryID)
REFERENCES Categories(CategoryID);

ALTER TABLE Products
ADD CONSTRAINT FK_Products_Suppliers
FOREIGN KEY (SupplierID)
REFERENCES Suppliers(SupplierID);

ALTER TABLE OrderDetails
ADD CONSTRAINT FK_OrderDetails_Orders
FOREIGN KEY (OrderID)
REFERENCES Orders(OrderID);

ALTER TABLE Orders
ADD CONSTRAINT FK_Orders_Customers
FOREIGN KEY (CustomerID)
REFERENCES Customers(CustomerID);

ALTER TABLE OrderDetails
ADD CONSTRAINT FK_OrderDetails_Products
FOREIGN KEY (ProductID)
REFERENCES Products(ProductID);

ALTER TABLE Inventory
ADD CONSTRAINT FK_Inventory_Products
FOREIGN KEY (ProductID)
REFERENCES Products(ProductID);

ALTER TABLE Payments
ADD CONSTRAINT FK_Payments_Orders
FOREIGN KEY (OrderID)
REFERENCES Orders(OrderID);

ALTER TABLE dbo.Products 
ADD CONSTRAINT
FK_Products_Categories_Check
FOREIGN KEY (CategoryID)
REFERENCES dbo.Categories(CategoryID);

INSERT INTO Categories (CategoryID, CategoryName, Description)
VALUES
(1, 'Electronics', 'Electronic device and accessories'),
(2, 'Home Appliances', 'Appliances for home use'),
(3, 'Furniture', 'Home and office furniture'),
(4, 'Office Supplies', 'Office and stationary products'),
(5, 'Mobile Accessories', 'Accessories for smartphones'),
(6, 'Computer Accessories', 'Computer and laptop accessories'),
(7, 'Kitchen Appliances', 'Appliances for kitchen use'),
(8, 'Storage solutions', 'Storage and organization products'),
(9, 'Networking Device', 'Routers and networking equipment'),
(10, 'Audio Device', 'Headphones and audio products');

INSERT INTO Suppliers (SupplierID, SupplierName, ContactPerson, Phone, City)
VALUES
(1, 'TechWorld Pvt Ltd', 'Amit Sharma', '9876543210', 'Pune'),
(2, 'Global Electronic', 'Rahul Verma', '9876543210', 'Mumbai'),
(3, 'Home tech Solution', 'Priya Singh', '9876543210', 'Delhi'),
(4, 'Smart Supplier', 'Neha Gupta', '9876543210', 'Bangalore'),
(5, 'Prime Distributors', 'Rohit Kumar', '9876543210', 'Chennai'),
(6, 'Digital Hub', 'Ankit Singh', '9876543210', 'Hydrabad'),
(7, 'Urban Traders', 'Pooja Verma', '9876543210', 'Kolkata'),
(8, 'NextGen Suppliers', 'Vikas Sharma', '9876543210', 'Ahmedabad'),
(9, 'Reliable Distribution', 'Sneha Gupta', '9876543210', 'Jaipur'),
(10, 'Metro Wholeshale', 'Karan Mehta', '9876543210', 'Noida');


INSERT INTO Products (ProductID, ProductName, CategoryID, SupplierID, Price, StockQuantity)
VALUES
(1, 'Laptop', 6, 2, 55000.00, 25),
(2, 'Wireless Mouse', 6, 2, 1200.00, 80),
(3, 'Keyboard', 6, 2, 1800.00, 60),
(4, 'Smartphone', 1, 3, 25000.00, 40),
(5, 'Blootooth Speaker', 10, 4, 3500.00, 35),
(6, 'Air Conditioner', 2, 5, 42000.00, 15),
(7, 'Office Chair', 3, 6, 8500.00, 30),
(8, 'Router', 9, 7, 2800.00, 45),
(9, 'Coffee Maker', 7, 8, 4500.00, 20),
(10, 'Headphones', 10, 9, 2200.00, 55);



INSERT INTO Customers (CustomerID, CustomerName, Email, Phone, City, RegistrationDate)
VALUES
(1, 'Rahul Sharma', 'rahul@gmail.com', '9876543210', 'Pune', '2025-01-10'),
(2, 'Priya Singh', 'priya@gmail.com', '9876543210', 'Mumbai', '2025-01-15'),
(3, 'Amit Kumar', 'amit@gmail.com', '9876543210', 'Delhi', '2025-02-05'),
(4, 'Neha Verma', 'neha@gmail.com', '9876543210', 'Bangalore', '2025-02-12'),
(5, 'Rohit Gupta', 'rohit@gmail.com', '9876543210', 'Hyderabad', '2025-03-01'),
(6, 'Sneha Patel', 'sneha@gmail.com', '9876543210', 'Ahmedabad', '2025-03-08'),
(7, 'Vikas Kumar', 'vikas@gmail.com', '9876543210', 'Kolkata', '2025-03-15'),
(8, 'Pooja Singh', 'pooja@gmail.com', '9876543210', 'Jaipur', '2025-03-20'),
(9, 'Karan Mehta', 'karan@gmail.com', '9876543210', 'Chennai', '2025-03-25'),
(10, 'Anjali Verma', 'anjali@gmail.com', '9876543210', 'Noida', '2025-03-30');

INSERT INTO Orders (OrderID, CustomerId, OrderDate, OrderStatus, TotalAmount)
VALUES
(1, 1, '2025-04-01', 'Completed', 56200.00),
(2, 2, '2025-04-03', 'Completed', 25000.00),
(3, 3, '2025-04-05', 'Pending', 8500.00),
(4, 4, '2025-04-08', 'Completed', 7000.00),
(5, 5, '2025-04-10', 'Canelled', 4500.00),
(6, 1, '2025-04-12', 'Completed', 42000.00),
(7, 2, '2025-04-15', 'Pending', 3500.00),
(8, 3, '2025-04-18', 'Completed', 5000.00),
(9, 4, '2025-04-20', 'Completed', 11000.00),
(10, 5, '2025-04-22', 'Pending', 2200.00);

INSERT INTO OrderDetails (orderDetailID, OrderID, ProductID, Quantity, UnitPrice)
VALUES
(1, 1, 1, 1, 55000.00),     --Laptop
(2, 1, 2, 1, 1200.00),      --Wireless Mouse
(3, 2, 4, 1, 25000.00),     --Smartphone
(4, 3, 7, 1, 8500.00),      --Office Chair
(5, 4, 5, 2, 3500.00),      --Bluetooth Speaker
(6, 5, 9, 1, 4500.00),      --Coffee Maker
(7, 6, 6, 1, 42000.00),     --Air Conditioner
(8, 7, 3, 2, 1800.00),      --Keyboard
(9, 8, 8, 1, 2800.00),      --Router
(10, 9, 10, 5, 2200.00);    --Headphones

INSERT INTO Inventory (InventoryID, ProductID, StockIn, StockOut, CurrentStock, LastUpdated)
VALUES 
(1, 1, 30, 5, 25, '2025-04-01'),
(2, 2, 100, 20, 80, '2025-04-02'),
(3, 3, 75, 15, 60, '2025-04-03'),
(4, 4, 50, 10, 40, '2025-04-05'),
(5, 5, 45, 10, 35, '2025-04-07'),
(6, 6, 20, 5, 15, '2025-04-10'),
(7, 7, 40, 10, 30, '2025-04-12'),
(8, 8, 55, 10, 45, '2025-04-15'),
(9, 9, 30, 10, 20, '2025-04-18'),
(10, 10, 70, 15, 55, '2025-04-20');

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







