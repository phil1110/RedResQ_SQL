use RedResQ
go

CREATE TABLE Answer
(
    [QuizID] bigint not null,
    [QuestionID] BIGINT NOT NULL,
    [ID] BIGINT NOT NULL,
    [text] VARCHAR(1000) NOT NULL,
    [isTrue] bit NOT NULL,
    primary key ([QuizID], [QuestionID], [ID]),
    foreign key ([QuizID], [QuestionID])
    references Question(QuizID, ID) on delete cascade
);
GO