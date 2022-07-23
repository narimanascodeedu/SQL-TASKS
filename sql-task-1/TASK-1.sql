CREATE DATABASE Blog

USE Blog

CREATE TABLE Users
(
Id INT PRIMARY KEY IDENTITY,
Name NVARCHAR(25) NOT NULL,
Surname NVARCHAR(30) NOT NULL,
Email NVARCHAR(100) CONSTRAINT CK_Surname NOT NULL UNIQUE CHECK(LEN(Email)>4)
)

CREATE TABLE Posts
(
Id INT PRIMARY KEY IDENTITY,
CreatedAt DATETIME DEFAULT getdate(),
LikeCount INT,
Title NVARCHAR(100),
PostText NVARCHAR(500),
UserId INT REFERENCES Users(Id)
)

INSERT INTO Users
VALUES
('Orxan','Hesenli','hesenli@gmail.com')

INSERT INTO Users
VALUES
('Seymur','Salmanov','salmanov@gmail.com'),
('Taleh','Musayev','musayev@gmail.com')


INSERT INTO Posts (LikeCount,Title,PostText,UserId)
VALUES
(6,'Example','Example...',1)

INSERT INTO Posts (LikeCount,Title,PostText,UserId)
VALUES
(16,'Example','Example...',3),
(56,'Example','Example...',2)