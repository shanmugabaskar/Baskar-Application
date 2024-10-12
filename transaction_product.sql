//use ECommerceDB;

---- Insert dummy products into the Products table
--INSERT INTO Products (Name, Price, Quantity, Description, IsInStock)
--VALUES 
--('Laptop', 1500.00, 10, 'High-performance laptop suitable for all purposes.', 1),
--('Smartphone', 800.00, 20, 'Latest model smartphone with advanced features.', 1),
--('Tablet', 600.00, 15, 'Lightweight tablet with high-resolution display.', 1),
--('Headphones', 200.00, 50, 'Noise-cancelling over-ear headphones.', 1),
--('Monitor', 300.00, 25, '24-inch full HD monitor with vibrant colors.', 1);

CREATE DATABASE EcommerceDB1;
GO
USE EcommerceDB;
GO
-- Create Customers Table
CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY IDENTITY,
    FirstName NVARCHAR(50) NOT NULL,
    LastName NVARCHAR(50) NOT NULL,
    Email NVARCHAR(100) NOT NULL UNIQUE,
    Phone NVARCHAR(20),
    DateOfBirth DATE,
    CreatedDate DATETIME DEFAULT GETDATE()
);
GO
-- Create Addresses Table
CREATE TABLE Addresses (
    AddressID INT PRIMARY KEY IDENTITY,
    CustomerID INT NOT NULL,
    AddressLine1 NVARCHAR(100) NOT NULL,
    AddressLine2 NVARCHAR(100),
    City NVARCHAR(50) NOT NULL,
    State NVARCHAR(50) NOT NULL,
    PostalCode NVARCHAR(20) NOT NULL,
    Country NVARCHAR(50) NOT NULL,
    IsDefault BIT DEFAULT 0,
    CreatedDate DATETIME DEFAULT GETDATE(),
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);
GO
-- Create Categories Table
CREATE TABLE Categories (
    CategoryID INT PRIMARY KEY IDENTITY,
    CategoryName NVARCHAR(100) NOT NULL,
    Description NVARCHAR(500),
    ParentCategoryID INT NULL,
    CreatedDate DATETIME DEFAULT GETDATE(),
    FOREIGN KEY (ParentCategoryID) REFERENCES Categories(CategoryID)
);
GO
--Create Products Table
CREATE TABLE Products (
    ProductID INT PRIMARY KEY IDENTITY,
    ProductName NVARCHAR(100) NOT NULL,
    Description NVARCHAR(500),
    Price DECIMAL(18, 2) NOT NULL,
    CategoryID INT NOT NULL,
    StockQuantity INT NOT NULL,
    CreatedDate DATETIME DEFAULT GETDATE(),
    FOREIGN KEY (CategoryID) REFERENCES Categories(CategoryID)
);
GO
-- Create Orders Table
CREATE TABLE Orders (
    OrderID INT PRIMARY KEY IDENTITY,
    CustomerID INT NOT NULL,
    OrderDate DATETIME DEFAULT GETDATE(),
    ShippingAddressID INT NOT NULL,
    TotalAmount DECIMAL(18,2),
    Status NVARCHAR(50),
    CreatedDate DATETIME DEFAULT GETDATE(),
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID),
    FOREIGN KEY (ShippingAddressID) REFERENCES Addresses(AddressID)
);
GO
--Create OrderItems Table
CREATE TABLE OrderItems (
    OrderItemID INT PRIMARY KEY IDENTITY,
    OrderID INT NOT NULL,
    ProductID INT NOT NULL,
    Quantity INT NOT NULL,
    UnitPrice DECIMAL(18,2) NOT NULL,
    TotalPrice DECIMAL(18,2) NOT NULL,
    CreatedDate DATETIME DEFAULT GETDATE(),
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID),
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);
GO
-- Create Payments Table
CREATE TABLE Payments (
    PaymentID INT PRIMARY KEY IDENTITY,
    OrderID INT NOT NULL,
    PaymentDate DATETIME DEFAULT GETDATE(),
    Amount DECIMAL(18,2) NOT NULL,
    PaymentMethod NVARCHAR(50) NOT NULL,
    TransactionID NVARCHAR(100),
    Status NVARCHAR(50),
    CreatedDate DATETIME DEFAULT GETDATE(),
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID)
);
GO
-- View to Display Order Details
CREATE VIEW OrderDetailsView AS
SELECT 
    o.OrderID,
    o.OrderDate,
    o.TotalAmount,
    o.Status AS OrderStatus,
    c.FirstName + ' ' + c.LastName AS CustomerName,
    ca.AddressLine1 + ', ' + ca.City + ', ' + ca.State + ', ' + ca.Country AS ShippingAddress,
    p.ProductName,
    oi.Quantity,
    oi.UnitPrice,
    oi.TotalPrice
FROM Orders o
INNER JOIN Customers c ON o.CustomerID = c.CustomerID
INNER JOIN Addresses ca ON o.ShippingAddressID = ca.AddressID
INNER JOIN OrderItems oi ON o.OrderID = oi.OrderID
INNER JOIN Products p ON oi.ProductID = p.ProductID;
GO
-- Stored Procedure to Get Orders by CustomerID
CREATE OR ALTER PROCEDURE [dbo].[GetOrdersByCustomerID]
    @CustomerID INT
AS
BEGIN
    SELECT 
        o.OrderID,
        o.OrderDate,
        o.TotalAmount,
        o.Status,
        o.CreatedDate,
        o.CustomerID,
        o.ShippingAddressId
    FROM Orders o
    INNER JOIN Customers c ON o.CustomerID = c.CustomerID
    WHERE o.CustomerID = @CustomerID;
END;
GO
-- Function to Calculate Discount
CREATE FUNCTION CalculateDiscount 
(
    @TotalAmount DECIMAL(18,2)
)
RETURNS DECIMAL(18,2)
AS
BEGIN
    DECLARE @Discount DECIMAL(18,2);
    IF @TotalAmount > 100
        SET @Discount = @TotalAmount * 0.10;
    ELSE
        SET @Discount = 0;
    RETURN @Discount;
END;
GO