SELECT si.student_id, si.name
FROM student_info si
JOIN student_disability_accommodations sda
ON si.student_id = sda.student_id
GROUP BY si.student_id, si.name
HAVING COUNT(DISTINCT sda.department) > 1;