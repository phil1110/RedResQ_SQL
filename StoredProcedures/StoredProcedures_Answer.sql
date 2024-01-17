create procedure SP_An_GetAnswersForQuestion
    @questionId bigint
as
    select *
    from Answer
    where QuestionID = @questionId
go;