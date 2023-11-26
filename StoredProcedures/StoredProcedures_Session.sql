create procedure SP_Se_Register
    @username VARCHAR(255),
    @firstname VARCHAR(255),
    @lastname VARCHAR(255),
    @email VARCHAR(1000),
    @birthdate DATETIME,
    @hash varchar(1000),
    @gender bigint,
    @languageId bigint,
    @locationId bigint,
    @roleId bigint
AS
    INSERT INTO Person (username, firstname, lastname, email, birthdate, hash, gender, LanguageID, LocationID, RoleID) VALUES
    (@username, @firstname, @lastname, @email, Convert(datetime, @birthdate), @hash, @gender, convert(int, @languageId),
    convert(int, @locationId), convert(int, @roleId))
GO;

create procedure SP_Se_LoginEmail
    @email VARCHAR(1000)
AS
    select username, firstname, lastname, email, birthdate, hash, gender,
           LanguageID, LocationID, RoleID
    from Person p
    where p.email = @email
GO;

create procedure SP_Se_LoginUsername
    @username VARCHAR(255)
as
    select username, firstname, lastname, email, birthdate, hash, gender,
           LanguageID, LocationID, RoleID
    from Person p
    where p.username = @username
GO;