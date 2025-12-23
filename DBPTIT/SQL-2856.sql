select c.company_name, 
       round(1.0 * count(e.employee_id) / count(distinct d.dept_id), 2) as avg_employees_per_department
from companies c 
join departments d on d.company_id = c.company_id 
join employees e on e.dept_id = d.dept_id
group by c.company_name
order by avg_employees_per_department desc
limit 3