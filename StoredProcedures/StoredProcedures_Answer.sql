create procedure SP_An_GetAnswer
    @quizId bigint,
    @questionId bigint,
    @id bigint
as
    select *
    from Answer
    where QuizID = @quizId
    and QuestionID = @questionId
    and ID = @id
go;

create procedure SP_An_GetAnswersForQuestion
    @quizId bigint,
    @questionId bigint
as
    select *
    from Answer
    where QuizID = @quizId
    and QuestionID = @questionId
go;

create procedure SP_An_SearchAnswers
    @quizId bigint,
    @questionId bigint = null,
    @id bigint = null
as
    select *
    from Answer
    where QuizID = @quizId
    and (@questionId is null or QuestionID = @questionId)
    and (@id is null or ID = @id)
go;

create procedure SP_An_AddAnswer
    @quizId bigint,
    @questionId bigint,
    @id bigint,
    @text varchar(1000),
    @isTrue bit
as
    insert into Answer
    values (@quizId, @questionId, @id, @text, @isTrue)
go;

create procedure SP_An_DeleteAnswer
    @quizId bigint,
    @questionId bigint,
    @id bigint
as
    delete from Answer
    where QuizID = @quizId
    and QuestionID = @questionId
    and ID = @id
go;

create procedure SP_An_EditAnswer
    @quizId bigint,
    @questionId bigint,
    @id bigint,
    @text varchar(1000),
    @isTrue bit
as
    update Answer
    set text = @text, isTrue = @isTrue
    where QuizID = @quizId
    and QuestionID = @questionId
    and ID = @id
go;