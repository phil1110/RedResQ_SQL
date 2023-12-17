create procedure SP_Ro_GetRole
    @id bigint
as
    select *
    from Role r
    where r.ID = @id
go;

create procedure SP_Ro_GetAllRoles
as
    select *
    from Role
go;