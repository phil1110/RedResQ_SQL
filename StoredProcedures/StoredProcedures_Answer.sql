use RedResQ
go;

create procedure SP_An_FetchAnswers
    @quizId bigint,
    @questionId bigint
as
    select *
    from Answer
    where QuizID = @quizId
    and QuestionID = @questionId
go;

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

create procedure SP_An_AddAnswer
    @quizId bigint,
    @questionId bigint,
    @id bigint,
    @text varchar(1000),
    @isTrue bit
as
    insert into Answer (QuizID, QuestionID, ID, text, isTrue)
    values (@quizId, @questionId, @id, @text, @isTrue)
go;

create procedure SP_An_EditAnswer
    @quizId bigint,
    @questionId bigint,
    @id bigint,
    @text varchar(1000),
    @isTrue bit
as
    update Answer
    set text = @text,
        isTrue = @isTrue
    where QuizID = @quizId
    and QuestionID = @questionId
    and ID = @id
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