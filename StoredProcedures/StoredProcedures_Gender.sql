create procedure SP_Ge_GetAllGenders
as
    select *
    from Gender
    order by ID asc
go;

create procedure SP_Ge_GetGender
    @id bigint
as
    select *
    from Gender
    where ID = @id
    order by ID asc
go;

create procedure SP_Ge_AddGender
    @genderName varchar(255)
as
    insert into Gender (name)
    values (@genderName)
go;

create procedure SP_Ge_EditGender
    @id bigint,
    @genderName varchar(255)
as
    update Gender
    set name = @genderName
    where ID = @id
go;

create procedure SP_Ge_DeleteGender
    @id bigint
as
    delete from Gender
    where ID = @id
go;