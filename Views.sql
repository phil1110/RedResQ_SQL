use RedResQ
GO

create view VSession
as
SELECT s.ID as [SessionID], s.DeviceID, p.ID as [PersonID], p.username, p.firstname, p.lastname, p.email, p.birthdate,
       p.sex, lg.ID as [LanguageID], lg.name, ln.ID as [LocationID], ln.country, ln.region, ln.place,
       ln.postalCode
from Session s
left join Person p
on s.PersonID = p.ID
left join Language lg
on p.LanguageID = lg.ID
left join Location ln
on p.LocationID = ln.ID
go

select * from VSession