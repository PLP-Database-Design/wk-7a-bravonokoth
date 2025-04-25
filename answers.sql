-- Assignment: Database Design and Normalization
-- Week 7a - Database Design and Programming with SQL
-- Student: bravonokoth

-- Question 1: Achieving 1NF (First Normal Form)
-- Task: Transform the ProductDetail table into 1NF by ensuring each row represents a single product for an order
-- Original table: ProductDetail (OrderID, CustomerName, Products)
-- Products column contains multiple values (e.g., 'Laptop, Mouse'), violating 1NF

-- Step 1: Create a new table in 1NF where each row has a single product
CREATE TABLE ProductDetail_1NF (
    OrderID INT,
    CustomerName VARCHAR(100),
    Product VARCHAR(100),
    PRIMARY KEY (OrderID, Product) -- Composite key to ensure uniqueness
);

-- Step 2: Insert data into the new 1NF table, splitting the Products column
INSERT INTO ProductDetail_1NF (OrderID, CustomerName, Product)
VALUES
    (101, 'John Doe', 'Laptop'),
    (101, 'John Doe', 'Mouse'),
    (102, 'Jane Smith', 'Tablet'),
    (102, 'Jane Smith', 'Keyboard'),
    (102, 'Jane Smith', 'Mouse'),
    (103, 'Emily Clark', 'Phone');

-- Question 2: Achieving 2NF (Second Normal Form)
-- Task: Transform the OrderDetails table into 2NF by removing partial dependencies
-- Original table: OrderDetails (OrderID, CustomerName, Product, Quantity)
-- CustomerName depends on OrderID (partial dependency), violating 2NF

-- Step 1: Create two tables to achieve 2NF
-- Table 1: Orders - Contains OrderID and CustomerName (OrderID is the primary key)
CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerName VARCHAR(100)
);

-- Table 2: OrderItems - Contains OrderID, Product, Quantity (OrderID, Product as composite key)
CREATE TABLE OrderItems (
    OrderID INT,
    Product VARCHAR(100),
    Quantity INT,
    PRIMARY KEY (OrderID, Product),
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID)
);

-- Step 2: Insert data into the Orders table
INSERT INTO Orders (OrderID, CustomerName)
VALUES
    (101, 'John Doe'),
    (102, 'Jane Smith'),
    (103, 'Emily Clark');

-- Step 3: Insert data into the OrderItems table
INSERT INTO OrderItems (OrderID, Product, Quantity)
VALUES
    (101, 'Laptop', 2),
    (101, 'Mouse', 1),
    (102, 'Tablet', 3),
    (102, 'Keyboard', 1),
    (102, 'Mouse', 2),
    (103, 'Phone', 1);
