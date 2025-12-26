UPDATE Customer c
JOIN (
    SELECT u.CustID
    FROM 
        (
            SELECT c.CustID, c.City, SUM(p.Amount) as TotalSpent
            FROM Customer c
            JOIN SaleOrder s ON s.CustID = c.CustID
            JOIN Payment p ON p.OrderID = s.OrderID
            WHERE p.Status = 'PAID'
            GROUP BY c.CustID, c.City
        ) as u
    JOIN 
        (
            SELECT City, MAX(TotalSpent) as MaxSpent
            FROM (
                SELECT c.City, SUM(p.Amount) as TotalSpent
                FROM Customer c
                JOIN SaleOrder s ON s.CustID = c.CustID
                JOIN Payment p ON p.OrderID = s.OrderID
                WHERE p.Status = 'PAID'
                GROUP BY c.CustID, c.City
            ) as t
            GROUP BY City
        ) as m 
    ON u.City = m.City AND u.TotalSpent = m.MaxSpent
) as w ON c.CustID = w.CustID
SET c.Tier = 'TOP_CITY';