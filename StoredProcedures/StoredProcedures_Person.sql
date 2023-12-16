create procedure SP_Pe_ConfirmIdentity
    @email VARCHAR(1000)
as
    select p.hash
    from Person p
    where p.email = @email
go;

create procedure SP_Pe_GetUsername
    @email varchar(1000)
as
    select p.username
    from Person p
    where p.email = @email
go;

create procedure SP_Pe_SetPassword
    @email varchar(1000),
    @hash varchar(1000)
as
    update Person
    set hash = @hash
    where email = @email
go;

create procedure SP_Pe_GetHash
    @id bigint
as
    select p.hash
    from Person p
    where p.ID = @id
GO;

create procedure SP_Pe_GetID
    @username varchar(255)
as
    select p.ID
    from Person p
    where p.username = @username
go;

create procedure SP_Pe_FetchUsers
    @id bigint = 0,
    @amount int = 10
as
    select top (@amount) *
    from V_Login v
    where v.PersonID > @id
    order by v.PersonID
go;

create procedure SP_Pe_GetUser
    @id bigint
as
    select *
    from V_Login v
    where v.PersonID = @id
go;

create procedure SP_Pe_EditUser
    @id bigint,
    @username varchar(255) = null,
    @firstname varchar(255) = null,
    @lastname varchar(255) = null,
    @email varchar(1000) = null,
    @birthdate datetime = null,
    @genderId bigint = null,
    @languageId bigint = null,
    @locationId bigint = null
as
    update Person
    set
        username = COALESCE(@username, username),
        firstname = COALESCE(@firstname, firstname),
        lastname = COALESCE(@lastname, lastname),
        email = COALESCE(@email, email),
        birthdate = COALESCE(@birthdate, birthdate),
        GenderID = COALESCE(@genderId, GenderID),
        LanguageID = COALESCE(@languageId, LanguageID),
        LocationID = COALESCE(@locationId, LocationID)
    where ID = @id;
go;

create procedure SP_Pe_DeleteUser
    @id bigint
as
    delete
    from Person
    where ID = @id
go;