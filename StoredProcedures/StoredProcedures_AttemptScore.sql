use RedResQ
go

create procedure SP_As_GetResult
    @attemptId bigint,
    @quizId bigint,
    @userId bigint
as
begin
    select Score
    from AttemptScore
    where AttemptID = @attemptId
    and QuizID = @quizId
    and UserID = @userId
end
go;