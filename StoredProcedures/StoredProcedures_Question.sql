use RedResQ
go;

create procedure SP_Qn_AddQuestion
    @quizId bigint,
    @id bigint,
    @text varchar(1000),
    @answers AnswerType readonly
as
    insert into Question (QuizID, ID, text)
    values (@quizId, @id, @text);

    insert into Answer
    select QuizID, QuestionID, ID, text, isTrue
    from @answers;
go;

create procedure SP_Qn_DeleteQuestion
    @quizId bigint,
    @id bigint
as
    delete from Question
    where QuizID = @quizId
    and ID = @id
go;