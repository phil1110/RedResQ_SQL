use RedResQ
go

create table Coordinates
(
    [UserID]            bigint primary key foreign key references Person (ID),
    [Latitude]          float         not null,
    [Longitude]         float         not null,
    [NotificationToken] varchar(1000) not null,
    [Timestamp]         datetime
);
go