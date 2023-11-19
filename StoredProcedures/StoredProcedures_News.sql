use RedResQ
go

create procedure SP_Ne_LatestArticles_Global
    @articleId int = null
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
    order by va.date desc;
end
go

create procedure SP_Ne_LatestArticles_Country
    @country VARCHAR(500),
    @articleId int
as
if (@articleId is null)
begin
    select top 10 *
    from V_Article va
    where va.country = @country
    order by va.ArticleID desc;
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