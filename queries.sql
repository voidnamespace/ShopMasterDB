-- 1) All products with their category
SELECT p.id, p.name, p.price, c.name AS category, p.stock
FROM Products p
LEFT JOIN Categories c ON p.categoryId = c.id
ORDER BY c.name, p.name;

-- 2) Top 5 best-selling products (by total quantity in OrderItems)
SELECT p.id, p.name, SUM(oi.quantity) AS total_sold
FROM OrderItems oi
JOIN Products p ON oi.productId = p.id
GROUP BY p.id, p.name
ORDER BY total_sold DESC
LIMIT 5;

-- 3) Average product price per category
SELECT c.name AS category, ROUND(AVG(p.price),2) AS avg_price
FROM Products p
LEFT JOIN Categories c ON p.categoryId = c.id
GROUP BY c.name;

-- 4) Number of orders and total spending per customer
SELECT cu.id, cu.name, COUNT(o.id) AS orders_count, IFNULL(SUM(o.totalAmount),0) AS total_spent
FROM Customers cu
LEFT JOIN Orders o ON o.customerId = cu.id AND o.status = 'Completed'
GROUP BY cu.id, cu.name
ORDER BY total_spent DESC;

-- 5) Orders without payment (there is an order but no record in Payments)
SELECT o.id, o.customerId, o.orderDate, o.totalAmount
FROM Orders o
LEFT JOIN Payments p ON p.orderId = o.id
WHERE p.id IS NULL;

-- 6) Example analytics — total revenue for the last month
SELECT STRFTIME('%Y-%m', o.orderDate) AS ym, ROUND(SUM(pmt.amount),2) AS revenue
FROM Payments pmt
JOIN Orders o ON pmt.orderId = o.id
GROUP BY ym
ORDER BY ym DESC;

-- 7) Customers who bought products from 'Electronics' category (user behaviour example)
SELECT DISTINCT cu.id, cu.name
FROM Customers cu
JOIN Orders o ON o.customerId = cu.id
JOIN OrderItems oi ON oi.orderId = o.id
JOIN Products p ON p.id = oi.productId
JOIN Categories c ON c.id = p.categoryId
WHERE c.name = 'Electronics';

-- 8) Products with stock less than 10 (need restock)
SELECT id, name, stock FROM Products WHERE stock < 10 ORDER BY stock ASC;

-- 9) Check: recalculate totalAmount for each order
SELECT o.id,
       o.totalAmount AS stored_total,
       ROUND(SUM(oi.quantity * oi.price),2) AS computed_total,
       CASE WHEN ROUND(SUM(oi.quantity * oi.price),2) = ROUND(o.totalAmount,2) THEN 'OK' ELSE 'MISMATCH' END AS status
FROM Orders o
LEFT JOIN OrderItems oi ON oi.orderId = o.id
GROUP BY o.id, o.totalAmount;

-- 10) Customers without orders
SELECT id, name, email FROM Customers WHERE id NOT IN (SELECT customerId FROM Orders);

-- 11) Most active customers — those with 2 or more orders
SELECT cu.id, cu.name, COUNT(o.id) AS orders_count
FROM Customers cu
LEFT JOIN Orders o ON o.customerId = cu.id
GROUP BY cu.id, cu.name
HAVING orders_count >= 2
ORDER BY orders_count DESC;

-- 12) Revenue by payment method
SELECT method, ROUND(SUM(amount),2) AS total_amount, COUNT(*) AS payments_count
FROM Payments
GROUP BY method
ORDER BY total_amount DESC;
