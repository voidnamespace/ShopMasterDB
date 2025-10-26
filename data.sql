-- Categories
INSERT INTO Categories (name) VALUES ('Electronics');
INSERT INTO Categories (name) VALUES ('Books');
INSERT INTO Categories (name) VALUES ('Home');
INSERT INTO Categories (name) VALUES ('Toys');

-- Products
INSERT INTO Products (name, price, categoryId, stock) VALUES ('USB-C Cable', 9.99, 1, 120);
INSERT INTO Products (name, price, categoryId, stock) VALUES ('Wireless Mouse', 24.50, 1, 80);
INSERT INTO Products (name, price, categoryId, stock) VALUES ('Mechanical Keyboard', 79.99, 1, 35);
INSERT INTO Products (name, price, categoryId, stock) VALUES ('Intro to SQL Book', 29.90, 2, 50);
INSERT INTO Products (name, price, categoryId, stock) VALUES ('Ceramic Mug', 12.00, 3, 200);
INSERT INTO Products (name, price, categoryId, stock) VALUES ('Building Blocks Set', 34.99, 4, 40);
INSERT INTO Products (name, price, categoryId, stock) VALUES ('Desk Lamp', 18.75, 3, 60);
INSERT INTO Products (name, price, categoryId, stock) VALUES ('Notebook', 3.50, 2, 400);

-- Customers
INSERT INTO Customers (name, email, city, registrationDate) VALUES ('Anton', 'anton@example.com', 'Berlin', '2025-08-01');
INSERT INTO Customers (name, email, city, registrationDate) VALUES ('Olga', 'olga@example.com', 'Munich', '2025-09-10');
INSERT INTO Customers (name, email, city, registrationDate) VALUES ('Dmitry', 'dmitry@example.com', 'Hamburg', '2025-06-20');
INSERT INTO Customers (name, email, city, registrationDate) VALUES ('Irina', 'irina@example.com', 'Berlin', '2025-07-05');
INSERT INTO Customers (name, email, city, registrationDate) VALUES ('Sergey', 'sergey@example.com', 'Cologne', '2025-10-01');

-- Orders (note: totalAmount can be recalculated or left as inserted for sample)
INSERT INTO Orders (customerId, orderDate, totalAmount, status) VALUES (1, '2025-10-01', 54.49, 'Completed');
INSERT INTO Orders (customerId, orderDate, totalAmount, status) VALUES (2, '2025-10-05', 29.90, 'Completed');
INSERT INTO Orders (customerId, orderDate, totalAmount, status) VALUES (1, '2025-10-10', 79.99, 'Pending');
INSERT INTO Orders (customerId, orderDate, totalAmount, status) VALUES (3, '2025-09-28', 18.75, 'Completed');
INSERT INTO Orders (customerId, orderDate, totalAmount, status) VALUES (4, '2025-10-12', 48.49, 'Cancelled');

-- OrderItems
INSERT INTO OrderItems (orderId, productId, quantity, price) VALUES (1, 2, 1, 24.50); -- Wireless Mouse
INSERT INTO OrderItems (orderId, productId, quantity, price) VALUES (1, 4, 1, 29.99); -- SQL book (price slightly adjusted)
INSERT INTO OrderItems (orderId, productId, quantity, price) VALUES (2, 4, 1, 29.90);
INSERT INTO OrderItems (orderId, productId, quantity, price) VALUES (3, 3, 1, 79.99);
INSERT INTO OrderItems (orderId, productId, quantity, price) VALUES (4, 7, 1, 18.75);
INSERT INTO OrderItems (orderId, productId, quantity, price) VALUES (5, 6, 1, 34.99);
INSERT INTO OrderItems (orderId, productId, quantity, price) VALUES (5, 8, 4, 3.50); -- multiple notebooks

-- Payments
INSERT INTO Payments (orderId, paymentDate, amount, method) VALUES (1, '2025-10-01', 54.49, 'Card');
INSERT INTO Payments (orderId, paymentDate, amount, method) VALUES (2, '2025-10-05', 29.90, 'PayPal');
INSERT INTO Payments (orderId, paymentDate, amount, method) VALUES (4, '2025-09-28', 18.75, 'Card');
