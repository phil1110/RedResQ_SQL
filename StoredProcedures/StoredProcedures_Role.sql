create procedure SP_Ro_GetRole
    @id bigint
as
    select *
    from Role r
    where r.ID = @id
go;