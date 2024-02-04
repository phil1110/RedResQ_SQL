use RedResQ
go

create table GivenAnswer(
    AttemptID bigint not null,
    QuizID bigint not null,
    UserID bigint not null,
    QuestionID bigint not null,
    AnswerID bigint not null,
    primary key (AttemptID, QuizID, UserID, QuestionID),
    foreign key (AttemptID, QuizID, UserID)
    references Attempt(ID, QuizID, UserID) on delete cascade,
    foreign key (QuizID, QuestionID, AnswerID)
    references Answer(QuizID, QuestionID, ID) on delete no action
);
Go
