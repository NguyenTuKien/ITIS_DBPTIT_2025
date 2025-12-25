select ProductID, sum(QuantitySold) as total_quantity from SalesData 
where Gender = 'Women' and SaleDate between '2025-01-01' and '2025-12-31'
group by ProductID 
having sum(QuantitySold) >= 10 
order by total_quantity desc