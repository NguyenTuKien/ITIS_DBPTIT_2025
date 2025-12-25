select 
  h.name as name, 
  pv.date as peak_date,
  count(pv.id) as peak_shots
from hospitals h
left join patient_vaccinations pv 
  on pv.hospital_id = h.id 
where pv.date = (
  select pvi.date from patient_vaccinations pvi
  where pvi.hospital_id = h.id
  group by pvi.date 
  order by count(pvi.id) desc 
  limit 1
)
group by name, peak_date
order by peak_shots desc
limit 3
