create table R_Liked
(
    [PersonID] int FOREIGN key REFERENCES Person(ID),
    [ArticleID] int FOREIGN KEY REFERENCES Article(ID)
);
GO

create table R_HasSeen
(
    [PersonID] int foreign key REFERENCES Person(ID),
    [ArticleID] int FOREIGN KEY REFERENCES Article(ID)
);
GO

create table R_HasDone
(
    [PersonID] int FOREIGN key REFERENCES Person(ID),
    [QuizID] int FOREIGN KEY REFERENCES Quiz(ID),
    [score] int not null
);
GO

create table R_Answered
(
    [PersonID] int FOREIGN KEY REFERENCES Person(ID),
    [QuestionID] int FOREIGN KEY REFERENCES Question(ID),
    [correctAnswerGiven] bit not null
);
GO