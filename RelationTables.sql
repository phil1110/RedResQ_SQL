create table R_HasLikedArticle
(
    [PersonID] bigint FOREIGN key REFERENCES Person(ID) on delete cascade,
    [ArticleID] BIGINT FOREIGN KEY REFERENCES Article(ID) on delete cascade
);
GO

create table R_HasSeenArticle
(
    [PersonID] bigint foreign key REFERENCES Person(ID) on delete cascade,
    [ArticleID] BIGINT FOREIGN KEY REFERENCES Article(ID) on delete cascade
);
GO

create table R_HasDoneQuiz
(
    [PersonID] bigint FOREIGN key REFERENCES Person(ID) on delete cascade,
    [QuizID] BIGINT FOREIGN KEY REFERENCES Quiz(ID) on delete cascade,
    [score] BIGINT not null
);
GO

create table R_HasAnsweredQuestion
(
    [PersonID] bigint FOREIGN KEY REFERENCES Person(ID) on delete cascade,
    [QuestionID] BIGINT FOREIGN KEY REFERENCES Question(ID) on delete cascade,
    [correctAnswerGiven] bit not null
);
GO