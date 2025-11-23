(
select u.name as results from Users u
join MovieRating r on u.user_id = r.user_id
group by u.user_id
order by count(r.movie_id) desc, u.name asc
limit 1
)
UNION ALL 
(
select m.title as results from Movies m
join MovieRating r on m.movie_id = r.movie_id
where r.created_at between "2020-02-01" and "2020-02-29"
group by m.movie_id
order by (sum(r.rating) / count(r.user_id)) desc, m.title asc
limit 1
)