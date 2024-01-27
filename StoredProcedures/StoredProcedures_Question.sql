use RedResQ
go

create procedure SP_Qn_GetQuestion
    @quizId bigint,
    @id bigint
as
    select