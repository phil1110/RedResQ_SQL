USE RedResQ
GO

CREATE TABLE Article
(
    [ID] BIGINT not null primary key IDENTITY(1,1),
    [title] VARCHAR(255) not null,
    [content] VARCHAR(max) not null,
    [author] varchar(255) not null,
    [date] datetime not null,
    [LanguageID] BIGINT not null FOREIGN key REFERENCES [Language](ID),
    [ImageID] BIGINT foreign key references [Image](ID),
    [CountryID] bigint foreign key references [Country](ID)
);
GO