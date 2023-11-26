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
    @countryId bigint,
    @articleId bigint = null
as
if (@articleId is null)
begin
    select top 10 *
    from V_Article va
    where va.CountryID = @countryId
    order by va.ArticleID desc
end
else
begin
    select top 10 *
    from V_Article va
    where va.CountryID = @countryId
    and va.ArticleID < @articleId
    order by va.ArticleID desc;
end
go

create procedure SP_Ne_LatestArticles_Language
    @languageId bigint,
    @articleId bigint = null
as
if (@articleId is null)
begin
    select top 10 *
    from V_Article va
    where va.LanguageID = @languageId
    order by va.ArticleID desc
end
else
begin
    select top 10 *
    from V_Article va
    where va.LanguageID = @languageId
    and va.ArticleID < @articleId
    order by va.ArticleID desc;
end
go

create procedure SP_Ne_LatestArticles_CountryAndLanguage
    @countryId bigint,
    @languageId bigint,
    @articleId int = null
as
if (@articleId is null)
begin
    select top 10 *
    from V_Article va
    where va.LanguageID = @languageId
    and va.CountryID = @countryId
    order by va.ArticleID desc
end
else
begin
    select top 10 *
    from V_Article va
    where va.LanguageID = @languageId
    and va.CountryID = @countryId
    and va.ArticleID < @articleId
    order by va.ArticleID desc;
end
go

create procedure SP_Ne_NewArticle
    @title varchar(255),
    @content varchar(max),
    @author varchar(255),
    @date datetime,
    @languageId int,
    @imageId int,
    @locationId int
as
    insert into Article (title, content, author, date, LanguageID, ImageID, LocationID)
    VALUES (@title, @content, @author, convert(datetime, @date), @languageId, @imageId, @locationId)
go;

create procedure SP_Ne_DeleteArticle
    @id int
as
delete
from Article
where ID = @id
go;