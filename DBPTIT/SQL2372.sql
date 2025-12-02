select round(sum(budget) * 1.0 / count(year), 4) as num_budget from 
(
select budget, year from ai_budget_usa
union all 
select budget, year from ai_budget_uk
union all
select budget, year from ai_budget_japan
) as ai_budget
where year between 2018 and 2020