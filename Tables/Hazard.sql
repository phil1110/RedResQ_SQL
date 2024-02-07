use RedResQ
go

create table Hazard(
    [ID] bigint primary key identity (1,1),
    [Title] varchar(500) not null,
    [Latitude] float not null,
    [Longitude] float not null,
    [Radius] int not null,
    [TimeStamp] datetime not null,
    [HazardType] int foreign key references HazardType(id) on delete no action
);
go
