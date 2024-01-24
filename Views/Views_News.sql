create view V_Article
as
select a.ID as [ArticleID], a.title, a.content, a.author, a.date, ln.ID as [LanguageID], ln.name, im.ID as [ImageID],
       im.base64, co.ID as [CountryID], co.country
from Article a
left join Language ln
on a.LanguageID = ln.ID
left join Image im
on a.ImageID = im.ID
left join Country co
on a.CountryID = co.ID;