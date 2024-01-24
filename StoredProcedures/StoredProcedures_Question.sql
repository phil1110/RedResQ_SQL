create procedure SP_Qn_GetQuestion
    @quizId bigint,
    @id bigint
as
    select *
    from Question
    where QuizID = @quizId
    and ID = @id;