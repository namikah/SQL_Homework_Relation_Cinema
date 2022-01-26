CREATE DATABASE Cinema

USE Cinema

CREATE TABLE Sponsors(
	ID int primary key identity,
	Name nvarchar(50) not null
)

CREATE TABLE Movies(
	ID int primary key identity,
	Name nvarchar(50) not null,
	YearOfMovie nvarchar(4),
	IMDb float,
	SponsorID int references Sponsors(ID)
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
	SessionID int references SessionsFilm(ID),
	Price float,
	SeatNumber int
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

INSERT INTO Sponsors
VALUES	('Anadolu Restaurant'),
		('Mc Donalds'),
		('Kantakt Home'),
		('Cinema Plus'),
		('Kapital Bank')

INSERT INTO Movies
VALUES	('Matrix 2','2003',9.1,1),
		('Matrix 3','2005',8.2,2),
		('The Godfather','1972',9.1,2),
		('The Godfather: Part II','1974',9.0,3),
		('The Dark Knight ','2008',9.0,4),
		('12 Angry Men','1957',8.9,5),
		('Schindlers List ','1993',8.9,4),
		('The Lord of the Rings: The Return of the King','2003',8.8,1),
		('Pulp Fiction','1994',8.8,5),
		('Terminator','1991',8.5,2),
		('Gladiator','2000',8.5,3)
		
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
	
INSERT INTO Tickets
VALUES	(1,7.50,1),
		(2,7.50,2),
		(3,10,3),
		(10,10,4),
		(2,7.50,5),
		(3,7.50,6),
		(4,7.50,7),
		(5,7.50,8),
		(6,10,9),
		(4,7.50,10),
		(5,7.50,11),
		(6,10,12),
		(7,7.50,13),
		(8,7.50,14),
		(9,10,15),
		(10,10,16),
		(4,7.50,17),
		(5,7.50,18),
		(6,10,19),
		(7,7.50,20)

INSERT INTO MoviesGenres
VALUES	(1,1),
		(2,1),
		(3,5),
		(4,3),
		(5,3),
		(6,2),
		(7,4),
		(8,5),
		(9,2),
		(10,1),
		(3,1),
		(4,1)

INSERT INTO ActorsMovies
VALUES	(1,10),
		(2,9),
		(3,8),
		(4,7),
		(5,6),
		(6,4),
		(7,3),
		(8,5),
		(9,2),
		(10,1),
		(1,1),
		(2,1)

INSERT INTO MoviesHall
VALUES	(2,5),
		(3,5),
		(4,4),
		(5,3),
		(6,4),
		(7,3),
		(8,2),
		(9,2),
		(10,1),
		(1,1),
		(1,5)

INSERT INTO CustomersTickets
VALUES	(1,1),
		(1,2),
		(2,3),
		(2,4),
		(3,5),
		(3,6),
		(4,7),
		(4,8),
		(5,9),
		(5,10),
		(6,11),
		(6,12),
		(7,13),
		(7,14),
		(8,15),
		(8,16),
		(9,17),
		(9,18),
		(10,19),
		(10,20)

--CREATE VIEW v_All_Tickets
--AS
--SELECT T.ID, SF.SessionDate 'Date', SF.StartSession 'Start', SF.EndSession 'End', H.Name 'Halls',T.SeatNumber 'Seat Number', T.Price 'Price (AZN)', M.Name 'Movies', M.YearOfMovie, G.Name 'Genres',SP.Name 'Sponsors', C.Name + ' ' + C.Surname 'Customers', C.Gender
--FROM CustomersTickets CT
--JOIN Customers C ON C.ID = CT.CustomerID
--JOIN Tickets T ON T.ID = CT.TicketID
--JOIN SessionsFilm SF ON SF.ID = T.SessionID
--JOIN Movies M ON M.ID = SF.MovieID
--JOIN Sponsors SP ON Sp.ID = M.SponsorID
--JOIN MoviesGenres MG ON MG.MovieID = M.ID
--JOIN Genres G ON G.ID = MG.GenreID
--JOIN Halls H ON H.ID = SF.HallID

--CREATE VIEW v_AllSessions
--AS
--SELECT SF.ID, SF.SessionDate 'Date', SF.StartSession 'Start', SF.EndSession 'End', H.Name 'Halls', M.Name 'Movies', M.YearOfMovie, G.Name 'Genres', SP.Name 'Sponsors'
--FROM SessionsFilm SF
--JOIN Movies M ON M.ID = SF.MovieID
--JOIN Sponsors SP ON Sp.ID = M.SponsorID
--JOIN MoviesGenres MG ON MG.MovieID = M.ID
--JOIN Genres G ON G.ID = MG.GenreID
--JOIN Halls H ON H.ID = SF.HallID

SELECT * FROM v_All_Tickets
ORDER BY Date

SELECT * FROM v_AllSessions
ORDER BY Date