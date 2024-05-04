SELECT CategoryName 
FROM subjects
WHERE SubjectID 
IN (SELECT SubjectID FROM books WHERE SupplierID in (SELECT SupplierID FROM suppliers WHERE CompanyName='supplier2'));

SELECT Title, max(UnitPrice)
FROM books B, suppliers Sup
WHERE Sup.SupplierID = B.SupplierID
AND Sup.CompanyName = 'supplier3';

SELECT Title 
FROM books
WHERE BookID 
IN (SELECT BookID FROM order_detail WHERE OrderID IN (SELECT OrderID FROM orders WHERE CustomerID = (SELECT CustomerID FROM customers WHERE FirstName = "firstname1" AND LastName = "lastname1")));

SELECT Title 
FROM books
WHERE Quantity > 10;

SELECT round(sum(UnitPrice), 2) as TotalPrice
FROM customers C, books B, orders O, order_detail OD
WHERE O.CustomerID = C.CustomerID
AND OD.OrderID = O.OrderID
AND OD.BookID = B.BookID
AND C.FirstName = 'firstname1'
AND C.LastName = 'lastname1';

SELECT FirstName, LastName 
FROM (SELECT C.FirstName, C.LastName FROM books B, order_detail OD, orders O, customers C
WHERE OD.BookID = B.BookID AND O.OrderID = OD.OrderID AND C.CustomerID = O.CustomerID GROUP BY C.CustomerID 
HAVING SUM(OD.Quantity * B.UnitPrice) < 80) 
AS TEMPORARY;

SELECT Title 
FROM books
WHERE SupplierID = (SELECT SupplierID FROM suppliers WHERE CompanyName = 'supplier2');

SELECT round(sum(UnitPrice), 2) as TotalPrice, FirstName, LastName
FROM customers C, books B, orders O, order_detail OD
WHERE O.CustomerID = C.CustomerID
AND OD.OrderID = O.OrderID
AND OD.BookID = B.BookID
GROUP BY FirstName, LastName
ORDER BY sum(UnitPrice) DESC;

SELECT Title, ShipperName
from books B, shippers Sh, orders O, order_detail OD
where O.ShipperID = Sh.ShipperID
AND O.OrderID = OD.OrderID
AND B.BookID = OD.BookID
AND O.ShippedDate = '8/4/2016';

SELECT DISTINCT B.Title
FROM orders AS O LEFT JOIN order_detail AS OD ON O.OrderID = OD.OrderID LEFT JOIN books AS B ON OD.BookID = B.BookID
WHERE CustomerID in (SELECT CustomerID FROM customers
WHERE LastName = "lastname1" AND FirstName = "firstname1" OR LastName = "lastname4" AND FirstName = "firstname4")
GROUP BY OD.BookID HAVING COUNT(DISTINCT CustomerID) > 1;

SELECT Title 
FROM books
WHERE BookID IN (SELECT BookID FROM order_detail 
WHERE OrderID IN (SELECT OrderID FROM orders WHERE EmployeeID IN (SELECT EmployeeID
FROM employees WHERE LastName = 'lastname6')));

SELECT B.Title, SUM(OD.Quantity) 
FROM books B, order_detail OD
WHERE B.BookID = OD.BookID GROUP BY B.Title 
ORDER BY SUM(OD.Quantity) ASC;

SELECT FirstName, LastName 
FROM (SELECT C.FirstName, C.LastName, SUM(OD.Quantity) 
FROM customers C, orders O, order_detail OD
WHERE OD.OrderID = O.orderID AND O.CustomerID = C.CustomerID GROUP BY C.CustomerID 
HAVING SUM(OD.Quantity) >= 2) as Temp;

SELECT C.FirstName, C.LastName, B.Title 
FROM customers C, subjects S, books B, orders O, order_detail OD
WHERE O.OrderID = OD.OrderID 
AND B.BookID = OD.BookID 
AND O.CustomerID = C.CustomerID 
AND B.SubjectID = S.SubjectID 
AND (S.CategoryName = 'category3' OR S.CategoryName = 'category4');

SELECT DISTINCT C.FirstName, C.LastName 
FROM customers C, books B, orders O, order_detail OD
WHERE O.OrderID = OD.OrderID AND O.CustomerID = C.CustomerID 
AND OD.BookID = B.BookID 
AND B.Author = 'author1';

SELECT E.FirstName, E.LastName, SUM(OD.Quantity*B.UnitPrice) AS SalesTotal 
FROM books B, employees E, orders O, order_detail OD
WHERE O.EmployeeID = E.EmployeeID 
AND OD.OrderID = O.OrderID 
AND OD.BookID = B.BookID 
GROUP BY E.FirstName, E.LastName;

SELECT B.Title, OD.Quantity 
FROM books B, orders O, order_detail OD
WHERE B.BookID = OD.BookID 
AND OD.OrderID = O.OrderID 
AND OD.OrderID IN (SELECT OrderID FROM orders WHERE ShippedDate IS NULL);

SELECT FirstName, LastName, sum(OD.Quantity) as OrderQuantity
FROM books B, customers C, orders O, order_detail OD
WHERE O.CustomerID = C.CustomerID
AND OD.OrderID = O.OrderID
AND OD.BookID = B.BookID
GROUP BY C.FirstName, C.LastName
HAVING SUM(OD.Quantity) > 1;

SELECT FirstName, LastName, Phone 
FROM customers
WHERE CustomerID IN (SELECT orders.customerID FROM orders JOIN order_detail ON orders.OrderID = order_detail.OrderID
GROUP BY orders.CustomerID HAVING (SUM(order_detail.Quantity) > 3));