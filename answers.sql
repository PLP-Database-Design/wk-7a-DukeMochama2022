
-- Question One 1NF

-- Problem: The Products column contains Multiple values separated by comma which violates the INF
-- We should ensure that each value is atomic in a column.

CREATE TABLE ProductDetail(
orderID INT,
CustomerName VARCHAR(100),
ProductName VARCHAR(100)
);

INSERT INTO ProductDetail(orderID,CustomerName,ProductName)
VALUES (101, 'John Doe', 'Laptop'),
(101, 'John Doe', 'Mouse'),
(102, 'Jane Smith', 'Tablet'),
(102, 'Jane Smith', 'Keyboard'),
(102, 'Jane Smith', 'Mouse'),
(103, 'Emily Clark', 'Phone');

-- Conclusion: Each row represents a single column now 

-- Question Two  2NF
-- Composite Key----> (OrderID,Product)
-- Partial dependency----> CustomerName depends on OrderID

-- To achieve 2NF we separate into different Tables

-- Customers Table
CREATE TABLE Customers(
customer_id INT PRIMARY KEY AUTO_INCREMENT,
CustomerName VARCHAR(100)
);

-- Orders Table
CREATE TABLE Orders(
order_id INT PRIMARY KEY AUTO_INCREMENT,
customer_id INT,
FOREIGN KEY(customer_id) REFERENCES Customers(customer_id)
);

-- OrderItems Table
CREATE TABLE OrderItems(
orderItem_id INT PRIMARY KEY AUTO_INCREMENT,
product VARCHAR(100),
quantity INT,
order_id INT,
FOREIGN KEY (order_id) REFERENCES Orders(order_id)
);

-- conclusion No partial dependencies- all non key attributes depends on the primary key of their respective tables.
-- Inserting data into tables
INSERT INTO Customers (CustomerName) VALUES
('John Doe'),
('Jane Smith'),
('Emily Clark');

INSERT INTO Orders (customer_id) VALUES
(1), -- OrderID 101
(2), -- OrderID 102
(3); -- OrderID 103

INSERT INTO OrderItems (product, quantity, order_id) VALUES
('Laptop', 2, 1),
('Mouse', 1, 1),
('Tablet', 3, 2),
('Keyboard', 1, 2),
('Mouse', 2, 2),
('Phone', 1, 3);

