USE RedResQ
GO

create table Access
(
    [TokenType] varchar(10) not null,
    [Timestamp] datetime not null,
    [IpAddress] varchar(20) not null,
    [UserID] bigint foreign key references Person(ID) on delete cascade,
    [URL] varchar(500) not null,
    [Method] varchar(20) not null
);
GO