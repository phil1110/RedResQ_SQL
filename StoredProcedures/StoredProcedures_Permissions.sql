create PROCEDURE SP_Pm_GetPermission
    @permissionName varchar(500)
as
    select vp.*
    from V_Permission vp
    where vp.PermissionName = @permissionName
go;

create procedure SP_Pm_GetAllPermissions
as
    select vp.*
    from V_Permission vp
go;

create procedure SP_Pm_GetAllPermissionsForRole
    @roleId bigint
as
    select v.*
    from V_Permission v
    where v.ID <= @roleId
go;

create procedure SP_Pm_UpdateProcedure
    @permissionName varchar(500),
    @roleId bigint
as
    update Permission
    set RoleID = @roleId
    where PermissionName = @permissionName
go;