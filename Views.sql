use RedResQ_Test
GO;

create view V_Login
as
select p.ID as 'PersonID', p.username, p.firstname, p.lastname, p.email, p.birthdate, p.hash, p.sex,
       lg.ID as 'LanguageID', lg.name,
       lo.ID as 'LocationID', lo.country, lo.city, lo.postalCode,
       r.ID as 'RoleID', r.name
from Person p
left join Language lg
on p.LanguageID = lg.ID
left join Location lo
on p.LocationID = lo.ID
left join Role r
on p.RoleID = r.ID
GO;