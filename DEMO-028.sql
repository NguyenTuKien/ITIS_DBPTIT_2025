select s1.SID, s1.SName from Supplier s1 
join Supply s2 on s1.SID = s2.SID 
join Product p on s2.PID = p.PID 
join Category c on c.CatID = p.CatID 
group by s1.SID, s1.SName 
having count(case when c.CatName = 'Electronics' then p.PID end) >= 2