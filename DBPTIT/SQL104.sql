select title as title
from Teaches t
join Class c
 on t.dept = c.dept
 and t.number = c.number
order by title desc;