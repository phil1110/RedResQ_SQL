create procedure Register
    @username VARCHAR(255),
    @firstname VARCHAR(255),
    @lastname VARCHAR(255),
    @email VARCHAR(1000),
    @birthdate date,
    @hash varchar(1000),
    @sex varchar(255),
    @languageId int,
    @locationId int,
    @roleId int
AS
INSERT INTO Person (username, firstname, lastname, email, birthdate, hash, sex, LanguageID, LocationID, RoleID) VALUES
(@username, @firstname, @lastname, @email, @birthdate, @hash, @sex, @languageId, @locationId, @roleId)
GO;

create procedure LoginEmail
    @email VARCHAR(1000),
    @hash VARCHAR(1000)
AS
select *
from V_Login
where