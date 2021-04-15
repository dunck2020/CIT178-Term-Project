USE MoviesDB;
CREATE INDEX idx_ReviewID ON MovieDetails(ReviewID);
GO
CREATE INDEX idx_RatingID ON MovieDetails(RatingID);
GO
CREATE INDEX idx_GenreID ON MovieDetails(GenreID);
GO
CREATE INDEX idx_PrimaryFunction ON MoviePeople(PrimaryFunction);
GO