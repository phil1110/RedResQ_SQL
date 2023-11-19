create procedure SP_Se_Register
    @username VARCHAR(255),
    @firstname VARCHAR(255),
    @lastname VARCHAR(255),
    @email VARCHAR(1000),
    @birthdate DATETIME,
    @hash varchar(1000),
    @sex varchar(255),
    @languageId int,
    @locationId int,
    @roleId int
AS
INSERT INTO Person (username, firstname, lastname, email, birthdate, hash, sex, LanguageID, LocationID, RoleID) VALUES
(@username, @firstname, @lastname, @email, Convert(datetime, @birthdate), @hash, @sex, convert(int, @languageId),
 convert(int, @locationId), convert(int, @roleId))
GO;

create procedure SP_Se_LoginEmail
    @email VARCHAR(1000)
AS
select *
from V_Login l
where l.email = @email
GO;

create procedure SP_Se_LoginUsername
    @username VARCHAR(255)
as
select *
from V_Login l
where l.username = @username
GO;