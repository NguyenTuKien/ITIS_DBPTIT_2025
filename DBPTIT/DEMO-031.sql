insert into VipCustomer
select c.CustID, c.CustomerName, c.City, sum(so.TotalAmount) 
from Customer c
join SaleOrder so on so.CustID = c.CustID 
where so.OrderDate between '2024-01-01' and '2024-12-31'
group by c.CustID
having sum(so.TotalAmount) >= 2000