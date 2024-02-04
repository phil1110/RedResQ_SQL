use RedResQ
go

create table Attempt(
    ID bigint not null,
    QuizID bigint foreign key references Quiz(ID) on delete cascade,
    UserID bigint foreign key references Person(ID) on delete cascade,
    primary key (ID, QuizID, UserID)
);
Go