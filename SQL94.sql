select distinct l1.num as ConsecutiveNums from logs l1 
join logs l2 on l2.num = l1.num and l2.id = l1.id + 1
join logs l3 on l3.num = l1.num and l3.id = l1.id + 2
order by l1.num;