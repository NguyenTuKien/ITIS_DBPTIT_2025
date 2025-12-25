select (count(VaccinationID) * 100.0) / 
  (select count(VaccinationID) from Vaccinations 
  where City = 'Sydney') 
as "Female_Percentage_Sydney(%)"
from Vaccinations 
where City = 'Sydney' and Gender = 'Female'
