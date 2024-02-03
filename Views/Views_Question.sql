use RedResQ
go;

create view V_Question
as
    select q.QuizID as 'QuestionQuizID', q.ID as 'QuestionID', q.text as 'QuestionText', a.QuizID as 'AnswerQuizID',
           a.QuestionID as 'AnswerQuestionID', a.ID as 'AnswerID', a.text as 'AnswerText', a.isTrue as 'AnswerIsTrue'
    from Question q
    inner join dbo.Answer a
    on q.QuizID = a.QuizID and q.ID = a.QuestionID
go;