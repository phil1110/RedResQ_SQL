use RedResQ
go

create table Coordinates
(
    [UserID]            bigint primary key foreign key references Person (ID),
    [Longitude]         float         not null,
    [Latitude]          float         not null,
    [NotificationToken] varchar(1000) not null
);
go