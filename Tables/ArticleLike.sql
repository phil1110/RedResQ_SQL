Use RedResQ
GO

create table ArticleLike
(
    [PersonID] bigint FOREIGN key REFERENCES Person(ID) on delete cascade,
    [ArticleID] BIGINT FOREIGN KEY REFERENCES Article(ID) on delete cascade
);
GO