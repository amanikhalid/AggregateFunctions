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