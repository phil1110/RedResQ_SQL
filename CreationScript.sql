CREATE DATABASE RedResQ
GO

USE RedResQ
GO


CREATE TABLE Location
(
    [ID] INT NOT NULL PRIMARY KEY IDENTITY(1,1),
    [country] VARCHAR(500) NOT NULL,
    [city] VARCHAR(255) NOT NULL,
    [postalCode] VARCHAR(255) NOT NULL
);
GO

CREATE TABLE Language
(
    [ID] INT NOT NULL PRIMARY KEY IDENTITY(1,1),
    [name] VARCHAR(1000) NOT NULL UNIQUE
);
GO

CREATE TABLE Image
(
    [ID] INT NOT NULL PRIMARY KEY IDENTITY(1,1),
    [source] VARCHAR(1000) NOT NULL
);
GO

CREATE TABLE Quiz
(
    [ID] INT NOT NULL PRIMARY KEY IDENTITY(1,1),
    [name] VARCHAR(1000) NOT NULL,
    [maxScore] int NOT NULL
);
GO

CREATE TABLE Question
(
    [ID] INT NOT NULL PRIMARY KEY IDENTITY(1,1),
    [text] VARCHAR(1000) NOT NULL,
    [QuizID] INT NOT NULL FOREIGN KEY REFERENCES Quiz(ID)
);
GO

CREATE TABLE Answer
(
    [ID] INT NOT NULL PRIMARY KEY IDENTITY(1,1),
    [text] VARCHAR(1000) NOT NULL,
    [isTrue] bit NOT NULL,
    [QuestionID] INT NOT NULL FOREIGN KEY REFERENCES Question(ID)
);
GO

CREATE TABLE Article
(
    [ID] int not null primary key IDENTITY(1,1),
    [title] VARCHAR(255) not null,
    [content] VARCHAR(max) not null,
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
    [name] varchar(255) not null unique
)

create table Person
(
    [username] VARCHAR(255) not null UNIQUE primary key,
    [firstname] VARCHAR(255),
    [lastname] VARCHAR(255),
    [email] VARCHAR(1000) not null UNIQUE,
    [birthdate] date not null,
    [hash] varchar(1000) not null,
    [sex] varchar(255) not null,
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

create table ResetRequests
(
    [ID] int not null primary key identity(1,1),
    [ConfirmationCode] int not null,
    [CreationDate] date not null,
    [PersonID] int not null foreign key references Person(ID)
);
Go


