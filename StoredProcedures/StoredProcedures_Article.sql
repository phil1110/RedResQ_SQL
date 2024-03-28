use RedResQ
go

-- Stored Procedures for Get Requests
CREATE PROCEDURE SP_Ar_FetchArticles
    @articleId BIGINT = NULL,
    @countryId BIGINT = NULL,
    @languageId BIGINT = NULL,
    @query varchar(max) = null
AS
BEGIN
    SELECT TOP 10 *
    FROM V_Article
    WHERE (@countryId IS NULL OR CountryID = @countryId)
        AND (@languageId IS NULL OR LanguageID = @languageId)
        AND (@articleId IS NULL OR ArticleID < @articleId)
        And (@query is null or
             (title like '%' + @query + '%'
                or content like '%' + @query + '%'))
    ORDER BY ArticleID DESC;
END
GO;

create procedure SP_Ar_SpecificArticle
    @id bigint
as
    select *
    from V_Article va
    where va.ArticleID = @id
go;

-- Stored Procedures for Post Requests
create procedure SP_Ar_NewArticle
    @title varchar(255),
    @content varchar(max),
    @author varchar(255),
    @date datetime,
    @languageId bigint,
    @imageId bigint,
    @countryId bigint
as
    insert into Article (title, content, author, date, LanguageID, ImageID, CountryID)
    VALUES (@title, @content, @author, convert(datetime, @date), @languageId, @imageId, @countryId)
go;

-- Stored Procedures for Put Requests
CREATE PROCEDURE SP_Ar_UpdateArticle
    @id BIGINT,
    @title VARCHAR(255) = NULL,
    @content VARCHAR(MAX) = NULL
AS
BEGIN
    UPDATE Article
    SET title = ISNULL(@title, title),
        content = ISNULL(@content, content)
    WHERE ID = @id;
END
GO;

-- Stored Procedures for Delete Requests
create procedure SP_Ar_DeleteArticle
    @id bigint
as
    delete
    from Article
    where ID = @id
go;