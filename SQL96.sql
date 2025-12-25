select eu.unique_id, e.name from employees e
left join employeeUNI eu on eu.id = e.id