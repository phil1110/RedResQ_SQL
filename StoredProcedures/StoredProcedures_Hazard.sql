use RedResQ
go

create procedure SP_Hz_GetHazard
    @id bigint
as
    select *
    from V_Hazard
    where ID = @id
go;

create procedure SP_Hz_FetchHazards
    @id bigint = null,
    @amount int = 25
as
    if @id is null
    begin
        select top(@amount) *
        from V_Hazard
        order by ID desc
    end
    else
    begin
        select top(@amount) *
        from V_Hazard
        where ID < @id
        order by ID desc
    end
go;

create procedure SP_Hz_AddHazard
    @title varchar(500),
    @lat float,
    @lon float,
    @radius int,
    @typeId int
as
    declare @timestamp datetime = current_timestamp;

    begin transaction;

    insert into Hazard (Title, Latitude, Longitude, Radius, TimeStamp, HazardType)
    values (@title, @lat, @lon, @radius, @timestamp, @typeId);

    declare @id bigint = SCOPE_IDENTITY()

    commit;

    select @id;
go;

create procedure SP_Hz_EditHazard
    @id bigint,
    @title varchar(500) = null,
    @lat float = null,
    @lon float = null,
    @radius int = null,
    @typeId int = null
as
    update Hazard
    set Title = isnull(@title, Title), Latitude = isnull(@lat, Latitude), Longitude = isnull(@lon, Longitude),
        Radius = isnull(@radius, Radius), HazardType = isnull(@typeId, HazardType)
    where ID = @id
go;

create procedure SP_Hz_DeleteHazard
    @id bigint
as
    delete from Hazard
    where ID = @id
go;