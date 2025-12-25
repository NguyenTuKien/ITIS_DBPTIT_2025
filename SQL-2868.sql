select cs.sector_name, us.union_status, sum(wsi.incidents) as  total_incidents
from workplace_safety_incidents wsi
join union_status us on us.id = wsi.union_status_id
join construction_sectors cs on cs.sector_id = wsi.sector_id
where wsi.incident_year between '2021-01-01' and '2022-12-31'
group by cs.sector_name, us.union_status
order by cs.sector_name, us.union_status