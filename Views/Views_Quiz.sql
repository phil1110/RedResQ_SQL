use RedResQ
go

create view V_Quiz
as
    select qz.ID as 'Quiz_ID', qz.name as 'Quiz_Name', qz.maxScore as 'Quiz_MaxScore', qz.TypeID as 'Quiz_TypeID', qt.ID as 'QuizType_ID', qt.name as 'QuizType_Name',
           qts.QuizTypeID as 'QuizTypeStage_QuizTypeID', qts.Stage as 'QuizTypeStage_Stage', qts.ImageID as 'QuizTypeStage_ImageID', I.ID as 'Image_ID',
           I.Description as 'Image_Description', I.bytes as 'Image_bytes', Q.QuizID as 'Question_QuizID', Q.ID as 'Question_ID', Q.text as 'Question_text',
           A.QuizID as 'Answer_QuizID', A.QuestionID as 'Answer_QuestionID', A.ID as 'Answer_ID', A.text as 'Answer_text', A.isTrue as 'Answer_isTrue'
    from Quiz qz
    inner join QuizType qt on qz.TypeID = qt.ID
    inner join QuizTypeStage qts on qt.ID = qts.QuizTypeID
    inner join dbo.Image I on I.ID = qts.ImageID
    inner join dbo.Question Q on qz.ID = Q.QuizID
    inner join dbo.Answer A on Q.QuizID = A.QuizID and Q.ID = A.QuestionID
go;