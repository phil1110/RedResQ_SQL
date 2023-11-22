create view V_Login
as
select p.*
from Person p
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