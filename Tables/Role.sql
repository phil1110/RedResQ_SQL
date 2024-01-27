USE RedResQ
GO

create table Role
(
    [ID] BIGINT not null PRIMARY KEY identity(1,1),
    [name] varchar(255) not null unique
);
GO