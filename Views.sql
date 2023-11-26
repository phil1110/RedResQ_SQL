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

create view V_Article
as
select a.ID as [ArticleID], a.title, a.content, a.author, a.date, ln.ID as [LanguageID], ln.name, im.ID as [ImageID],
       im.source, lo.ID as [LocationID], lo.city, lo.postalCode, co.ID as [CountryID], co.country
from Article a
left join Language ln
on a.LanguageID = ln.ID
left join Image im
on a.ImageID = im.ID
left join Location lo
on a.LocationID = lo.ID
left join Country co
on lo.CountryID = co.ID;