select p.name as provider_name,
       sum(pg.power_generated) as total_power_generated
from provider p
join renewable_source rs on rs.provider_id = p.id
join power_generation pg on pg.source_id = rs.id 
join region r on r.id = p.region_id 
where r.name != 'Midwest' and pg.date not between '2021-04-01' and '2021-06-03' and rs.name = 'Solar'
group by p.name 
order by sum(pg.power_generated) desc
limit 3