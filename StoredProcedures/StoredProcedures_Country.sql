create procedure SP_Co_GetCountries
as
    select *
    from Country c
    order by c.country asc
go;

create procedure SP_Co_AddCountry
    @countryName varchar(500)
as
    insert into Country(country)
    values @countryName
go;