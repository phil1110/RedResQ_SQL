use RedResQ
GO;

create view V_Login
as
select p.ID as 'PersonID', p.username, p.firstname, p.lastname, p.email, p.birthdate, p.hash, p.sex,
       lg.ID as 'LanguageID', lg.name as 'LanguageName',
       lo.ID as 'LocationID', lo.country, lo.city, lo.postalCode,
       r.ID as 'RoleID', r.name as 'RoleName'
from Person p
left join Language lg
on p.LanguageID = lg.ID
left join Location lo
on p.LocationID = lo.ID
left join Role r
on p.RoleID = r.ID
GO;

create view V_Article
as
select a.ID as [ArticleID], a.title, a.content, a.author, a.date, ln.ID as [LanguageID], ln.name, im.ID as [ImageID],
       im.source, lo.ID as [LocationID], lo.country, lo.city, lo.postalCode
from Article a
left join Language ln
on a.LanguageID = ln.ID
left join Image im
on a.ImageID = im.ID
left join Location lo
on a.LocationID = lo.ID;