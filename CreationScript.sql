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
    [name] VARCHAR(255) NOT NULL UNIQUE
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
    [isTrue] bit NOT NULL,
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

create table Role
(
    [ID] int not null PRIMARY KEY identity(1,1),
    [name] varchar not null unique
)

create table Person
(
    [ID] int not null PRIMARY key IDENTITY(1,1),
    [username] VARCHAR(20) not null UNIQUE,
    [firstname] VARCHAR(20),
    [lastname] VARCHAR(20),
    [email] VARCHAR(255) not null UNIQUE,
    [birthdate] date not null,
    [password] varchar(30) not null,
    [sex] varchar(10) not null,
    [LanguageID] int not null FOREIGN key REFERENCES [Language](ID),
    [LocationID] int FOREIGN KEY REFERENCES [Location](ID),
    [RoleID] int foreign key references [Role](ID)
);
GO

create table Session
(
    [ID] int not null PRIMARY key IDENTITY(1,1),
    [DeviceID] varchar(255) UNIQUE,
    [PersonID] int foreign key references Person(ID)
);
GO

create table Liked
(
    [PersonID] int FOREIGN key REFERENCES Person(ID),
    [ArticleID] int FOREIGN KEY REFERENCES Article(ID)
);
GO

create table HasSeen
(
    [PersonID] int foreign key REFERENCES Person(ID),
    [ArticleID] int FOREIGN KEY REFERENCES Article(ID)
);
GO

create table HasDone
(
    [PersonID] int FOREIGN key REFERENCES Person(ID),
    [QuizID] int FOREIGN KEY REFERENCES Quiz(ID),
    [score] int not null
);
GO

create table Answered
(
    [PersonID] int FOREIGN KEY REFERENCES Person(ID),
    [QuestionID] int FOREIGN KEY REFERENCES Question(ID),
    [correctAnswerGiven] bit not null
);
GO