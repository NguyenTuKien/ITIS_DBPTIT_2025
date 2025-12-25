select h.name as name, 
       count(distinct pv.patient_id) as unique_patients, 
       count(pv.id) as total_shots
from hospitals h
left join patient_vaccinations pv on pv.hospital_id = h.id
and pv.date between '2022-03-01' and '2022-03-31'
where h.location = 'Nairobi'
group by h.name
order by unique_patients desc, total_shots desc