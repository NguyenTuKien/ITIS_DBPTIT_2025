select h.name, h.capacity, count(pv.patient_id) as vaccinated from hospitals h
join patient_vaccinations pv on pv.hospital_id  = h.id 
where h.location = 'Nairobi'
group by h.name, h.capacity