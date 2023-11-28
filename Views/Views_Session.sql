create view V_Login
as
select p.ID as [PersonID], p.username, p.firstname, p.lastname, p.email, p.birthdate, ge.ID as [GenderID],
       ge.name as [GenderName], ln.ID as [LanguageID], ln.name as [LanguageName], lo.ID as [LocationID], lo.city,
       lo.postalCode, co.ID as [CountryID], co.country, r.ID as [RoleID], r.name as [RoleName]
from Person p
left join Gender ge
on p.GenderID = ge.ID
left join Language ln
on p.LanguageID = ln.ID
left join Location lo
on p.LocationID = lo.ID
left join Country co
on lo.CountryID = co.ID
left join Role r
on p.RoleID = r.ID
GO;