select m.name from Employee m
join Employee e on m.id = e.managerId
group by m.id
having count(m.id) > 4