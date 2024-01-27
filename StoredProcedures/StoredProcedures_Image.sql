use RedResQ
go

create procedure SP_Im_GetImage
    @id bigint
as
    select *
    from Image
    where ID = @id
go;

create procedure SP_Im_AddImage
    @base64 varchar(max)
as
    if(NOT EXISTS (
        select *
        from Image
        where base64 = @base64
    ))
    begin
        insert into Image ([base64])
        values (@base64)
    end
go;

create procedure SP_Im_DeleteImage
    @id bigint
as
    delete from Image
    where ID = @id
go;

create procedure SP_Im_SearchImage
    @base64 varchar(max)
as
    select *
    from Image
    where base64 = @base64
go;