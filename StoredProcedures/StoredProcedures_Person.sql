use RedResQ
go

create procedure SP_Pe_ConfirmIdentity
    @email VARCHAR(1000)
as
    select p.hash
    from Person p
    where p.email = @email
go;

create procedure SP_Pe_GetId
    @email varchar(1000)
as
    select p.ID
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
    @personId int
as
    insert into ResetRequests (ConfirmationCode, CreationDate, PersonID)
    values (@confirmationCode, @creationDate, @personId)
go;