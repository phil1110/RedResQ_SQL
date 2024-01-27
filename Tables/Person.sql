USE RedResQ
GO

create table Person
(
    [ID] bigint primary key identity(1,1),
    [username] VARCHAR(255) not null unique,
    [firstname] VARCHAR(255),
    [lastname] VARCHAR(255),
    [email] VARCHAR(1000) not null UNIQUE,
    [birthdate] datetime not null,
    [hash] varchar(1000) not null,
    [GenderID] bigint not null foreign key references [Gender](ID),
    [LanguageID] BIGINT FOREIGN key REFERENCES [Language](ID),
    [LocationID] BIGINT FOREIGN KEY REFERENCES [Location](ID),
    [RoleID] BIGINT foreign key references [Role](ID)
);
GO