CREATE DATABASE Shop

USE Shop

CREATE TABLE Positions
(
Id INT PRIMARY KEY IDENTITY,
Name NVARCHAR(25) NOT NULL
)

CREATE TABLE Employees
(
Id INT PRIMARY KEY IDENTITY,
Fullname NVARCHAR(150) NOT NULL,
PositionId INT REFERENCES Positions(Id),
Salary INT CONSTRAINT CK_Salary NOT NULL CHECK(Salary >= 300)
)

CREATE TABLE Products
(
Id INT PRIMARY KEY IDENTITY,
ProductName NVARCHAR(150) NOT NULL,
PurchasePrice DECIMAL(18,2) NOT NULL,
SalePrice DECIMAL(18,2) NOT NULL
)

CREATE TABLE Branchs
(
Id INT PRIMARY KEY IDENTITY,
Name NVARCHAR(100) NOT NULL
)

CREATE TABLE Sales
(
Id INT PRIMARY KEY IDENTITY,
ProductID INT REFERENCES Products(Id),
EmployeeID INT REFERENCES Employees(Id),
BranchID INT REFERENCES Branchs(Id),
SaleDate DATETIME DEFAULT GETDATE()
)

INSERT INTO Positions
VALUES
('Seller'),
('Sales Manager'),
('Boss'),
('Worker')

INSERT INTO Employees
VALUES
('Hesenli Orxan Eli',1,500),
('Salmanov Seymur Ceyhun',2,800),
('Musayev Taleh Huseyn',3,5000),
('Tagizade Islam Akif',4,600),
('Zeynalov Heyder Cavid',4,600),
('Kazimov Samir Nuri',1,500)

INSERT INTO Branchs
VALUES
('Bakixanov RM servis'),
('Revan AvtoServis')

INSERT INTO Products
VALUES
('Oil Filter',3,5),
('Air Filter',5,10),
('Transmission Filter',15,25),
('Fuel Filter',25,45),
('Cabin Filter',7,15)

INSERT INTO Sales(ProductID,EmployeeID,BranchID)
VALUES
(1,1,1),
(2,6,2),
(4,1,1),
(3,1,1),
(5,6,2)


--SELECT * FROM Employees
--INNER JOIN Products
--ON Products.ID = Employees.Id


--SELECT * FROM Employees
--full JOIN Positions
--ON Positions.Id = Employees.Id


--SELECT e.Fullname FROM Employees as e

--SELECT p.ProductName FROM Products as p

--select Employees.Fullname from Employees
--inner join Positions
--on Employees.Fullname = Positions.Name

--SELECT * FROM Sales
--INNER JOIN Products
--ON Sales.Id = Products.Id


--SELECT * FROM Employees
--INNER JOIN Positions
--ON Employees.PositionId = Positions.Id

--SELECT * FROM Sales
--INNER JOIN Products
--ON Sales.ProductID = Products.Id
--JOIN Employees
--ON Employees.Id = Sales.EmployeeID
--JOIN Branchs
--ON Branchs.Id = Sales.BranchID

--SELECT * FROM Employees
--INNER JOIN Sales
--ON Sales.EmployeeID = Employees.Id
--JOIN Products
--ON Sales.ProductID = Products.Id
--JOIN Branchs
--ON Sales.BranchID = Branchs.Id

SELECT Employees.Fullname, Products.ProductName,Branchs.Name as Branch, Products.PurchasePrice, Products.SalePrice FROM Employees
INNER JOIN Sales
ON Sales.EmployeeID = Employees.Id
JOIN Products
ON Sales.ProductID = Products.Id
JOIN Branchs
ON Sales.BranchID = Branchs.Id