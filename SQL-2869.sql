SELECT 
  us.union_status,
  SUM(CASE WHEN wsi.incident_year = 2021 THEN wsi.incidents ELSE 0 END) AS incidents_2021,
  SUM(CASE WHEN wsi.incident_year = 2022 THEN wsi.incidents ELSE 0 END) AS incidents_2022,
  SUM(CASE WHEN wsi.incident_year = 2022 THEN wsi.incidents ELSE 0 END) - 
  SUM(CASE WHEN wsi.incident_year = 2021 THEN wsi.incidents ELSE 0 END) AS delta_2022_vs_2021
FROM union_status us
LEFT JOIN workplace_safety_incidents wsi 
  ON wsi.union_status_id = us.id 
  AND wsi.incident_year IN (2021, 2022)
GROUP BY us.union_status
ORDER BY us.union_status;