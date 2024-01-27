USE RedResQ
GO

CREATE TABLE Image
(
    [ID] BIGINT NOT NULL PRIMARY KEY IDENTITY(1,1),
    [Description] varchar(300) not null,
    [bytes] varbinary(max) NOT NULL
);
GO