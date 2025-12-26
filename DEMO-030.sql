select c.CustID, c.CustomerName, sum(s.TotalAmount) as TotalSpent from Customer c 
join SaleOrder s on s.CustID = c.CustID 
where year(s.OrderDate) = 2024
group by c.CustID, c.CustomerName 
having sum(s.TotalAmount) >= 1000
and count(case when s.Status = 'CANCELLED' then 1 end) = 0
