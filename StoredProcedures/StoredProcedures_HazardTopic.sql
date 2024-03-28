use RedResQ
go

create procedure SP_Hc_AddTopic
    @hazardId bigint,
    @topicName varchar(500)
as
    insert into HazardTopic (ID, TopicName)
    VALUES (@hazardId, @topicName)
go;

create procedure SP_Hc_GetTopics
    @lat float,
    @lon float
as
    declare @point geography = geography::Point(@lat, @lon, 4326);

    select ht.TopicName
    from HazardTopic ht
    left join Hazard hz
    on ht.ID = hz.ID
    where @point.STDistance(geography::Point(hz.Latitude, hz.Longitude, 4326)) <= hz.Radius
go;