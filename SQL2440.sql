SELECT (t2019.recycling_rate - t2018.recycling_rate) AS rate_difference
FROM recycling_rates t2018
JOIN recycling_rates t2019 ON t2018.material = t2019.material
WHERE t2018.material = 'glass' AND t2018.year = 2018 AND t2019.year = 2019;