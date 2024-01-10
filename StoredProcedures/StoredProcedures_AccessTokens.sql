create procedure SP_AcTo_LogToken
    @ipAddress varchar(20),
    @timestamp datetime,
    @validUntil datetime,
    @userId bigint
as
    insert into AccessTokens
    values (@ipAddress, @timestamp, @validUntil, @userId)
go;

create procedure SP_AcTo_GetIpAddresses
    @ipAddress varchar(20) = null
as
    select top 25 IpAddress, COUNT(*)
    from AccessTokens
    where IpAddress > @ipAddress
    group by IpAddress
    order by IpAddress
go;

create procedure SP_AcTo_GetIpAccesses
    @ipAddress varchar(20)
as
    select *
    from AccessTokens
    where IpAddress = @ipAddress
    order by TimeStamp
go;

create procedure SP_AcTo_GetUsers
    @userId bigint = null
as
    select top 25 UserID, count(*)
    from AccessTokens
    where UserID > @userId
    group by UserID
    order by UserID
go;

create procedure SP_AcTo_GetUserAccesses
    @userId bigint
as
    select *
    from AccessTokens
    where UserID = @userId
    order by TimeStamp desc
go;