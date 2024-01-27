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
    @description varchar(300),
    @bytes varbinary(max)
as
    if(NOT EXISTS (
        select *
        from Image
        where bytes = @bytes
    ))
    begin
        insert into Image ([Description],[bytes])
        values (@description, @bytes)
    end

    select ID
    from Image
    where bytes = @bytes
go;

create procedure SP_Im_DeleteImage
    @id bigint
as
    delete from Image
    where ID = @id
go;

create procedure SP_Im_SearchImage
    @desc varchar(300)
as
    select top 10 ID, Description
    from Image
    where Description like @desc
go;