select Size, sum(QuantitySold) as total_quantity from SalesData 
where Gender = 'Women' and SaleDate between '2025-01-01' and '2025-12-31'
group by Size 
order by total_quantity desc, Size
limit 1