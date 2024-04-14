use RedResQ
go

create procedure SP_At_AddAttempt
    @quizId bigint,
    @userId bigint,
    @data GivenAnswerType readonly
as
    declare @id bigint = (
        select count_big(*) + 1
        from Attempt a
        where a.QuizID = @quizId
        and a.UserID = @userId
        );

    begin transaction;

    insert into Attempt(id, quizid, userid)
    values (@id, @quizId, @userId);

    insert into GivenAnswer
    select @id, @quizId, @userId, d.QuestionID, d.AnswerID
    from @data d;

    commit;

    exec SP_At_AddResult @attemptId = @id, @quizId = @quizId, @userId = @userId;

    select @id;
go;

create procedure SP_At_AddResult
    @attemptId bigint,
    @quizId bigint,
    @userId bigint
as
begin
    declare @score int;

    exec SP_At_GetResult @quizId = @quizId, @userId = @userId, @attemptId = @attemptId, @score = @score output;

    insert into AttemptScore (AttemptID, QuizID, UserID, Score)
    values (@attemptId, @quizId, @userId, @score)
end
go;



create procedure SP_At_GetResult
    @quizId bigint,
    @userId bigint,
    @attemptId bigint,
    @score int output -- Declare output parameter
as
begin
    declare @correctAnswers float = (
        select count(*)
        from GivenAnswer ga
        inner join dbo.Answer A
        on A.QuizID = ga.QuizID
        and A.QuestionID = ga.QuestionID
        and A.ID = ga.AnswerID
        where isTrue = 1
        and ga.QuizID = @quizId
        and ga.UserID = @userId
        and ga.AttemptID = @attemptId
    );

    declare @totalAnswers float = (
        select count(*)
        from GivenAnswer ga
        where ga.QuizID = @quizId
        and ga.UserID = @userId
        and ga.AttemptID = @attemptId
    );

    if (@totalAnswers = 0)
        set @totalAnswers = 1;

    set @score = (
        select round(q.maxScore * (@correctAnswers / @totalAnswers), 0)
        from GivenAnswer ga
        inner join Quiz q
        on ga.QuizID = q.ID
        where ga.QuizID = @quizId
        and ga.UserID = @userId
        and ga.AttemptID = @attemptId
        group by ga.QuizID, q.maxScore
    );
end
go;