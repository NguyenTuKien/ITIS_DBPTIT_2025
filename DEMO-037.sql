select s.OrderID, c.CustomerName, s.OrderDate, s.TotalAmount from SaleOrder s 
join Customer c on c.CustID = s.CustID 
order by s.OrderID