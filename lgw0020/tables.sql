CREATE DATABASE lgw0020db;

CREATE TABLE db_book (
    BookID int(127),
    Title text,
    UnitPrice varchar(255),
    Author tinytext,
    Quantity int(127),
    SuppilerID int(127),
    SubjectID int (127)
    );
   
INSERT INTO db_book (BookID, Title, UnitPrice, Author, Quantity, SupplierID, SubjectID)
VALUES ('1', 'book1', '12.34', 'author1', '5', '3', '1');
INSERT INTO book (BookID, Title, UnitPrice, Quantity, SupplierID, SubjectID)
VALUES ('2', 'book2', '56.78', 'author2', '2', '3', '1');
INSERT INTO book (BookID, Title, UnitPrice, Author, Quantity, SupplierID, SubjectID)
VALUES ('3', 'book3', '90.12', 'author3', '10', '2', '1');
INSERT INTO book (BookID, Title, UnitPrice, Author, Quantity, SupplierID, SubjectID)
VALUES ('4', 'book4', '34.56', 'author4', '12', '3', '2');
INSERT INTO book (BookID, Title, UnitPrice, Author, Quantity, SupplierID, SubjectID)
VALUES ('5', 'book5', '78.90', 'author5', '5', '2', '2');
INSERT INTO book (BookID, Title, UnitPrice, Author, Quantity, SupplierID, SubjectID)
VALUES ('6', 'book6', '12.34', 'author6', '30', '1', '3');
INSERT INTO book (BookID, Title, UnitPrice, Author, Quantity, SupplierID, SubjectID)
VALUES ('7', 'book7', '56.90', 'author2', '17', '3', '4');
INSERT INTO book (BookID, Title, UnitPrice, Author, Quantity, SupplierID, SubjectID)
VALUES ('8', 'book8', '33.44', 'author7', '2', '1', '3');

    
 CREATE TABLE db_customer (
 CustomerID int,
 LastName text,
 FirstName text,
 Phone varchar(65535)
 );
 
 INSERT INTO db_customer (CustomerID, LastName, FirstName, Phone)
VALUES ('1', 'lastname1', 'firstname1', '334001001');
 INSERT INTO customer (CustomerID, LastName, FirstName, Phone)
VALUES ('2', 'lastname2', 'firstname2', '334002002');
 INSERT INTO customer (CustomerID, LastName, FirstName, Phone)
VALUES ('3', 'lastname3', 'firstname3', '334003003');
 INSERT INTO customer (CustomerID, LastName, FirstName, Phone)
VALUES ('4', 'lastname4', 'firstname4', '334004004');
 
 CREATE TABLE db_employee (
 EmployeeID int(127),
 LastName text,
 FirstName text
 );
 
 INSERT INTO db_employee (EmployeeID, LastName, FirstName)
 VALUES ('1', 'lastname5', 'firstname5');
 INSERT INTO employee (EmployeeID, LastName, FirstName)
 VALUES ('2', 'lastname6', 'firstname6');
 INSERT INTO employee (EmployeeID, LastName, FirstName)
 VALUES ('3', 'lastname6', 'firstname9');
 
 CREATE TABLE db_order (
 OrderID int(127),
 CustomerID int(127),
 EmployeeID int(127),
 OrderDate date,
 ShippedDate date,
 ShipperID int(127)
 );
 
 INSERT INTO db_order (OrderID, CustomerID, EmployeeID, OrderDate, ShippedDate, ShipperID)
 VALUES ('1', '1', '1', '2016-08-01', '2016-08-03', '1');
INSERT INTO db_order (OrderID, CustomerID, EmployeeID, OrderDate, ShippedDate, ShipperID)
 VALUES ('2', '1', '2', '2016-08-04', 'NULL', 'NULL');
 INSERT INTO db_order (OrderID, CustomerID, EmployeeID, OrderDate, ShippedDate, ShipperID)
 VALUES ('3', '2', '1', '2016-08-01', '2016-08-04', '2');
 INSERT INTO db_order (OrderID, CustomerID, EmployeeID, OrderDate, ShippedDate, ShipperID)
 VALUES ('4', '4', '2', '2016-08-04', '2016-08-04', '1');
 INSERT INTO db_order (OrderID, CustomerID, EmployeeID, OrderDate, ShippedDate, ShipperID)
 VALUES ('5', '1', '1', '2016-08-04', '2016-08-05', '1');
 INSERT INTO db_order (OrderID, CustomerID, EmployeeID, OrderDate, ShippedDate, ShipperID)
 VALUES ('6', '4', '2', '2016-08-04', '2016-08-05', '1');
 INSERT INTO db_order (OrderID, CustomerID, EmployeeID, OrderDate, ShippedDate, ShipperID)
 VALUES ('7', '3', '1', '2016-08-04', '2016-08-04', '1');
 
 
 CREATE TABLE db_order_detail (
 BookID int(127),
 OrderID int(127),
 Quantity int(127)
 );
 
 INSERT INTO db_order_detail (BookID, OrderID, Quantity)
 VALUES ('1', '1', '2');
 INSERT INTO order_detail (BookID, OrderID, Quantity)
 VALUES ('4', '1', '1');
 INSERT INTO order_detail (BookID, OrderID, Quantity)
 VALUES ('6', '2', '2');
 INSERT INTO order_detail (BookID, OrderID, Quantity)
 VALUES ('7', '2', '3');
 INSERT INTO order_detail (BookID, OrderID, Quantity)
 VALUES ('5', '3', '1');
 INSERT INTO order_detail (BookID, OrderID, Quantity)
 VALUES ('3', '4', '2');
 INSERT INTO order_detail (BookID, OrderID, Quantity)
 VALUES ('4', '4', '1');
 INSERT INTO order_detail (BookID, OrderID, Quantity)
 VALUES ('7', '4', '1');
 INSERT INTO order_detail (BookID, OrderID, Quantity)
 VALUES ('1', '5', '1');
 INSERT INTO order_detail (BookID, OrderID, Quantity)
 VALUES ('1', '6', '2');
 INSERT INTO order_detail (BookID, OrderID, Quantity)
 VALUES ('1', '7', '1');
  
 CREATE TABLE db_shipper (
 ShipperID int(127),
 ShipperName text
 );
 
 INSERT INTO db_shipper(ShipperID, ShipperName)
 VALUES ('1', 'shipper1');
 INSERT INTO shipper(ShipperID, ShipperName)
 VALUES ('2', 'shipper2');
 INSERT INTO shipper(ShipperID, ShipperName)
 VALUES ('3', 'shipper3');
 INSERT INTO shipper(ShipperID, ShipperName)
 VALUES ('4', 'shipper4');
 
 
 
 CREATE TABLE db_subject (
 SubjectID int(127),
 CategoryName text
 );
 
 INSERT INTO db_subject (SubjectID, CateforyName)
 VALUES ('1', 'category1');
 INSERT INTO subject (SubjectID, CateforyName)
 VALUES ('2', 'category1');
 INSERT INTO subject (SubjectID, CateforyName)
 VALUES ('3', 'category3');
 INSERT INTO subject (SubjectID, CateforyName)
 VALUES ('4', 'category4');
 INSERT INTO subject (SubjectID, CateforyName)
 VALUES ('5', 'category5');
 
 CREATE TABLE db_supplier (
 SupplierID int(127),
 CompanyName text,
 ContactLastName text,
 ContactFirstName text,
 Phone varchar(65535)
 );
 
 INSERT INTO db_supplier (SupplierID, CompanyName, ContactLastName, ContactFirstName, Phone)
 VALUES ('1', 'supplier1', 'company1', 'company1', '111111111'); 
 INSERT INTO supplier (SupplierID, CompanyName, ContactLastName, ContactFirstName, Phone)
 VALUES ('2', 'supplier2', 'company2', 'company2', '222222222'); 
 INSERT INTO supplier (SupplierID, CompanyName, ContactLastName, ContactFirstName, Phone)
 VALUES ('3', 'supplier3', 'company3', 'company3', '333333333'); 
 INSERT INTO supplier (SupplierID, CompanyName, ContactLastName, ContactFirstName, Phone)
 VALUES ('4', 'supplier4', 'company4', '', '444444444'); 
 
 
 