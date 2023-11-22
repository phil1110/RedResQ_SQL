create table R_Liked
(
    [PersonUsername] VARCHAR(255) FOREIGN key REFERENCES Person(username),
    [ArticleID] int FOREIGN KEY REFERENCES Article(ID)
);
GO

create table R_HasSeen
(
    [PersonUsername] VARCHAR(255) foreign key REFERENCES Person(username),
    [ArticleID] int FOREIGN KEY REFERENCES Article(ID)
);
GO

create table R_HasDone
(
    [PersonUsername] VARCHAR(255) FOREIGN key REFERENCES Person(username),
    [QuizID] int FOREIGN KEY REFERENCES Quiz(ID),
    [score] int not null
);
GO

create table R_Answered
(
    [PersonUsername] VARCHAR(255) FOREIGN KEY REFERENCES Person(username),
    [QuestionID] int FOREIGN KEY REFERENCES Question(ID),
    [correctAnswerGiven] bit not null
);
GO