select scv.country from SupplyChainViolations scv
join Products p on p.country = scv.country
join ProductTransparency pt on p.product_id = pt.product_id
where pt.recycled_materials = TRUE and num_violations >= 1