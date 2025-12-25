select us.union_status, wsi.incident_year, sum(wsi.incidents) as total_incidents 
from workplace_safety_incidents wsi
join union_status us on wsi.union_status_id = us.id 
join construction_sectors cs on wsi.sector_id  = cs.sector_id 
where wsi.incident_year in (2021, 2022)
group by us.union_status, wsi.incident_year
order by us.union_status
