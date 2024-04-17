use RedResQ
go

create procedure STAT_Access_3_DailyAccessesFromLastWeek
as
    select top(7) concat(c.Day, '/', c.Month, '/', c.Year), c.Accesses
    from (
        select datepart(year, a.Timestamp) as [Year], datepart(month, a.Timestamp) as [Month],
        datepart(day, a.Timestamp) as [Day], count(*) as [Accesses]
        from Access a
        group by datepart(year, a.Timestamp),
            datepart(month, a.Timestamp),
            datepart(day, a.Timestamp)
         ) as c
    order by c.Year desc, c.Month desc, c.Day desc
go