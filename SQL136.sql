select s.student_id, s.student_name, su.subject_name, count(e.subject_name) as attended_exams
from students s
cross join subjects su
left join examinations e on e.student_id = s.student_id and su.subject_name = e.subject_name
group by s.student_id, su.subject_name
order by s.student_id, su.subject_name