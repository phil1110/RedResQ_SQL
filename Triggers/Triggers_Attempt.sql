use RedResQ
go;

create trigger InsertScore
on Attempt
after INSERT
as
    declare @quizId bigint = (select i.QuizID from inserted i);
    declare @userId bigint = (select i.UserID from inserted i);
    declare @attemptId bigint = (select i.ID from inserted i);
    declare @score int;

    exec SP_At_GetResult @quizId = @quizId, @userId = @userId, @attemptId = @attemptId, @score = @score output;

    insert into AttemptScore (AttemptID, QuizID, UserID, Score)
    values (@attemptId, @quizId, @userId, @score)
go;