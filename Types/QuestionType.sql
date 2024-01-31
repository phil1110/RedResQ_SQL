create type QuestionType
as TABLE (
    [QuizID] BIGINT,
    [ID] BIGINT,
    [text] VARCHAR(1000)
         )
go;