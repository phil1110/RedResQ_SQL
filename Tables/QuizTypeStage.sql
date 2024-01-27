USE RedResQ
GO

create table QuizTypeStage
(
    [QuizTypeID] bigint not null foreign key references QuizType(ID) on delete cascade,
    [Stage] int not null,
    [ImageID] bigint not null foreign key references Image(ID) on delete set null,
    primary key ([QuizTypeID], [Stage])
);
GO