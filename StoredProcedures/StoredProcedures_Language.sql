use RedResQ
go

create procedure SP_La_GetAllLanguages
as
    select *
    from Language
    order by name asc
go;

create procedure SP_La_GetLanguage
    @id bigint
as
    select *
    from Language
    where ID = @id
go;

create procedure SP_La_AddLanguage
    @languageName varchar(1000)
as
    insert into Language (name)
    values (@languageName)
go;

create procedure SP_La_EditProcedure
    @id bigint,
    @languageName varchar(1000)
as
    update Language
    set name = @languageName
    where ID = @id
go;

create procedure SP_La_DeleteProcedure
    @id bigint
as
    delete
    from Language
    where id = @id
go;