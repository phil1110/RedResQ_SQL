USE RedResQ
GO

create table QuizType
(
    [ID] BIGINT NOT NULL PRIMARY KEY IDENTITY(1,1),
    [name] varchar(20) not null
);
GO