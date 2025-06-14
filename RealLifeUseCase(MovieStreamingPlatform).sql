-- Movie Streaming Platform Analytics 
-- Schema

create database MovieStreamingPlatform

use MovieStreamingPlatform;

create table Users(
UserID INT PRIMARY KEY,
FullName VARCHAR(100),
Email VARCHAR(100),
JoinDate DATE,
SubscriptionType VARCHAR(20)  -- Free, Basic, Premium
);

create table Movies (
MovieID INT PRIMARY KEY,
Title VARCHAR(100),
Genre VARCHAR(50),
ReleaseYear INT,
DurationMinutes INT
);

create table WatchHistory (
WatchID INT PRIMARY KEY,
UserID INT FOREIGN KEY REFERENCES Users(UserID),
MovieID INT FOREIGN KEY REFERENCES Movies(MovieID),
WatchDate DATE,
WatchDuration INT -- in minutes
);

-- Sample Data Insertion

--Users
INSERT INTO Users (UserID, FullName, Email, JoinDate, SubscriptionType) VALUES
(1, 'Sara Al Amri', 'sara@example.com', '2024-01-20', 'Free'),
(2, 'Omar Al Balushi', 'omar@example.com', '2024-02-25', 'Premium'),
(3, 'Laila Al Habsi', 'laila@example.com', '2024-03-18', 'Basic'),
(4, 'Majid Al Nabhani', 'majid@example.com', '2024-04-10', 'Premium'),
(5, 'Aisha Al Siyabi', 'aisha@example.com', '2024-05-05', 'Free');

--Movies
INSERT INTO Movies (MovieID, Title, Genre, ReleaseYear, DurationMinutes) VALUES
(1, 'Desert Mirage', 'Adventure', 2023, 115),
(2, 'Voices of Oman', 'Documentary', 2021, 95),
(3, 'Speed Surge', 'Action', 2024, 125),
(4, 'Debug Diaries', 'Comedy', 2023, 100),
(5, 'Final Echo', 'Mystery', 2022, 108);

--Watch History
INSERT INTO WatchHistory (WatchID, UserID, MovieID, WatchDate, WatchDuration) VALUES
(1, 1, 2, '2025-05-15', 90),
(2, 2, 3, '2025-05-16', 110),
(3, 3, 5, '2025-05-16', 108),
(4, 4, 4, '2025-05-17', 95),
(5, 5, 1, '2025-05-18', 100);

--Requirement

--Beginner Level 

--1 Total Number of Users 
SELECT COUNT(*) AS 'Total Student' FROM Users;
-- 2. Average Duration of All Movies 
SELECT AVG(DurationMinutes) AS 'Average Duration' FROM Movies;
-- 3. Total Watch Time 
SELECT SUM(WatchDuration) AS 'Total Duration' FROM WatchHistory;
-- 4. Number of Movies per Genre 
SELECT COUNT(MovieID) as 'Number of Movies', Genre FROM Movies GROUP BY Genre
-- 5. Earliest User Join Date 
SELECT MAX(JoinDate) AS 'Earliest User Join Date' FROM Users
-- 6. Latest Movie Release Year 
 SELECT MIN(JoinDate) AS 'Earliest User Join Date' FROM Users

-- Intermediate Level 

-- 4. Number of Users Per Subscription Type 
SELECT COUNT(UserID) as 'Number of Users', SubscriptionType FROM Users GROUP BY SubscriptionType
-- 5. Total Watch Time per User 
SELECT SUM(WatchDuration) AS 'Total Watch Time' ,UserID FROM WatchHistory GROUP BY UserID;
-- 6. Average Watch Duration per Movie 
SELECT AVG(WatchDuration) AS 'Average Duration' , MovieID FROM WatchHistory GROUP BY MovieID;
-- 7. Average Watch Time per Subscription Type 
SELECT AVG(W.WatchDuration) as 'Average Watch Time', U.SubscriptionType FROM Users U INNER JOIN WatchHistory W ON W.UserID= U.UserID
GROUP BY SubscriptionType
-- 8. Number of Views per Movie (Including Zero) 
SELECT * FROM Movies
SELECT * FROM Users
SELECT * FROM WatchHistory
SELECT COUNT(WatchID) AS 'Number of Views' , MovieID FROM WatchHistory GROUP BY MovieID 
-- 9. Average Movie Duration per Release Year 
 SELECT AVG(DurationMinutes)AS 'Average Movie Duration' FROM Movies GROUP BY ReleaseYear

-- Advanced Level 

-- 7. Most Watched Movie 
SELECT  M.Title, COUNT(*) AS WatchCount
FROM WatchHistory WH
JOIN Movies M ON WH.MovieID = M.MovieID
GROUP BY M.Title
-- 8. Users Who Watched More Than 100 Minutes 
SELECT U.FullName, SUM(WH.WatchDuration) AS TotalWatchTime
FROM WatchHistory WH
JOIN Users U ON WH.UserID = U.UserID
GROUP BY U.FullName
HAVING SUM(WH.WatchDuration) > 100;
-- 9. Total Watch Time per Genre 
SELECT M.Genre, SUM(WH.WatchDuration) AS TotalWatchTime
FROM WatchHistory WH
JOIN Movies M ON WH.MovieID = M.MovieID
GROUP BY M.Genre;
-- 10. Identify Binge Watchers (Users Who Watched 2 or More Movies in One Day) 
SELECT U.FullName, WH.WatchDate, COUNT(*) AS MoviesWatched
FROM WatchHistory WH
JOIN Users U ON WH.UserID = U.UserID
GROUP BY U.FullName, WH.WatchDate
HAVING COUNT(*) >= 2
ORDER BY WH.WatchDate;
-- 11. Genre Popularity (Total Watch Duration by Genre) 
SELECT M.Genre, SUM(WH.WatchDuration) AS TotalDuration
FROM WatchHistory WH
JOIN Movies M ON WH.MovieID = M.MovieID
GROUP BY M.Genre
ORDER BY TotalDuration DESC;
-- 12. User Retention Insight: Number of Users Joined Each Month
SELECT 
  JoinDate AS JoinMonth,
  COUNT(*) AS NewUsers
FROM Users
GROUP BY JoinDate
ORDER BY JoinMonth;