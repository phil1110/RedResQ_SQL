USE RedResQ
GO

create table GuestToken
(
    [IpAddress] varchar(20) not null,
    [TimeStamp] datetime not null,
    [ValidUntil] datetime not null
);
GO