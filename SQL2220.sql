select h.name, h.num_beds, (o.beds_occupied * 100.0 / h.num_beds) as pct_occupied
from hospitals h
join occupancy o on o.hospital_id = h.id 
where h.state = 'New York'
order by pct_occupied desc