create table R_Liked
(
    [PersonID] bigint FOREIGN key REFERENCES Person(ID) on delete cascade,
    [ArticleID] BIGINT FOREIGN KEY REFERENCES Article(ID) on delete cascade
);
GO

create table R_HasSeen
(
    [PersonID] bigint foreign key REFERENCES Person(ID) on delete cascade,
    [ArticleID] BIGINT FOREIGN KEY REFERENCES Article(ID) on delete cascade
);
GO

create table R_HasDone
(
    [PersonID] bigint FOREIGN key REFERENCES Person(ID) on delete cascade,
    [QuizID] BIGINT FOREIGN KEY REFERENCES Quiz(ID) on delete cascade,
    [score] BIGINT not null
);
GO

create table R_Answered
(
    [PersonID] bigint FOREIGN KEY REFERENCES Person(ID) on delete cascade,
    [QuestionID] BIGINT FOREIGN KEY REFERENCES Question(ID) on delete cascade,
    [correctAnswerGiven] bit not null
);
GO