create procedure SP_Lo_GetLocation
    @id bigint
as
    select *
    from V_Location v
    where v.ID = @id
go;

create procedure SP_Lo_GetLocations
    @id bigint = null
as
    if (@id is null)
    begin
        select top 10 *
        from V_Location v
        order by v.ID asc;
    end
    else
    begin
        select top 10 *
        from V_Location v
        where v.ID > @id
        order by v.ID asc;
    end
go;