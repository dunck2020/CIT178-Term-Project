CREATE DATABASE MoviesDB;

GO

USE MoviesDB;
CREATE TABLE Reviews(
	ID SMALLINT NOT NULL,
	Title VARCHAR(100) NOT NULL,
	RottenTomatoes TINYINT,
	IMBd DECIMAL (3,1),
	Metacritic TINYINT,
	PRIMARY KEY (ID)
);
GO
CREATE TABLE Genre(
	GenreID SMALLINT NOT NULL,
	GenreName VARCHAR(50) NOT NULL
	PRIMARY KEY (GenreID)
);
GO
CREATE TABLE Rating(
	RatingID SMALLINT NOT NULL,
	RatingName VARCHAR(10),
	PRIMARY KEY (RatingID)
);
GO
CREATE TABLE People(
	PersonID SMALLINT NOT NULL,
	Name VARCHAR(50) NOT NULL,
	PRIMARY KEY (PersonID)
);
GO
CREATE TABLE Role(
	RoleID SMALLINT NOT NULL,
	Type VARCHAR(40),
	PRIMARY KEY (RoleID)
);
GO
CREATE TABLE MovieDetails(
	MovieID SMALLINT NOT NULL,
	ReviewID SMALLINT NOT NULL,
	Length SMALLINT,
	ReleaseDate DATE,
	Budget MONEY,
	BoxOffice MONEY,
	Studio VARCHAR(40),
	RatingID SMALLINT NOT NULL,
	GenreID SMALLINT NOT NULL
	PRIMARY KEY (MovieID)
);
GO
CREATE TABLE MoviePeople(
	PersonID SMALLINT NOT NULL,
	MovieID SMALLINT NOT NULL,
	PrimaryFunction SMALLINT
	PRIMARY KEY (PersonID, MovieID)
);
GO

