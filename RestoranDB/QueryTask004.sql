CREATE DATABASE Restoran
USE Restoran

CREATE TABLE Meals(
Id INT  IDENTITY,
[Name] NVARCHAR(20),
Price DECIMAL(8,2)
)

DROP TABLE Meals

CREATE TABLE [Tables](
Id INT  IDENTITY,
No INT
)


CREATE TABLE Orders(
Id INT PRIMARY KEY IDENTITY,
[Date] DATETIME ,
TableId INT,
MealId INT
FOREIGN KEY (TableId) REFERENCES [Tables](Id),	
FOREIGN KEY (MealId) REFERENCES Meals(Id)	
)

-- Bütün masadatalarını yanında o masaya edilmiş sifariş sayı ilə birlikdə select edən query
INSERT INTO Meals (MealID, MealName, Price) VALUES
(1, 'Dolma', 8.50),
(2, 'Plov', 7.00),
(3, 'Kabab', 10.00),
(4, 'Qutab', 4.50),
(5, 'Dovga', 3.00),
(6, 'Sac qovurma', 12.00),
(7, 'Balıq', 11.50),
(8, 'Kükü', 5.00);

INSERT INTO Tables (Id, [No]) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5);

INSERT INTO Orders (Id, TableId, MealId,[Date]) VALUES
(1, 1, 1, '2025-10-21 13:25:00'),
(2, 1, 3, '2025-10-21 13:27:00'),
(3, 2, 2, '2025-10-21 14:00:00'),
(4, 2, 4, '2025-10-21 14:02:00'),
(5, 3, 6, '2025-10-21 15:10:00'),
(6, 3, 7, '2025-10-21 15:12:00'),
(7, 4, 5, '2025-10-21 16:00:00'),
(8, 5, 8, '2025-10-21 17:20:00'),
(9, 1, 2, '2025-10-22 12:00:00'),
(10, 2, 1, '2025-10-22 12:10:00'),
(11, 3, 3, '2025-10-22 12:15:00'),
(12, 4, 4, '2025-10-22 12:30:00'),
(13, 5, 6, '2025-10-22 13:00:00'),
(14, 1, 8, '2025-10-22 13:15:00'),
(15, 2, 5, '2025-10-22 13:20:00');






--Query 1
SELECT t.no,(SELECT COUNT(*) FROM Orders o
WHERE o.TableId = t.id) OrderCount FROM [TABLES] t

