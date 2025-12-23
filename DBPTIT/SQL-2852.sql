select p.name as provider_name,
       sum(pg.power_generated) as total_power_generated
from provider p
join renewable_source rs on rs.provider_id = p.id
join power_generation pg on pg.source_id = rs.id 
join region r on r.id = p.region_id 
where r.name like '%st' 
and pg.date between '2021-01-01' and '2021-03-31' 
and rs.name in ('Wind', 'Solar')
and pg.power_generated != 0
group by p.name
having count(rs.name) = 2
order by sum(pg.power_generated) desc
limit 3