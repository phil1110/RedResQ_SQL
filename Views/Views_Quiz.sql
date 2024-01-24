create view V_Quiz
as
    select qz.ID, qz.name, qz.maxScore, qt.ID as 'QuizTypeID', qt.name as 'QuizType name', Q.QuizID as 'QuizID Q',
           Q.ID as 'QuestionID', Q.text as 'Question Text', A.QuizID as 'QuizID A', A.QuestionID as 'QuestionID A',
           A.ID as 'AnswerID', A.text as 'Answer Text', A.isTrue
    from Quiz qz
    inner join QuizType qt on qz.TypeID = qt.ID
    inner join dbo.Question Q on qz.ID = Q.QuizID
    inner join dbo.Answer A on Q.QuizID = A.QuizID and Q.ID = A.QuestionID
go;