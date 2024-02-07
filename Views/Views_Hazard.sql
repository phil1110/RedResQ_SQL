use RedResQ
go

create view V_Hazard
as
    select hz.ID, Title, Latitude, Longitude, Radius, TimeStamp, ht.ID as 'HazardTypeID', Name
    from Hazard hz
    inner join dbo.HazardType ht
    on ht.ID = hz.HazardType
go;