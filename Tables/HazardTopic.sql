use RedResQ
go

create table HazardTopic(
    [ID] bigint primary key foreign key references Hazard(ID),
    [TopicName] varchar(500) unique
);
go