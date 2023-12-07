create procedure SP_Co_GetCountries
as
    select *
    from Country co
    order by co.country asc
go;