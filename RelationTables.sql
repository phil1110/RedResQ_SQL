create table R_Liked
(
    [PersonUsername] VARCHAR(255) FOREIGN key REFERENCES Person(username),
    [ArticleID] BIGINT FOREIGN KEY REFERENCES Article(ID)
);
GO

create table R_HasSeen
(
    [PersonUsername] VARCHAR(255) foreign key REFERENCES Person(username),
    [ArticleID] BIGINT FOREIGN KEY REFERENCES Article(ID)
);
GO

create table R_HasDone
(
    [PersonUsername] VARCHAR(255) FOREIGN key REFERENCES Person(username),
    [QuizID] BIGINT FOREIGN KEY REFERENCES Quiz(ID),
    [score] BIGINT not null
);
GO

create table R_Answered
(
    [PersonUsername] VARCHAR(255) FOREIGN KEY REFERENCES Person(username),
    [QuestionID] BIGINT FOREIGN KEY REFERENCES Question(ID),
    [correctAnswerGiven] bit not null
);
GO