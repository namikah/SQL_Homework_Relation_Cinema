CREATE DATABASE Cinema

USE Cinema

CREATE TABLE Movies(
	ID int primary key identity,
	Name nvarchar(50) not null,
	YearOfMovie nvarchar(4),
	IMDb float
)

CREATE TABLE Genres(
	ID int primary key identity,
	Name nvarchar(50)
)

CREATE TABLE Actors(
	ID int primary key identity,
	Name nvarchar(50) not null,
	Surname nvarchar(50),
	Age int
)

CREATE TABLE Halls(
	ID int primary key identity,
	Name nvarchar(50),
	Capacity int not null
)

CREATE TABLE SessionsFilm(
	ID int primary key identity,
	MovieID int references Movies(ID),
	HallID int references Halls(ID),
	SessionDate date not null,
	StartSession time(7),
	EndSession time(7)
)

CREATE TABLE Customers(
	ID int primary key identity,
	Name nvarchar(50),
	Surname nvarchar(50),
	Age int,
	Gender nvarchar(20)
)

CREATE TABLE Tickets(
	ID int primary key identity,
	SessionID int references SessionsFilm(ID)
)

CREATE TABLE MoviesGenres(
	ID int primary key identity,
	MovieID int references Movies(ID),
	GenreID int references Genres(ID)
)

CREATE TABLE ActorsMovies(
	ID int primary key identity,
	MovieID int references Movies(ID),
	ActorID int references Actors(ID)
)

CREATE TABLE MoviesHall(
	ID int primary key identity,
	MovieID int references Movies(ID),
	HallID int references Halls(ID)
)

CREATE TABLE CustomersTickets(
	ID int primary key identity,
	CustomerID int references Customers(ID),
	TicketID int references Tickets(ID)
)

INSERT INTO Movies
VALUES	('Matrix 2','2003',9.1),
		('Matrix 3','2005',8.2),
		('The Godfather','1972',9.1),
		('The Godfather: Part II','1974',9.0),
		('The Dark Knight ','2008',9.0),
		('12 Angry Men','1957',8.9),
		('Schindlers List ','1993',8.9),
		('The Lord of the Rings: The Return of the King','2003',8.8),
		('Pulp Fiction','1994',8.8),
		('Terminator','1991',8.5),
		('Gladiator','2000',8.5)
		
INSERT INTO Genres
VALUES	('Action'),
		('Thriller'),
		('Comic'),
		('Fantastic'),
		('Dram')
	
INSERT INTO Actors
VALUES	('Tom','Hanks',65),	
		('Brad','Pitt',58),
		('Johnny','Depp',58),
		('Leonardo','DiCaprio',47),
		('Tom','Cruise',59),
		('Vin','Diesel',54),
		('Mel','Gibson',66),
		('Sylvester','Stallone',75),
		('Keanu','Reeves',57),
		('Matt','Damon',51)
	
INSERT INTO Halls
VALUES	('Mercury',50),
		('Venus',70),
		('Earth',50),
		('Mars',70),
		('Jupiter',100)
	
INSERT INTO SessionsFilm
VALUES	(1,5,'2022-01-26','17:30','18:50'),
		(2,3,'2022-01-26','15:30','17:00'),
		(10,2,'2022-01-26','13:30','15:00'),
		(8,1,'2022-01-26','11:00','13:00'),
		(7,5,'2022-01-26','09:30','10:30'),
		(1,5,'2022-01-27','17:30','18:50'),
		(2,2,'2022-01-27','15:30','17:00'),
		(10,4,'2022-01-27','13:30','15:00'),
		(8,3,'2022-01-27','11:00','13:00'),
		(7,1,'2022-01-27','09:30','10:30')
	
INSERT INTO Customers
VALUES	('Namik', 'Heydarov', 34, 'Male'),
		('Elmin', 'Kerimov', 27, 'Male'),
		('Elman', 'Memmedov', 20, 'Male'),
		('Nigar', 'Azizova', 19, 'FeMale '),
		('Veli', 'Nebiyev', 30, 'Male'),
		('Aysel', 'Ahmadova', 33, 'FeMale'),
		('Leyla', 'Aliyeva', 15, 'FeMale'),
		('Sevinc', 'Abdullayeva', 28, 'FeMale'),
		('Anar', 'Kerimov', 50, 'Male'),
		('Arzu', 'Xelilova', 18, 'FeMale')
	
INSERT INTO Tickets
VALUES	(1),
		(2),
		(3),
		(10),
		(2),
		(3),
		(4),
		(5),
		(6),
		(4),
		(5),
		(6),
		(7),
		(8),
		(9),
		(10),
		(4),
		(5),
		(6),
		(7)

CREATE VIEW v_All_Tickets_List
AS
SELECT T.ID, S.SessionDate, S.StartSession, S.EndSession, H.Name 'Halls', M.Name 'Movies', M.YearOfMovie
FROM Tickets T
JOIN SessionsFilm S ON S.ID = T.SessionID
JOIN Movies M ON M.ID = S.MovieID
JOIN Halls H ON H.ID = S.HallID

SELECT * 
FROM v_All_Tickets_List