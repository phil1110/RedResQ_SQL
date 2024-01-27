use RedResQ
go

create table ArticleClick
(
    [PersonID] bigint foreign key REFERENCES Person(ID) on delete cascade,
    [ArticleID] BIGINT FOREIGN KEY REFERENCES Article(ID) on delete cascade
);
GO