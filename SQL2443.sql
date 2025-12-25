select vs.name from vessels vs 
left join voyages vy on vy.vessel_id = vs.id 
where vy.region = 'Arctic' and vy.cargo_weight > 5000
