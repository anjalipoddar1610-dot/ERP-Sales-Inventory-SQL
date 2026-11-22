USE ERP_Sales_Inventory;

SELECT TABLE_NAME
FROM INFORMATION_SCHEMA.TABLES
WHERE TABLE_TYPE = 'BASE TABLE';

SELECT COLUMN_NAME
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'Project';
 
EXEC sp_rename 'Projects','Products';

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

INSERT INTO OrderDetails (OrderDetailID, OrderID, ProductID, Quantity, UnitPrice)
VALUES
(1, 1, 1, 1, 55000.00),
(2, 1, 2, 1, 1200.00),
(3, 2, 4, 1, 25000.00),
(4, 3, 7, 1, 8500.00),
(5, 4, 5, 2, 3500.00),
(6, 5, 9, 1, 2800.00),
(7, 6, 6, 1, 42000.00),
(8, 7, 5, 1, 3500.00),
(9, 8, 8, 1, 2800.00),
(10, 9, 10, 5, 2200.00);

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

INSERT INTO Payments (PaymentID, OrderID, PaymentDate, PaymentMethod, PaymentStatus, Amount)
VALUES
(1, 1, '2025-04-01', 'Credit Card', 'Paid', 56200.00),
(2, 2, '2025-04-03', 'UPI', 'Paid', 25000.00),
(3, 3, '2025-04-05', 'Cash', 'Pending', 8500.00),
(4, 4, '2025-04-08', 'Debit Card', 'Paid', 7000.00),
(5, 5, '2025-04-10', 'UPI', 'Refunded', 4500.00),
(6, 6, '2025-04-12', 'Credit Card', 'Paid', 42000.00),
(7, 7, '2025-04-15', 'UPI', 'Pending', 3500.00),
(8, 8, '2025-04-18', 'Cash', 'Paid', 5000.00),
(9, 9, '2025-04-20', 'Debit Card', 'Paid', 11000.00),
(10, 10, '2025-04-22', 'UPI', 'Pending', 2200.00);







