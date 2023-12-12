create procedure SP_Lo_GetLocation
    @id bigint
as
    select *
    from V_Location v
    where v.ID = @id
go;

create procedure SP_Lo_SearchForLocation
    @city varchar(255),
    @postalCode varchar(255),
    @countryId bigint
as
    select lo.ID
    from Location lo
    where lo.city = @city
    and lo.postalCode = @postalCode
    and lo.CountryID = @countryId
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

create procedure SP_Lo_AddLocation
    @city varchar(255),
    @postalCode varchar(255),
    @countryId bigint
as
    insert into Location (city, postalCode, CountryID)
    values (@city, @postalCode, @countryId)
go;

create procedure SP_Lo_EditLocation
    @id bigint,
    @city varchar(255) = null,
    @postalCode varchar(255) = null,
    @countryId bigint = null
as
    if (@city is not null)
        begin
            update Location
            set city = @city
            where ID = @id;
        end
    if (@postalCode is not null)
        begin
            update Location
            set postalCode = @postalCode
            where ID = @id
        end
    if (@countryId is not null)
        begin
            update Location
            set CountryID = @countryId
            where ID = @id
        end
go;

create procedure SP_Lo_DeleteLocation
    @id bigint
as
    delete
    from Location
    where ID = @id
go;