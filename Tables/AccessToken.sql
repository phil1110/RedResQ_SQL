USE RedResQ
GO

create table AccessToken
(
    [IpAddress] varchar(20) not null,
    [TimeStamp] datetime not null,
    [ValidUntil] datetime not null,
    [UserID] bigint not null foreign key references Person(ID) on delete cascade
);
GO