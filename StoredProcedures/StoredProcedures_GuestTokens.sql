create procedure SP_Gu_LogGuestToken
    @ipAddress varchar(20),
    @timestamp datetime,
    @validUntil datetime
as
    insert into GuestTokens
    values (@ipAddress, @timestamp, @validUntil)
go;

create procedure SP_Gu_GetIPAddresses
    @ipAddress varchar(20) = null
as
    select top 25 IpAddress, COUNT(*)
    from GuestTokens
    where IpAddress > @ipAddress
    group by IpAddress
    order by IpAddress
go;

create procedure SP_Gu_GetTokens
    @ipAddress varchar(20)
as
    select *
    from GuestTokens
    where IpAddress = @ipAddress
go;