USE RedResQ
GO

CREATE TABLE Location
(
    [ID] BIGINT NOT NULL PRIMARY KEY IDENTITY(1,1),
    [city] VARCHAR(255) NOT NULL,
    [postalCode] VARCHAR(255) NOT NULL,
    [CountryID] bigint not null foreign key references Country(ID)
);
GO