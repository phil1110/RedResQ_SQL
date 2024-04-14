use RedResQ
go

create procedure SP_Qt_FetchQuizTypes
    @name varchar(20) = null
as
    select *
    from QuizType
    where (name like '%' + @name + '%' or @name is null)
    order by ID
go;

create procedure SP_Qt_GetQuizType
    @id bigint
as
    select *
    from QuizType
    where ID = @id
go;

create procedure SP_Qt_AddQuizType
    @name varchar(20)
as
    insert into QuizType (name)
    values (@name)
go;

create procedure SP_Qt_EditQuizType
    @id bigint,
    @name varchar(20)
as
    update QuizType
    set name = @name
    where ID = @id
go;

create procedure SP_Qt_DeleteQuizType
    @id bigint
as
    delete from QuizType
    where ID = @id
go;