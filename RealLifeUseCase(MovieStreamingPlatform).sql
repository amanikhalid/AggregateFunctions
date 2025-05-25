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

