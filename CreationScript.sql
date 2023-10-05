CREATE DATABASE RedResQ
GO

USE RedResQ
GO

CREATE TABLE Location
(
    [ID] INT NOT NULL PRIMARY KEY IDENTITY(1,1),
    [country] VARCHAR(255) NOT NULL,
    [region] VARCHAR(255) NOT NULL,
    [place] VARCHAR(255) NOT NULL,
    [postalCode] VARCHAR(255) NOT NULL
);
GO

CREATE TABLE Language
(
    [ID] INT NOT NULL PRIMARY KEY IDENTITY(1,1),
    [name] VARCHAR(255) NOT NULL
);
GO

CREATE TABLE Image
(
    [ID] INT NOT NULL PRIMARY KEY IDENTITY(1,1),
    [source] VARCHAR(255) NOT NULL
);
GO

CREATE TABLE Quiz
(
    [ID] INT NOT NULL PRIMARY KEY IDENTITY(1,1),
    [name] VARCHAR(10) NOT NULL,
    [maxScore] int NOT NULL
);
GO

CREATE TABLE Question
(
    [ID] INT NOT NULL PRIMARY KEY IDENTITY(1,1),
    [text] VARCHAR(20) NOT NULL,
    [QuizID] INT NOT NULL FOREIGN KEY REFERENCES Quiz(ID)
);
GO

CREATE TABLE Answer
(
    [ID] INT NOT NULL PRIMARY KEY IDENTITY(1,1),
    [text] VARCHAR(10) NOT NULL,
    [isT rue] bit NOT NULL,
    [QuestionID] INT NOT NULL FOREIGN KEY REFERENCES Question(ID)
);
GO

CREATE TABLE Article
(
    [ID] int not null primary key IDENTITY(1,1),
    [title] VARCHAR(255) not null,
    [content] VARCHAR(255) not null,
    [author] varchar(255) not null,
    [date] date not null,
    [LanguageID] int not null FOREIGN key REFERENCES [Language](ID),
    [ImageID] int foreign key references [Image](ID),
    [LocationID] int FOREIGN KEY REFERENCES [Location](ID)
);
GO

create table Account
(
    [ID] int not null PRIMARY key IDENTITY(1,1),
    [username] VARCHAR(20) not null,
    [firstname] VARCHAR(20),
    [lastname] VARCHAR(20),
    [email] VARCHAR(255) not null,
    [birthdate] date not null,
    [password] varchar(30) not null,
    [sex] varchar(10) not null,
    [LanguageID] int not null FOREIGN key REFERENCES [Language](ID),
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