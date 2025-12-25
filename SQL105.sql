Select t.username, t.dept, t.number, c.title from Teaches t
Join Class c on t.dept = c.dept and t.number = c.number
Join Instructor i on t.username = i.username
Order by i.fname Asc
Limit 2