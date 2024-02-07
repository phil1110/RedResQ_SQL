use RedResQ
go

create trigger AddTimeStampInsert
on Coordinates
for INSERT
as
    update Coordinates
    set Timestamp = CURRENT_TIMESTAMP
    from Coordinates c
    inner join inserted i
    on c.UserID = i.UserID
go;

create trigger AddTimeStampUpdate
on Coordinates
for UPDATE
as
    update Coordinates
    set Timestamp = CURRENT_TIMESTAMP
    from Coordinates c
    inner join inserted i
    on c.UserID = i.UserID
go;