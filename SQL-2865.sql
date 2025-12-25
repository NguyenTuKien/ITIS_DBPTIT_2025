select h.name, 
       h.capacity,
       count(pv.id) as total_shots_mar2022,
       round(100.0 * count(pv.id) / capacity, 2) as utilization_pct
from hospitals h 
join patient_vaccinations pv on pv.hospital_id = h.id 
and pv.date between '2022-03-01' and '2022-03-31'
group by h.name, h.capacity
order by utilization_pct desc