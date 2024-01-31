create type AnswerType
as Table
    (
        [QuizID] bigint,
        [QuestionID] BIGINT,
        [ID] BIGINT,
        [text] VARCHAR(1000),
        [isTrue] bit
    )
go;