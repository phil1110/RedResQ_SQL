create type GivenAnswerType
as Table
    (
        [QuizID] bigint,
        [UserID] bigint,
        [QuestionID] bigint,
        [AnswerID] bigint
    )
go;