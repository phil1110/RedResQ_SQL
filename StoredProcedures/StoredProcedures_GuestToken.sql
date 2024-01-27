use RedResQ
go

create procedure SP_Gu_LogGuestToken
    @ipAddress varchar(20),
    @timestamp datetime,
    @validUntil datetime
as
    insert into GuestToken
    values (@ipAddress, @timestamp, @validUntil)
go;

create procedure SP_Gu_GetIPAddresses
    @ipAddress varchar(20) = null
as
    select top 25 IpAddress, COUNT(*)
    from GuestToken
    where IpAddress > @ipAddress
    group by IpAddress
    order by IpAddress
go;

create procedure SP_Gu_GetTokens
    @ipAddress varchar(20)
as
    select *
    from GuestToken
    where IpAddress = @ipAddress
go;