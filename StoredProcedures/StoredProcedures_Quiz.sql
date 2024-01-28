use RedResQ
go;

create procedure SP_Qz_GetQuiz
    @id bigint
as
    select *
    from V_Quiz
    where Quiz_ID = @id;
go