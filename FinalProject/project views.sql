/* Final Project Views */
USE MoviesDB;
GO

--VIEW #1--
/*
CREATE VIEW StudioGenres
AS
SELECT GenreName, Studio
FROM Genre JOIN MovieDetails ON Genre.GenreID = MovieDetails.GenreID;
GO 
SELECT * FROM StudioGenres; 


--VIEW #2--
--updatable view--
CREATE VIEW MovieInfo
AS
SELECT MovieID, Length, BoxOffice, Studio
FROM MovieDetails; 

--display data--
SELECT * FROM MovieInfo;
GO
UPDATE MovieInfo
SET Length = 208
WHERE MovieID = 6  
GO
--display data--
SELECT * FROM MovieInfo;  



--view #3--
CREATE VIEW BoxOfficeGross
AS
SELECT Title, Budget, BoxOffice, BoxOffice - Budget AS [Movie Gross]
FROM Reviews JOIN MovieDetails ON Reviews.ID = MovieDetails.MovieID;
GO  
--display data--
SELECT * FROM BoxOfficeGross;  



--VIEW #4--
CREATE VIEW BestRatedMovies
AS
SELECT Title, RottenTomatoes, IMBd, Metacritic
FROM Reviews
WHERE RottenTomatoes > 95 AND IMBd > 8 AND Metacritic > 90  
GO

--display data--
SELECT * FROM BestRatedMovies; */
