select 
  cs.sector_name, 
  us.union_status,
  avg(wsi.incidents) as avg_incidents_2021_2022
from workplace_safety_incidents wsi
join union_status us on us.id = wsi.union_status_id
join construction_sectors cs on cs.sector_id = wsi.sector_id
where wsi.incident_year in (2021, 2022)
group by cs.sector_name, us.union_status
order by avg(wsi.incidents) desc