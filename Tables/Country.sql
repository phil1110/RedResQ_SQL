USE RedResQ
GO

CREATE TABLE Country
(
    [ID] BIGINT NOT NULL PRIMARY KEY IDENTITY(1,1),
    [country] VARCHAR(500) unique NOT NULL
);
GO