use RedResQ
go;

create procedure SP_Qz_FetchQuizzes
    @amount int = 25,
    @id bigint = 0
as
    select top(@amount) q.ID, q.name, q.maxScore, q.TypeID, qt.ID as 'QuizTypeID', qt.name as 'QuizTypeName'
    from Quiz q
    left join QuizType qt
    on q.TypeID = qt.ID
    where q.ID > @id
    order by q.ID
go;

create procedure SP_Qz_GetQuiz
    @id bigint
as
    select *
    from V_Quiz
    where Quiz_ID = @id;
go

create procedure SP_Qz_AddQuiz
    @name varchar(1000),
    @maxScore int,
    @TypeID bigint,
    @Questions QuestionType readonly ,
    @Answers AnswerType readonly
as
    begin transaction;

    insert into Quiz (name, maxScore, TypeID)
    values (@name, @maxScore, @TypeID);

    declare @id bigint = SCOPE_IDENTITY();

    commit;


    insert into Question
    select @id, ID, text
    from @Questions;

    insert into Answer
    select @id, QuestionID, ID, text, isTrue
    from @Answers;
go;

create procedure SP_Qz_EditQuiz
    @id bigint,
    @name varchar(1000) = null,
    @maxScore int = null,
    @typeId bigint = null
as
    update Quiz
    set name = isnull(@name, name),
        maxScore = isnull(@maxScore, maxScore),
        TypeID = isnull(@typeId, TypeID)
    where ID = @id
go;

create proc SP_Qz_DeleteQuiz
    @id bigint
as
    delete from Quiz
    where ID = @id
go;