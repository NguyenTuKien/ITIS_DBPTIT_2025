select sum(QuantitySold) as total_quantity from SalesData
where Gender = 'Women' and Size = 36 and SaleDate between '2025-05-01' and '2025-05-31'