create procedure SP_Ne_LatestArticles_Global
    @articleId bigint = null
as
if (@articleId is null)
begin
    select top 10 *
    from V_Article va
    order by va.ArticleID desc;
end
else
begin
    select top 10 *
    from V_Article va
    where va.ArticleID < @articleId
    order by va.ArticleID desc;
end
go

create procedure SP_Ne_LatestArticles_Country
    @country VARCHAR(500),
    @articleId bigint = null
as
if (@articleId is null)
begin
    select top 10 *
    from V_Article va
    where va.country = @country
    order by va.ArticleID desc
end
else
begin
    select top 10 *
    from V_Article va
    where va.country = @country
    and va.ArticleID < @articleId
    order by va.ArticleID desc;
end
go

create procedure SP_Ne_LatestArticles_Language
    @language VARCHAR(500),
    @articleId bigint = null
as
if (@articleId is null)
begin
    select top 10 *
    from V_Article va
    where va.name = @language
    order by va.ArticleID desc
end
else
begin
    select top 10 *
    from V_Article va
    where va.name = @language
    and va.ArticleID < @articleId
    order by va.ArticleID desc;
end
go

create procedure SP_Ne_LatestArticles_CountryAndLanguage
    @country VARCHAR(500),
    @language VARCHAR(500),
    @articleId int = null
as
if (@articleId is null)
begin
    select top 10 *
    from V_Article va
    where va.name = @language
    and va.country = @country
    order by va.ArticleID desc
end
else
begin
    select top 10 *
    from V_Article va
    where va.name = @language
    and va.country = @country
    and va.ArticleID < @articleId
    order by va.ArticleID desc;
end
go

create procedure SP_Ne_NewArticle
    @title varchar(255),
    @content varchar(max),
    @author varchar(255),
    @date date,
    @languageId int,
    @imageId int,
    @locationId int
as
    insert into Article (title, content, author, date, LanguageID, ImageID, LocationID)
    VALUES (@title, @content, @author, @date, @languageId, @imageId, @locationId)
go;

create procedure SP_Ne_DeleteArticle
    @id int
as
delete
from Article
where ID = @id
go;