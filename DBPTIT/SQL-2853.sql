select p.name as provider_name,
       count(pg.date) as days_active,
       sum(pg.power_generated) as total_power_generated
from provider p
join renewable_source rs on rs.provider_id = p.id
join power_generation pg on pg.source_id = rs.id 
join region r on r.id = p.region_id 
where LOWER(r.name) like '%east%' 
and pg.date between '2021-02-01' and '2021-05-31' 
and rs.name = 'Solar'
group by p.name
order by count(pg.date) desc, sum(pg.power_generated) desc
limit 2