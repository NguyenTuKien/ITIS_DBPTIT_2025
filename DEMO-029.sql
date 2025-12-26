select c.CustID, c.CustomerName, sum(s.TotalAmount) as TotalSpent from Customer c 
join SaleOrder s on c.CustID = s.CustID
group by c.CustID, c.CustomerName
having sum(s.TotalAmount) >= 1000
and count(case when (s.TotalAmount >= 500 and year(s.OrderDate) = 2024) then s.OrderID end) > 0
