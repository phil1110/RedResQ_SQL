create view V_Location
as
select lo.ID, lo.city, lo.postalCode, co.ID as CountryID, co.country
from Location lo
left join Country co
on lo.CountryID = co.ID;