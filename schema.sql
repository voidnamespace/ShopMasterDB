-- ShopMasterDB - схема (SQLite)

CREATE TABLE Categories (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT NOT NULL
);

CREATE TABLE Products (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT NOT NULL,
    price REAL NOT NULL CHECK(price >= 0),
    categoryId INTEGER,
    stock INTEGER DEFAULT 0,
    FOREIGN KEY (categoryId) REFERENCES Categories(id)
);

CREATE TABLE Customers (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT NOT NULL,
    email TEXT UNIQUE NOT NULL,
    city TEXT,
    registrationDate DATE DEFAULT (DATE('now'))
);

CREATE TABLE Orders (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    customerId INTEGER NOT NULL,
    orderDate DATE DEFAULT (DATE('now')),
    totalAmount REAL,
    status TEXT DEFAULT 'Pending',
    FOREIGN KEY (customerId) REFERENCES Customers(id)
);

CREATE TABLE OrderItems (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    orderId INTEGER NOT NULL,
    productId INTEGER NOT NULL,
    quantity INTEGER NOT NULL CHECK (quantity > 0),
    price REAL NOT NULL,
    FOREIGN KEY (orderId) REFERENCES Orders(id),
    FOREIGN KEY (productId) REFERENCES Products(id)
);

CREATE TABLE Payments (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    orderId INTEGER NOT NULL,
    paymentDate DATE DEFAULT (DATE('now')),
    amount REAL NOT NULL,
    method TEXT NOT NULL,
    FOREIGN KEY (orderId) REFERENCES Orders(id)
);
