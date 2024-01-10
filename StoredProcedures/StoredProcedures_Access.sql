create procedure SP_Ac_LogAccess
    @tokenType varchar(10),
    @timestamp datetime,
    @ipAddress varchar(20),
    @userId bigint = null,
    @url varchar(500),
    @method varchar(20)
as
    insert into Access
    VALUES (@tokenType, @timestamp, @ipAddress, @userId, @url, @method)
GO;

create procedure SP_Ac_GetIpAddresses
    @ipAddress varchar(20) = null
as
    select top 25 IpAddress, COUNT(*)
    from Access
    where IpAddress > @ipAddress
    group by IpAddress
    order by IpAddress
go;

create procedure SP_Ac_GetIpAccesses
    @ipAddress varchar(20)
as
    select *
    from Access
    where IpAddress = @ipAddress
    order by Timestamp desc
go;

create procedure SP_Ac_IpUserStats
    @ipAddress varchar(20)
as
    select IpAddress, UserID, COUNT(*)
    from Access
    where IpAddress = @ipAddress
    group by IpAddress, UserID
    order by UserID
go;

create procedure SP_Ac_GetUsers
    @userId bigint = null
as
    select top 25 UserID, count(*)
    from Access
    where UserID > @userId
    group by UserID
    order by UserID
go;

create procedure SP_Ac_GetUserAccesses
    @userId bigint
as
    select *
    from Access
    where UserID = @userId
    order by Timestamp desc
go;

create procedure SP_Ac_GetUserStats
    @userId bigint
as
    select UserID, IpAddress, count(*)
    from Access
    where UserID = @userId
    group by UserID, IpAddress
    order by IpAddress
go;