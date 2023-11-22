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

create procedure SP_Pe_RequestPasswordReset
    @confirmationCode int,
    @creationDate datetime,
    @personUsername varchar(255)
as
    insert into ResetRequests (ConfirmationCode, CreationDate, PersonUsername)
    values (@confirmationCode, @creationDate, @personUsername)
go;