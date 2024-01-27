USE RedResQ
GO

create table ResetRequest
(
    [ID] BIGINT not null primary key identity(1,1),
    [ConfirmationCode] int not null,
    [CreationDate] datetime not null,
    [ExpirationDate] datetime,
    [PersonUsername] VARCHAR(255) not null foreign key references Person(username) ON DELETE CASCADE
);
Go
