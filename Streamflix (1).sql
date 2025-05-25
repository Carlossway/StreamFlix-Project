CREATE DATABASE streamflix_subscription;
USE streamflix_subscription;


CREATE TABLE Users (
    UserID VARCHAR(50) PRIMARY KEY,
    Age INT,
    Gender VARCHAR(10),
    Country VARCHAR(50),
    SubscriptionStatus VARCHAR(10),
    TotalWatchTime INT,
    Device VARCHAR(50)
);

CREATE TABLE Movies (
    MovieID INT PRIMARY KEY,
    Title VARCHAR(255),
    YearOfProduction INT,
    Genres VARCHAR(255),
    Language VARCHAR(50),
    Country VARCHAR(50),
    TotalViews INT
);

CREATE TABLE Ratings (
    RatingID INT PRIMARY KEY AUTO_INCREMENT,
    UserID VARCHAR(50),
    MovieID INT,
    Rating DOUBLE CHECK (Rating BETWEEN 1 AND 5),
    Timestamp DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (UserID) REFERENCES Users(UserID) ON DELETE CASCADE,
    FOREIGN KEY (MovieID) REFERENCES Movies(MovieID) ON DELETE CASCADE
);

-- Retrieve ratings for movies rated by subscribed users
SELECT u.UserID, u.Age, m.Title, r.Rating
FROM Ratings r
JOIN Users u ON r.UserID = u.UserID
JOIN Movies m ON r.MovieID = m.MovieID
WHERE u.subscriptionstatus = 'subscriber';
select * from movies;
select * from users;
select * from ratings;


-- 	Retrieve movies rated by a specific user
SELECT UserID, Title, Rating
FROM movies m
JOIN ratings r 
ON 
r.MovieID = m.MovieID
Where UserID = "SF_1600"

