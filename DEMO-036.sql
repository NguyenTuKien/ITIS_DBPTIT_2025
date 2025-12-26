select c.CustID, c.CustomerName from Customer c 
join SaleOrder s on s.CustID = c.CustID 
join Payment p on p.OrderID = s.OrderID 
where p.Status = 'PAID'
group by c.CustID, c.CustomerName 
having sum(case when year(s.OrderDate) = 2023 then p.Amount else 0 end) >= 500
and sum(case when year(s.OrderDate) = 2024 then p.Amount else 0 end) >= 500