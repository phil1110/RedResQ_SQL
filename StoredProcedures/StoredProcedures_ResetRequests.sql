create procedure SP_Pe_RequestPasswordReset
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

    return @confirmationCode;
go;

create procedure SP_Pe_ConfirmPasswordReset
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

            return 1;
        end
    else
        begin
            return 0;
        end
go;
