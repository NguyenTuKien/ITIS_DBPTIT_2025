select name, capacity from hospitals
where id not in (
  select distinct hospital_id from patient_vaccinations
  where date between '2022-03-01' and '2022-03-31'
)
order by name 
