-- Stored Procedures for Get Requests
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

create procedure SP_Ne_SpecificArticle
    @id bigint
as
    select *
    from V_Article va
    where va.ArticleID = @id
go;

-- Stored Procedures for Post Requests
create procedure SP_Ne_NewArticle
    @title varchar(255),
    @content varchar(max),
    @author varchar(255),
    @date datetime,
    @languageId bigint,
    @imageId bigint,
    @locationId bigint
as
    insert into Article (title, content, author, date, LanguageID, ImageID, LocationID)
    VALUES (@title, @content, @author, convert(datetime, @date), @languageId, @imageId, @locationId)
go;

-- Stored Procedures for Put Requests
create procedure SP_Ne_UpdateArticle
    @id bigint,
    @title varchar(255) = null,
    @content varchar(max) = null
as
    if (@title is not null)
    begin
        update Article
        set title = @title
        where ID = @id
    end
    if (@content is not null)
    begin
        Update Article
        set content = @content
        where ID = @id
    end
go;

-- Stored Procedures for Delete Requests
create procedure SP_Ne_DeleteArticle
    @id bigint
as
delete
from Article
where ID = @id
go;