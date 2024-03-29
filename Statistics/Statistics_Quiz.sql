use RedResQ
go

create procedure STAT_Quiz_LeastAttempts
as
    select top(25) CONCAT(q.name, ' (ID: ', q.ID, ')') as [Name], COUNT(*) as [Attempts]
    from Quiz q
    left join Attempt a
    on q.ID = a.QuizID
    group by q.ID, q.name
    order by [Attempts]
go

create procedure STAT_Quiz_MostAttempts
as
    select top(25) CONCAT(q.name, ' (ID: ', q.ID, ')') as [Name], COUNT(*) as [Attempts]
    from Quiz q
    left join Attempt a
    on q.ID = a.QuizID
    group by q.ID, q.name
    order by [Attempts] desc
go
