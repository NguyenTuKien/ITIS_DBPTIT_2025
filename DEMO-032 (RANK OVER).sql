UPDATE Customer c
JOIN (
    SELECT 
        c.CustID,
        RANK() OVER (PARTITION BY c.City ORDER BY SUM(p.Amount) DESC) as Ranking
    FROM Customer c
    JOIN SaleOrder s ON s.CustID = c.CustID
    JOIN Payment p ON p.OrderID = s.OrderID
    WHERE p.Status = 'PAID'
    GROUP BY c.CustID, c.City
) as TopSpenders ON c.CustID = TopSpenders.CustID
SET c.Tier = 'TOP_CITY'
WHERE TopSpenders.Ranking = 1;