create view V_Permission
as
select p.PermissionName, r.ID, r.name
from Permission p
left join Role r
on p.RoleID = r.ID;