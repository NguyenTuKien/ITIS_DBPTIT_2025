select p.name as provider_name,
       sum(pg.power_generated) as total_power_generated
from provider p 
join region r on r.id = p.region_id and r.name = 'Midwest'
join renewable_source rs on rs.provider_id = p.id 
join power_generation  pg on pg.source_id = rs.id and pg.date between '2021-04-01' and '2021-06-30'
group by p.name
order by total_power_generated desc
limit 3