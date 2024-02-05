use RedResQ
go

create procedure SP_Cd_LogCoordinates
    @userId bigint,
    @longitude float,
    @latitude float,
    @token varchar(1000)
as
    if EXISTS(
        select *
        from Coordinates c
        where c.UserID = @userId
        )
        update Coordinates
        set Longitude = @longitude, Latitude = @latitude, NotificationToken = @token
        where UserID = @userId
    else
        insert into Coordinates(userid, longitude, latitude, notificationtoken)
        values (@userId, @longitude, @latitude, @token)
go;
