-- Create Database
CREATE DATABASE OnlineBookStore;
USE OnlineBookStore;

-- Create Tables
CREATE TABLE Books (
        Book_ID SERIAL PRIMARY KEY,
        Title VARCHAR(100),
        Author VARCHAR(100),
        Genre VARCHAR(50),
        Published_Year INT,
        Price NUMERIC(10 , 2),
        Stock int
);        

CREATE TABLE Customers (
		Customer_ID SERIAL PRIMARY KEY,
        Name VARCHAR(100),
        Email VARCHAR(100),
        Phone VARCHAR(15),
        City VARCHAR(50),
        Country VARCHAR(150)
);        
  
CREATE TABLE Orders (
		Order_ID SERIAL PRIMARY KEY,
        Customer_ID BIGINT UNSIGNED,
        Book_ID BIGINT UNSIGNED,
        Order_Date DATE,
        Quantity INT,
        Total_Amount DECIMAL(10, 2),
        FOREIGN KEY (Customer_ID) REFERENCES Customers(Customer_ID),
	    FOREIGN KEY (Book_ID) REFERENCES Books(Book_ID)
);

SELECT * FROM Books;
SELECT * FROM Customers;
SELECT * FROM Orders;

-- Import data into books , customers , orders tab le through direct method [table data import wiza]
LOAD DATA LOCAL INFILE 'C:/Users/prlbe/OneDrive/Desktop/SQL/Online-Book-Store Project/Books.csv'
INTO TABLE Books
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS
(Book_ID, Title, Author, Genre, Published_Year, Price, Stock);


LOAD DATA LOCAL INFILE 'C:/Users/prlbe/OneDrive/Desktop/SQL/Online-Book-Store Project/Customers.csv'
INTO TABLE Customers
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS
(Customer_ID, Name, Email, Phone, City, Country);


LOAD DATA LOCAL INFILE 'C:/Users/prlbe/OneDrive/Desktop/SQL/Online-Book-Store Project/Orders.csv'
INTO TABLE Orders
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS
(Order_ID , Customer_ID , Book_ID , Order_Date , Quantity , Total_Amount);

----------------------------- BASIC QUESTIONS -------------------------------------
-- 1) Retrieve all books in the "Fiction" Genre:
SELECT * FROM Books
WHERE Genre='Fiction';

-- 2) Find books published after the year 1950:
SELECT * FROM Books
WHERE Published_Year>1950;

-- 3) List all customers from the canada:
SELECT * FROM Customers
WHERE Country='Canada';

-- 4) Show orders placed in November 2023:
SELECT * FROM Orders
WHERE Order_Date BETWEEN '2023-11-01' AND '2023-11-30';

-- 5) Retrieve the total stock of books available:
SELECT SUM(Stock) AS Total_Stock
from Books;

-- 6) Find the details of the most expensive book:
SELECT * FROM Books
ORDER BY Price DESC 
LIMIT 1;

-- 7) Show all customers who ordered more than 1 quantity of a book:
SELECT * FROM Orders
WHERE Quantity>1;

-- 8) Retrieve all orders where the total amount exceeds $20:
SELECT * FROM Orders
WHERE Total_Amount>20;

-- 9) List all genres available in the Books table:
SELECT DISTINCT Genre from Books;

-- 10) Find the book with the lowest stock:
SELECT * FROM Books
ORDER BY Stock
LIMIT 1;

-- 11) Calculate the total revenue generated from all orders:
SELECT SUM(Total_Amount) AS Revenue
FROM Orders;


--------------------------------- ADVANCE QUESTIONS -------------------------------------

-- 1) Retrieve the total number of books sold for each genre:
SELECT * FROM Orders;

SELECT b.Genre , SUM(o.Quantity) AS Total_Books_Sold
from Orders o
JOIN Books b ON o.Book_ID = b.Book_ID
GROUP BY b.Genre;

-- 2) Find the average price of books in the "Fantasy" Genre:
SELECT SUM(Price) AS Average_Price
FROM Books
WHERE Genre = 'Fantasy';

-- 3) List customers who have placed at least 2 orders:
SELECT o.Customer_ID , c.Name , COUNT(o.Order_ID) AS Order_Count
FROM Orders o
JOIN Customers c ON o.Customer_ID = c.Customer_ID
GROUP BY o.Customer_ID , c.Name
HAVING COUNT(Order_Id)>=2;

-- 4) Find the most frequently ordered book:
SELECT o.Book_ID , b.Title , COUNT(o.Order_ID) AS ORDER_COUNT
FROM Orders o
JOIN Books b ON o.Book_ID = b.Book_ID
GROUP BY o.Book_ID , B.title
ORDER BY ORDER_COUNT DESC LIMIT 1;

-- 5) Show the top 3 most expensive books of 'Fantasy' Genre:
SELECT * FROM Books 
WHERE Genre = 'Fantasy'
ORDER BY Price DESC LIMIT 3;

-- 6) Retrieve the total quantity of books sold by each author:
SELECT b.Author , SUM(o.Quantity) AS Total_Books_Sold
FROM orders o
JOIN books b ON o.Book_ID = b.Book_ID
GROUP BY b.Author;

-- 7) List the cities where customers who spent over $30 are located:
SELECT DISTINCT c.City
FROM Orders o
JOIN Customers c ON o.Customer_ID = c.Customer_ID
WHERE o.Total_Amount > 30;

-- 8) Find the customer who spent the most an orders:
SELECT c.Customer_ID , c.Name , SUM(o.Total_Amount) AS Total_Spent
FROM Orders o
JOIN Customers c ON o.Customer_ID = c.Customer_ID
GROUP BY c.Customer_ID , c.Name
ORDER BY Total_spent DESC LIMIT 1; 

-- 9) Calculate the stock remaining after fulfilling all orders:
SELECT b.Book_ID , b.Title , b.Stock , COALESCE(SUM(o.Quantity),0) AS Order_Quantity,
  b.Stock- COALESCE(SUM(o.Quantity),0) AS Remaining_Quantity 
FROM Books b
LEFT JOIN orders o ON b.Book_Id = o.Book_ID
GROUP BY b.Book_ID ORDER BY b.Book_ID;








