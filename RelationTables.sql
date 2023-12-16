create table R_Liked
(
    [PersonUsername] VARCHAR(255) FOREIGN key REFERENCES Person(username) on delete cascade,
    [ArticleID] BIGINT FOREIGN KEY REFERENCES Article(ID) on delete cascade
);
GO

create table R_HasSeen
(
    [PersonUsername] VARCHAR(255) foreign key REFERENCES Person(username) on delete cascade,
    [ArticleID] BIGINT FOREIGN KEY REFERENCES Article(ID) on delete cascade
);
GO

create table R_HasDone
(
    [PersonUsername] VARCHAR(255) FOREIGN key REFERENCES Person(username) on delete cascade,
    [QuizID] BIGINT FOREIGN KEY REFERENCES Quiz(ID) on delete cascade,
    [score] BIGINT not null
);
GO

create table R_Answered
(
    [PersonUsername] VARCHAR(255) FOREIGN KEY REFERENCES Person(username) on delete cascade,
    [QuestionID] BIGINT FOREIGN KEY REFERENCES Question(ID) on delete cascade,
    [correctAnswerGiven] bit not null
);
GO