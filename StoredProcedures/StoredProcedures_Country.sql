create procedure SP_Co_GetCountries
as
    select *
    from Country c
    order by c.country asc
go;

create procedure SP_Co_GetCountry
    @id bigint
as
    select *
    from Country c
    where c.ID = @id
    order by c.country asc
go;


create procedure SP_Co_AddCountry
    @countryName varchar(500)
as
    insert into Country(country)
    values (@countryName)
go;

create procedure SP_Co_EditCountry
    @id bigint,
    @countryName varchar(500)
as
    update Country
    set country = @countryName
    where ID = @id
go;

create procedure SP_Co_DeleteCountry
    @id bigint
as
    Delete from Country
    where ID = @id
go;