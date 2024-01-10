CREATE DATABASE RedResQ
GO

USE RedResQ
GO

CREATE TABLE Country
(
    [ID] BIGINT NOT NULL PRIMARY KEY IDENTITY(1,1),
    [country] VARCHAR(500) unique NOT NULL
);
GO

CREATE TABLE Location
(
    [ID] BIGINT NOT NULL PRIMARY KEY IDENTITY(1,1),
    [city] VARCHAR(255) NOT NULL,
    [postalCode] VARCHAR(255) NOT NULL,
    [CountryID] bigint not null foreign key references Country(ID)
);
GO

CREATE TABLE Language
(
    [ID] BIGINT NOT NULL PRIMARY KEY IDENTITY(1,1),
    [name] VARCHAR(1000) NOT NULL UNIQUE
);
GO

CREATE TABLE Image
(
    [ID] BIGINT NOT NULL PRIMARY KEY IDENTITY(1,1),
    [source] VARCHAR(1000) NOT NULL
);
GO

CREATE TABLE Quiz
(
    [ID] BIGINT NOT NULL PRIMARY KEY IDENTITY(1,1),
    [name] VARCHAR(1000) NOT NULL,
    [maxScore] int NOT NULL
);
GO

CREATE TABLE Question
(
    [ID] BIGINT NOT NULL PRIMARY KEY IDENTITY(1,1),
    [text] VARCHAR(1000) NOT NULL,
    [QuizID] BIGINT NOT NULL FOREIGN KEY REFERENCES Quiz(ID)
);
GO

CREATE TABLE Answer
(
    [ID] BIGINT NOT NULL PRIMARY KEY IDENTITY(1,1),
    [text] VARCHAR(1000) NOT NULL,
    [isTrue] bit NOT NULL,
    [QuestionID] BIGINT NOT NULL FOREIGN KEY REFERENCES Question(ID)
);
GO

CREATE TABLE Article
(
    [ID] BIGINT not null primary key IDENTITY(1,1),
    [title] VARCHAR(255) not null,
    [content] VARCHAR(max) not null,
    [author] varchar(255) not null,
    [date] datetime not null,
    [LanguageID] BIGINT not null FOREIGN key REFERENCES [Language](ID),
    [ImageID] BIGINT foreign key references [Image](ID),
    [LocationID] BIGINT FOREIGN KEY REFERENCES [Location](ID)
);
GO

create table Role
(
    [ID] BIGINT not null PRIMARY KEY identity(1,1),
    [name] varchar(255) not null unique
)

create table Gender
(
    [ID] BIGINT not null PRIMARY KEY identity (1,1),
    [name] varchar(255) not null
)

create table Person
(
    [ID] bigint primary key identity(1,1),
    [username] VARCHAR(255) not null unique,
    [firstname] VARCHAR(255),
    [lastname] VARCHAR(255),
    [email] VARCHAR(1000) not null UNIQUE,
    [birthdate] datetime not null,
    [hash] varchar(1000) not null,
    [GenderID] bigint not null foreign key references [Gender](ID),
    [LanguageID] BIGINT FOREIGN key REFERENCES [Language](ID),
    [LocationID] BIGINT FOREIGN KEY REFERENCES [Location](ID),
    [RoleID] BIGINT foreign key references [Role](ID)
);
GO

create table ResetRequests
(
    [ID] BIGINT not null primary key identity(1,1),
    [ConfirmationCode] int not null,
    [CreationDate] datetime not null,
    [ExpirationDate] datetime,
    [PersonUsername] VARCHAR(255) not null foreign key references Person(username) ON DELETE CASCADE
);
Go

create table Permission
(
    [PermissionName] varchar(500) primary key not null,
    [RoleID] bigint foreign key references Role(ID) ON DELETE CASCADE
);
GO

create table Access
(
    [TokenType] varchar(10) not null,
    [Timestamp] datetime not null,
    [IpAddress] varchar(20) not null,
    [UserID] bigint foreign key references Person(ID) on delete cascade,
    [URL] varchar(500) not null,
    [Method] varchar(20) not null
);
GO

create table GuestTokens
(
    [IpAddress] varchar(20) not null,
    [TimeStamp] datetime not null,
    [ValidUntil] datetime not null
);
GO

create table AccessTokens
(
    [IpAddress] varchar(20) not null,
    [TimeStamp] datetime not null,
    [ValidUntil] datetime not null,
    [UserID] bigint foreign key references Person(ID) on delete cascade not null
);
GO
