use RedResQ
go

create table AttemptScore(
    [AttemptID] bigint not null,
    [QuizID] bigint,
    [UserID] bigint,
    [Score] int not null
    primary key ([AttemptID], [QuizID], [UserID]),
    foreign key ([AttemptID], [QuizID], [UserID])
    references Attempt(ID, QuizID, UserID) on delete cascade
);
Go