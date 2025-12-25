select c.company_name,
       avg(case when e.gender = 'Female' then 1 else 0 end) * 100 as female_percentage,
       avg(case when e.gender = 'Male' then 1 else 0 end) * 100 as male_percentage
from companies c
join departments d on d.company_id = c.company_id 
join employees e on e.dept_id = d.dept_id 
group by c.company_name;