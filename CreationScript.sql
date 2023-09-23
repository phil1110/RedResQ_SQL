CREATE DATABASE RedResQ
GO

USE RedResQ
GO

CREATE TABLE Location
(
    [ID] INT NOT NULL PRIMARY KEY,
    [country] VARCHAR(255) NOT NULL,
    [region] VARCHAR(255) NOT NULL,
    [place] VARCHAR(255) NOT NULL,
    [postalcode] VARCHAR(255) NOT NULL
);
GO

CREATE TABLE Language
(
    [ID] INT NOT NULL PRIMARY KEY,
    [name] VARCHAR(255) NOT NULL
);
GO

CREATE TABLE Image
(
    [ID] INT NOT NULL PRIMARY KEY,
    [source] VARCHAR(255) NOT NULL
);
GO

CREATE TABLE Quiz
(
    [ID] INT NOT NULL PRIMARY KEY,
    [name] VARCHAR(10) NOT NULL,
    [maxscore] int NOT NULL
);
GO

CREATE TABLE Question
(
    [ID] INT NOT NULL PRIMARY KEY,
    [text] VARCHAR(20) NOT NULL,
    [QuizID] INT FOREIGN KEY REFERENCES Quiz(ID) NOT NULL
);
GO

CREATE TABLE Answer
(
    [ID] INT NOT NULL PRIMARY KEY,
    [text] VARCHAR(10) NOT NULL,
    [istrue] bit NOT NULL,
    [QuestionID] INT FOREIGN KEY REFERENCES Question(ID) NOT NULL
);
GO

CREATE TABLE Article
(
    [ID] int not null primary key,
    [title] VARCHAR(255) not null,
    [content] VARCHAR(255) not null,
    [author] varchar(255) not null,
    [date] date not null,
    [LanguageID] int FOREIGN key REFERENCES [Language](ID) not null,
    [ImageID] int foreign key references [Image](ID),
    [LocationID] int FOREIGN KEY REFERENCES [Location](ID)
);
GO

create table Account
(
    [ID] int not null PRIMARY key,
    [username] VARCHAR(20) not null,
    [firstname] VARCHAR(20),
    [lastname] VARCHAR(20),
    [email] VARCHAR(255) not null,
    [birthdate] date not null,
    [password] varchar(30) not null,
    [sex] varchar(10) not null,
    [LanguageID] int FOREIGN key REFERENCES [Language](ID) not null,
    [LocationID] int FOREIGN KEY REFERENCES [Location](ID)
);
GO

create table Liked
(
    [AccountID] int FOREIGN key REFERENCES Account(ID),
    [ArticleID] int FOREIGN KEY REFERENCES Article(ID)
);
GO

create table HasSeen
(
    [AccountID] int foreign key REFERENCES Account(ID),
    [ArticleID] int FOREIGN KEY REFERENCES Article(ID)
);
GO

create table HasDone
(
    [AccountID] int FOREIGN key REFERENCES Account(ID),
    [QuizID] int FOREIGN KEY REFERENCES Quiz(ID),
    [score] int not null
);
GO

create table Answered
(
    [AccountID] int FOREIGN KEY REFERENCES Account(ID),
    [QuestionID] int FOREIGN KEY REFERENCES Question(ID),
    [correctAnswerGiven] bit not null
);
GO