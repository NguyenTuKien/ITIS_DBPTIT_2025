select r.lead_researcher from research r 
join gene g on g.research_id = r.id 
group by g.research_id
order by count(g.id) desc 
limit 1