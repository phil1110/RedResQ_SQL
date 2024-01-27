USE RedResQ
GO

CREATE TABLE Quiz
(
    [ID] BIGINT NOT NULL PRIMARY KEY IDENTITY(1,1),
    [name] VARCHAR(1000) NOT NULL,
    [maxScore] int NOT NULL,
    [TypeID] bigint foreign key references QuizType(ID) on delete set null
);
GO