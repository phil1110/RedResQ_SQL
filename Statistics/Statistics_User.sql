use RedResQ
go

create procedure STAT_User_2_UsersByGender
as
    select g.name, count(p.ID) as [Amount]
    from Person p
    right join Gender g
    on p.GenderID = g.ID
    group by g.name
    order by [Amount] desc
go