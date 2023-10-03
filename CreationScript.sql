CREATE DATABASE RedResQ;

USE RedResQ;

CREATE TABLE Location
(
    ID INT NOT NULL AUTO_INCREMENT,
    Country VARCHAR(255) NOT NULL,
    region VARCHAR(255) NOT NULL,
    place VARCHAR(255) NOT NULL,
    postalCode VARCHAR(255) NOT NULL,
    PRIMARY KEY (ID)
);

CREATE TABLE Language
(
    ID INT NOT NULL AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL,
    PRIMARY KEY (ID)
);

CREATE TABLE Image
(
    ID INT NOT NULL AUTO_INCREMENT,
    source VARCHAR(255) NOT NULL,
    PRIMARY KEY (ID)
);

CREATE TABLE Quiz
(
    ID INT NOT NULL AUTO_INCREMENT,
    name VARCHAR(10) NOT NULL,
    maxScore int NOT NULL,
    PRIMARY KEY (ID)
);

CREATE TABLE Question
(
    ID INT NOT NULL AUTO_INCREMENT,
    text VARCHAR(20) NOT NULL,
    QuizID int not null,
    PRIMARY KEY (ID),
    FOREIGN KEY (QuizID) REFERENCES Quiz(ID)
);

CREATE TABLE Answer
(
    ID INT NOT NULL AUTO_INCREMENT,
    text VARCHAR(10) NOT NULL,
    isTrue bit NOT NULL,
    QuestionID int not null,
    PRIMARY KEY (ID),
    FOREIGN KEY (QuestionID) REFERENCES Question(ID)
);

CREATE TABLE Article
(
    ID int not null AUTO_INCREMENT,
    title VARCHAR(255) not null,
    content VARCHAR(255) not null,
    author varchar(255) not null,
    date date not null,
    LanguageID int not null,
    ImageID int not null,
    LocationID int not null,
    primary key (ID),
    FOREIGN key (LanguageID) REFERENCES Language(ID),
    foreign key (ImageID) references Image(ID),
    FOREIGN KEY (LocationID) REFERENCES Location(ID)
);

create table Account
(
    ID int not null AUTO_INCREMENT,
    username VARCHAR(20) not null,
    firstname VARCHAR(20),
    lastname VARCHAR(20),
    email VARCHAR(255) not null,
    birthdate date not null,
    password varchar(30) not null,
    sex varchar(10) not null,
    LanguageID int not null,
    LocationID int not null,
    primary key (ID),
    FOREIGN key (LanguageID) REFERENCES Language(ID),
    FOREIGN KEY (LocationID) REFERENCES Location(ID)
);

create table Liked
(
    AccountID int not null,
    ArticleID int not null,
    FOREIGN key (AccountID) REFERENCES Account(ID),
    FOREIGN KEY (ArticleID) REFERENCES Article(ID)
);

create table HasSeen
(
    AccountID int not null,
    ArticleID int not null,
    foreign key (AccountID) REFERENCES Account(ID),
    FOREIGN KEY (ArticleID) REFERENCES Article(ID)
);

create table HasDone
(
    AccountID int not null,
    QuizID int not null,
    FOREIGN key (AccountID) REFERENCES Account(ID),
    FOREIGN KEY (QuizID) REFERENCES Quiz(ID),
    score int not null
);

create table Answered
(
    AccountID int not null,
    QuestionID int not null,
    FOREIGN KEY (AccountID) REFERENCES Account(ID),
    FOREIGN KEY (QuestionID) REFERENCES Question(ID),
    correctAnswerGiven bit not null
);
