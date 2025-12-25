SELECT 
    it.initiative_name, 
    COUNT(DISTINCT ip.student_id) AS students_impacted
FROM impact ip 
JOIN initiatives it ON it.initiative_id = ip.initiative_id 
WHERE it.community_type = 'historically_underrepresented'
GROUP BY it.initiative_id, it.initiative_name
ORDER BY students_impacted DESC
LIMIT 5;