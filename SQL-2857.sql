select c.company_name, d.dept_name, avg(case when e.gender = 'Female' then 1 else 0 end) * 100.0 as female_percentage
from companies c 
join departments d on d.company_id = c.company_id
join employees e on e.dept_id = d.dept_id
group by c.company_name, d.dept_name 
having female_percentage >= 60
order by female_percentage desc, d.dept_name 