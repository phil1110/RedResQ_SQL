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
    (@username, @firstname, @lastname, @email, Convert(datetime, @birthdate), @hash, @gender, @languageId,
    @locationId, @roleId)
GO;

create procedure SP_Se_LoginEmail
    @email VARCHAR(1000)
AS
    select *
    from V_Login v
    where v.email = @email
GO;

create procedure SP_Se_LoginUsername
    @username VARCHAR(255)
as
    select *
    from V_Login v
    where v.username = @username
GO;