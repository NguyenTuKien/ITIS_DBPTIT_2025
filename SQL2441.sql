select ii.project, ii.location, ii.amount, ef.environment, ef.social , ef.governance 
from impact_investments ii
join esg_factors ef on ii.company_id = ef.company_id
where ii.sector = 'Renewable Energy'
and ef.environment + ef.social + ef.governance > 7.5
