USE RedResQ
GO

CREATE TABLE Question
(
    [QuizID] BIGINT NOT NULL FOREIGN KEY REFERENCES Quiz(ID) on delete cascade,
    [ID] BIGINT NOT NULL,
    [text] VARCHAR(1000) NOT NULL,
    primary key ([QuizID], [ID])
);
GO