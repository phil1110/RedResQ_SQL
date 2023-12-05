create procedure SP_Rr_RequestPasswordReset
    @personEmail varchar(1000)
as
    Declare @confirmationCode as int = (
        Select ROUND(RAND() * 1000000, 0)
    );
    DECLARE @creationDate as datetime = (
        SELECT CURRENT_TIMESTAMP
    );
    Declare @personUsername as varchar(255) = (
        select p.username
        from Person p
        where p.email = @personEmail
    );

    insert into ResetRequests (ConfirmationCode, CreationDate,PersonUsername)
    values (@confirmationCode, @creationDate, @personUsername);

    select @confirmationCode as 'confirmationCode';
go;

create procedure SP_Rr_ConfirmPasswordReset
    @confirmationCode int,
    @personEmail varchar(255),
    @hash varchar(1000)
as
    Declare @personUsername as varchar(255) = (
        select p.username
        from Person p
        where p.email = @personEmail
    );
    Declare @currentDateTime as datetime = (
        Select CURRENT_TIMESTAMP
    );

    if EXISTS(
        select *
        from ResetRequests r
        where r.PersonUsername = @personUsername
        and r.ConfirmationCode = @confirmationCode
        and r.CreationDate < @currentDateTime
        and @currentDateTime < r.ExpirationDate
    )
        Begin
            update Person
            set hash = @hash
            where username = @personUsername;

            select 1 as 'output';
        end
    else
        begin
            select 0 as 'output';
        end
go;

create procedure SP_Rr_CheckValidity
    @confirmationCode int,
    @personEmail varchar(255)
as
    Declare @currentDateTime as datetime = (
        Select CURRENT_TIMESTAMP
    );

    if EXISTS(
        select *
        from ResetRequests r
        left join Person p
        on r.PersonUsername = p.username
        where r.CreationDate < @currentDateTime
        and @currentDateTime < r.ExpirationDate
        and r.ConfirmationCode = @confirmationCode
        and p.email = @personEmail
    )
        begin
            select 1 as 'output';
        end
    else
        begin
            select 0 as 'output';
        end
go;