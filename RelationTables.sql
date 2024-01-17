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
    [QuizID] bigint not null,
    [QuestionID] BIGINT not null,
    [correctAnswerGiven] bit not null,
    foreign key ([QuizID], [QuestionID])
    references Question(QuizID, ID) on delete cascade
);
GO