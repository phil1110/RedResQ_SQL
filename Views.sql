use RedResQ
GO;

create view V_Login
as
select *
from Person p
left join Language lg
on p.LanguageID = lg.ID
left join Location lo
on p.LocationID = lo.ID
left join Role r
on p.RoleID = r.ID
GO;