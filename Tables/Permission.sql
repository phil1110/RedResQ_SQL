USE RedResQ
GO

create table Permission
(
    [PermissionName] varchar(500) primary key not null,
    [RoleID] bigint foreign key references Role(ID) ON DELETE CASCADE
);
GO