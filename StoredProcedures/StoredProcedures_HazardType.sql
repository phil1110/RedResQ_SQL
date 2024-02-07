use RedResQ
go

create procedure SP_Ht_GetHazardTypes
as
    select *
    from HazardType
    order by ID
go;


create procedure SP_Ht_AddHazardType
    @name varchar(500)
as
    insert into HazardType(Name)
    values (@name)
go;

create procedure SP_Ht_EditHazardType
    @id int,
    @name varchar(500)
as
    update HazardType
    set Name = @name
    where ID = @id
go;

create procedure SP_Ht_DeleteHazardType
    @id int
as
    Delete from HazardType
    where ID = @id
go;