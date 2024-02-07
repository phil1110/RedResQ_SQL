use RedResQ
go

create procedure SP_Cd_LogCoordinates
    @userId bigint,
    @latitude float,
    @longitude float,
    @token varchar(1000)
as
    if EXISTS(
        select *
        from Coordinates c
        where c.UserID = @userId
        )
        update Coordinates
        set Latitude = @latitude, Longitude = @longitude, NotificationToken = @token
        where UserID = @userId
    else
        insert into Coordinates(userid, latitude, longitude, notificationtoken)
        values (@userId, @latitude, @longitude, @token)
go;

create procedure SP_Cd_GetTokens
    @lat float,
    @lon float,
    @radius int
as
    declare @point geography = geography::Point(@lat, @lon, 4326);

    select c.NotificationToken
    from Coordinates c
    where @point.STDistance(geography::Point(c.Latitude, c.Longitude, 4326)) <= @radius
go;