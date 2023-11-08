create procedure LoginUsername
    @username varchar(255),
    @deviceId varchar(255),
    @password varchar(1000)
AS
select s.* from VSession as s
left join Person p
on s.PersonID = p.ID
where s.username = @username
and s.DeviceID = @deviceId
and p.password = @password
GO;

create procedure LoginEmail
    @email varchar(1000),
    @deviceId varchar(255),
    @password varchar(1000)
AS
select s.* from VSession as s
left join Person p
on s.PersonID = p.ID
where s.email = @email
and s.DeviceID = @deviceId
and p.password = @password
GO;

create procedure Register
    @username VARCHAR(255),
    @firstname VARCHAR(255),
    @lastname VARCHAR(255),
    @email VARCHAR(1000),
    @birthdate date,
    @password varchar(1000),
    @sex varchar(255),
