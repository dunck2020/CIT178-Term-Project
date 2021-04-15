/* Final Project Procedures 

--Procedure to retrieve and display data
USE MoviesDB;
GO
CREATE PROC spMovieTitles
AS
SELECT Title 
FROM Reviews
ORDER BY Title;   

EXEC spMovieTitles; 


--Procedure takes 1 parameter and returns results
USE MoviesDB;
GO
CREATE PROC spFindActor
	@ActorName NVARCHAR(50) = '%'
AS
BEGIN
	SELECT Name FROM People
	WHERE Name LIKE @ActorName
END
GO 

EXEC spFindActor 'A%';
EXEC spFindActor'Scarlett%';  


--Procedure takes parameter and includes output parameter
USE MoviesDB;
GO
CREATE PROC spMovieProfit
	@MovieID SMALLINT,
	@Profit INT OUTPUT
AS  
SELECT @Profit = (BoxOffice - Budget)
FROM MovieDetails 
WHERE MovieDetails.MovieID = @MovieID; 

--input movie ID to get profit results
DECLARE @Profit INT;
EXEC spMovieProfit '2', @Profit OUTPUT;
PRINT 'Movie Profit: ' + CONVERT(VARCHAR, @Profit);  


--Procedure to return a value
USE MoviesDB;
GO 
CREATE PROC spNumberOfMoviePeople
AS 
DECLARE @PeopleCount INT;
SELECT @PeopleCount = COUNT(Name) 
FROM People
RETURN @PeopleCount;
GO

DECLARE @HowManyPeople INT;
EXEC @HowManyPeople = spNumberOfMoviePeople;
PRINT 'There are ' + CONVERT(VARCHAR, @HowManyPeople) + ' people in this database.';*/

/* Final Project User Defined Functions 

--scalar function that accepts an argument

USE MoviesDB;
GO
CREATE FUNCTION fnGetMovieID
    (@MovieName nvarchar(50) = '%')
    RETURNS INT
BEGIN
    RETURN (SELECT ID FROM Reviews WHERE Title Like @MovieName);
END;

--use the function
SELECT Length, Studio FROM MovieDetails
WHERE MovieID = dbo.fnGetMovieID('A Quiet Place');  

--table function that accepts argument
USE MoviesDB;
GO
CREATE FUNCTION fnMovieReviews
	(@MovieName nvarchar(50) = '%')
	RETURNS TABLE
RETURN
	(SELECT * FROM Reviews WHERE Title LIKE @MovieName);
GO  
SELECT * FROM dbo.fnMovieReviews('A%');
SELECT * FROM dbo.fnMovieReviews('Monty%');  */

/* Final Project Triggers 

--add deleted data to archive
--create empty archive table
 USE MoviesDB;
 GO
 SELECT * INTO MovieArchive
 FROM MovieDetails
 WHERE 1=0;   

CREATE TRIGGER MovieDetails_DELETE ON MovieDetails
	AFTER DELETE
AS
BEGIN
	SET NOCOUNT ON;
	DECLARE @MovieID SMALLINT,
			@ReviewID SMALLINT,
			@Length SMALLINT,
			@ReleaseDate DATE,
			@Budget MONEY,
			@BoxOffice MONEY,
			@Studio MONEY,
			@RatingID SMALLINT,
			@GenreID SMALLINT
	SELECT @MovieID = deleted.MovieID, @ReviewID = deleted.ReviewID, @Length = deleted.Length, @ReleaseDate = deleted.ReleaseDate,
	@Budget = deleted.Budget, @BoxOffice = deleted.BoxOffice, @Studio = deleted.Studio, @RatingID = deleted.RatingID, @GenreID = deleted.GenreID
	FROM deleted
	INSERT INTO MovieArchive VALUES(@MovieID, @ReviewID, @Length, @ReleaseDate, @Budget, @BoxOffice, @Studio, @RatingID, @GenreID)
END
GO 
 
--insert trigger

USE MoviesDB;
GO
SELECT * INTO GenreLogs
FROM Genre
WHERE 1=0;
GO  

ALTER TABLE GenreLogs
ADD Activity VARCHAR(50);
GO 

--create insert trigger
GO
CREATE TRIGGER GenreLogs_INSERT ON Genre
    AFTER INSERT
AS
BEGIN
    SET NOCOUNT ON;
    DECLARE @GenreName VARCHAR(50);
	DECLARE @GenreID SMALLINT;
    SELECT @GenreName = inserted.GenreName, @GenreID = inserted.GenreID
    FROM inserted

    INSERT INTO GenreLogs VALUES(@GenreID, @GenreName, 'Inserted')
END
GO 

INSERT INTO Genre (GenreID, GenreName) VALUES(14, 'Dystopian');
GO
SELECT * FROM GenreLogs;   

USE MoviesDB;
GO
SELECT * INTO GenreUpdateActivity
FROM Genre
WHERE 1=0; 
GO  

ALTER TABLE GenreUpdateActivity
ADD Activity VARCHAR(50);
GO 

GO
CREATE TRIGGER GenreActivity_UPDATE ON Genre
    AFTER UPDATE
AS
BEGIN
    SET NOCOUNT ON;
	DECLARE @GenreID SMALLINT;
    DECLARE @GenreName VARCHAR(50);
	DECLARE @Activity VARCHAR (50);

    SELECT @GenreName = inserted.GenreName, @GenreID = inserted.GenreID
    FROM inserted
	IF UPDATE(GenreID)
		SET @Activity = 'Updated Genre ID'
	IF UPDATE(GenreName)
		SET @Activity = 'Updated Genre Name'

    INSERT INTO GenreUpdateActivity VALUES(@GenreID, @GenreName, @Activity)
END
GO 

UPDATE Genre SET GenreID = 17 WHERE GenreName = 'Arthouse';
UPDATE Genre SET GenreName = 'Art House' WHERE GenreID = 17;
SELECT * FROM GenreUpdateActivity;  */