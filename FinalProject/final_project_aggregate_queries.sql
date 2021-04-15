
USE MoviesDB;
SELECT 
	AVG(RottenTomatoes) AS [Average Rotten Review],
	AVG(IMBd) AS [Average IMBd Review],
	AVG(Metacritic) AS [Average Metacritic Review]
FROM Reviews; 

USE MoviesDB;
SELECT Reviews.Title, COUNT(MoviePeople.PersonID) AS [Number of Actors] 
FROM MoviePeople JOIN Reviews ON MoviePeople.MovieID = Reviews.ID
WHERE PrimaryFunction = 1 OR PrimaryFunction = 6 OR PrimaryFunction = 8
GROUP BY Reviews.Title
ORDER BY [Number of Actors] DESC;

USE MoviesDB;
SELECT Reviews.Title, 
MAX(MovieDetails.BoxOffice - MovieDetails.Budget) AS [Biggest Gain Over a Billion]
FROM Reviews JOIN MovieDetails ON Reviews.ID = MovieDetails.MovieID
GROUP BY Reviews.Title
HAVING MAX(MovieDetails.BoxOffice - MovieDetails.Budget) > 1000000000
ORDER BY [Biggest Gain Over a Billion] DESC;

USE MoviesDB;
SELECT MIN(Length) AS [Shortest Movie], MAX(Length) AS [Longest Movie], AVG(Length) AS [Average Length]
FROM MovieDetails 





