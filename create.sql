CREATE DATABASE IMDB;
USE IMDB;

CREATE TABLE Title (
  titleId VARCHAR(255) PRIMARY KEY,
  primaryTitle VARCHAR(255),
  originalTitle VARCHAR(255),
  titleType VARCHAR(255),
  isAdult BOOLEAN,
  startYear INT,
  endYear INT,
  runtimeMinutes INT
);

CREATE TABLE Genres (
  titleId VARCHAR(255) REFERENCES Title(titleId),
  genreName VARCHAR(255),
  PRIMARY KEY (titleId, genreName)
);

CREATE TABLE Person (
  personId VARCHAR(255),
  firstName VARCHAR(255),
  lastName VARCHAR(255),
  birthYear INT,
  deathYear INT,
  PRIMARY KEY (personId)
);

CREATE TABLE Profession (
  personId VARCHAR(255) REFERENCES Person(personId),
  professionName VARCHAR(255),
  PRIMARY KEY (personId, professionName)
);

CREATE TABLE KnownFor (
  personId VARCHAR(255) REFERENCES Person(personId),
  titleId VARCHAR(255) REFERENCES Title(titleId),
  PRIMARY KEY(personId, titleId)
);

CREATE TABLE WorkedOn (
  personId VARCHAR(255) REFERENCES Person(personId),
  titleId VARCHAR(255) REFERENCES Title(titleId),
  role VARCHAR(255),
  category VARCHAR(255),
  job VARCHAR(255),
  PRIMARY KEY(personId,titleId)
);

CREATE TABLE Ratings (
  titleId VARCHAR(255) REFERENCES Title(titleId),
  averageRating float,
  numVotes INT,
  PRIMARY KEY(titleId)
);
